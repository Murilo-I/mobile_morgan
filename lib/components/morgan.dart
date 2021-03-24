import 'message_component.dart';

// Classe que contém a lógica das respostas da morgan
class Morgan {
  static responde(String msg, List<Message> messages) {
    if (msg.contains("oi morgan")) {
      messages.add(MorganMessage("Olá, como posso te ajudar?"));
    }
  }
}
