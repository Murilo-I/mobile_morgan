import 'package:flutter/material.dart';

import '../components/message_component.dart';
import '../components/morgan.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Variável dinâmica para poder adicionar mensagens
  // na tela através do floatingActionButton
  List<Message> messages = <Message>[];

  // Controller para lermos os dados vindos do campo de texto digitado
  // e posteriormente utilizar este texto para add na lista de mensagens
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          // Atualiza o estado da aplicação para a tela ser reconstruída
          // e exibir a nova mensagem na lista
          setState(() {
            String msg = _messageController.text.toLowerCase();
            // Adiciona a mensagem na lista
            messages.add(UserMessage(msg));

            // Morgan responde a mensagem
            Morgan.responde(msg, messages);

            // Limpa o campo de texto após adicionar a mensagem
            _messageController.text = "";
          });
        },
      ),
      backgroundColor: Colors.blue.shade900,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset('images/morgan_icon.png', height: 200),

            // Expanded para dar a altura e largura máxima disponíveis para a lista.
            // Ocupando todo o espaço que não for utilizado pela logo e campo de texto
            Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    print(index);
                    return messages[index];
                  }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 70, 0),
              child: TextField(
                controller: _messageController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  hintText: 'Type here...',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
