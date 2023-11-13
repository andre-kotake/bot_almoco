# Use latest stable channel SDK.
FROM dart:stable AS build

ARG BOT_TOKEN

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe --define=BOT_TOKEN=${BOT_TOKEN} bin/bot_almoco.dart -o bin/telegram-bot

# Build minimal serving image from AOT-compiled `/telegram-bot`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/telegram-bot /app/bin/

# Start server.
EXPOSE 8080
CMD ["/app/bin/telegram-bot"]