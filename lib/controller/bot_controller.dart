import 'dart:math';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:bot_almoco/model/sticker.dart';

class BotController {
  final String botToken;

  const BotController(this.botToken);

  Future<void> initBot() async {
    try {
      print("Iniciando bot...");

      if (botToken.isEmpty) {
        throw Exception("Não foi possível localizar o valor de BOT_TOKEN.");
      }

      final user = await Telegram(botToken).getMe();
      final username = user.username;
      final teledart = TeleDart(botToken, Event(username!));

      teledart.start();
      teledart
          .onMessage(keyword: RegExp(r"(j[áa]\s+pode)", caseSensitive: false))
          .listen(_replyMessage);

      print("Bot iniciado com sucesso.");
    } on Exception catch (e) {
      print("Erro ao iniciar bot: ${e.toString()}");
    }
  }

  void _replyMessage(message) {
    print("Mensagem recebida de: ${message.from!.firstName}");
    message.replySticker(_getRandomSticker().fileId);
  }

  Sticker _getRandomSticker() {
    final rnd = Random();
    return Stickers.list[rnd.nextInt(Stickers.list.length)];
  }
}
