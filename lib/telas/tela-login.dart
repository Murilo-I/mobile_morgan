import 'package:flutter/material.dart';
import 'package:mobile_morgan/telas/tela-principal.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 440,
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade900,
                blurRadius: 25,
                spreadRadius: 5,
                offset: Offset(15, 15),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: _buildForm(context),
          ),
        ),
      ),
      backgroundColor: Colors.indigo.shade900,
    );
  }

  Widget _buildForm(context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Text(
            'Faça o Login',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: _usernameController,
            validator: (value) {
              if (value.isEmpty) return 'Username obrigatório!';
              return null;
            },
            maxLength: 25,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              contentPadding: const EdgeInsets.all(0.0),
              hintText: 'Username',
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _senhaController,
            validator: (value) {
              if (value.isEmpty) return 'Senha obrigatória!';
              return null;
            },
            maxLength: 15,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              contentPadding: const EdgeInsets.all(0.0),
              hintText: 'Senha',
            ),
          ),
          SizedBox(height: 20),
          Text('Esqueceu a senha?',
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).primaryColor)),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState.validate()) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => TelaPrincipal()),
                    (route) => false);
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0000AF),
                    Color(0xFF0088FF),
                  ],
                ),
              ),
              padding: const EdgeInsets.fromLTRB(
                  double.infinity, 12, double.infinity, 12),
              child: const Text('Login',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _cadastrar,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(12),
              child: const Text('Cadastre-se', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  _cadastrar() async {
    const url = 'http://127.0.0.1:5000/morgan_assistant/registrar';
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }
}
