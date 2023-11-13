# Bot do Almoço para Telegram

Bot para liberar o almoço feito para Telegram. Para executa-lo, é necessário um token de acesso para o bot. Siga as instruções abaixo para executa-lo localmente ou em um container Docker.


## Dart Run
**Passo 1:**
Execute o comando abaixo na raiz do projeto para baixar as dependências necessárias
```
dart pub get
```

**Passo 2:**
Substitua **{BOT_TOKEN}** pelo token gerado no Telegram.
```
dart run --define=BOT_TOKEN={BOT_TOKEN} bin/bot_almoco.dart
```

## Dart Compile
**Passo 1:**
Execute o comando abaixo na raiz do projeto para baixar as dependências necessárias

```
dart pub get
```

**Passo 2:**
Substitua **{BOT_TOKEN}** pelo token gerado no Telegram. Será gerado o executável na pasta **bin/**
```
dart compile exe --define=BOT_TOKEN={BOT_TOKEN} bin/bot_almoco.dart
```

## Docker Run
**Passo 1:**
Crie a imagem do Docker executando o comando abaixo na raiz do projeto, substituindo **{BOT_TOKEN}** pelo token gerado no Telegram.
```
docker build --build-arg BOT_TOKEN={BOT_TOKEN} -t dart-bot-server:latest .
```

**Passo 2:**
Execute a imagem do Docker com o comando
```
docker run -it --rm -p 8080:8080 --name dart-telegram-bot-server dart-bot-server
```