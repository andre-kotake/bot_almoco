import 'dart:async';

import 'package:bot_almoco/controller/bot_controller.dart';

Future<void> main(List<String> args) async {
  const botToken = String.fromEnvironment("BOT_TOKEN");
  const botController = BotController(botToken);
  await botController.initBot();
}
