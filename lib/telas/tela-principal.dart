import 'package:flutter/material.dart';
import 'package:mobile_morgan/components/open_menu.dart';
import 'package:mobile_morgan/db/historico_conversa.dart';

import '../components/message_component.dart';
import '../components/morgan.dart';

class TelaPrincipal extends StatefulWidget {
  final List<Message> _messages = <Message>[];

  final TextEditingController _messageController = TextEditingController();

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          setState(() {
            String msg = widget._messageController.text.toLowerCase();

            salvarConversa(Conversa(msg, "user"));

            Morgan.responde(msg);

            widget._messageController.text = "";
          });
        },
      ),
      backgroundColor: Colors.blue.shade900,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () => openMenu(context),
              child: Image.asset('images/morgan_icon.png', height: 200),
            ),
            SizedBox(height: 12),
            Expanded(
              child: FutureBuilder(
                future: trazerHistorico(),
                builder: (context, snapshot) {
                  List<Conversa> conversas = snapshot.data;

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              Text(
                                'Carregando histórico',
                                style: TextStyle(color: Colors.white),
                              ),
                            ]),
                      );
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      for (var conversa in conversas) {
                        if (conversa.remetente == 'user')
                          widget._messages.add(UserMessage(conversa.texto));
                        else
                          widget._messages.add(MorganMessage(conversa.texto));
                      }
                      return ListView.builder(
                          itemCount: widget._messages.length,
                          itemBuilder: (context, index) =>
                              widget._messages[index]);
                      break;
                  }

                  return Center(child: Text('Erro desconhecido!'));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 70, 0),
              child: TextField(
                controller: widget._messageController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  hintText: 'Digite Aqui...',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
