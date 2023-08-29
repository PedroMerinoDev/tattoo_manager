import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            child: const Image(image: AssetImage('lib/ui/assets/logo.png')),
          ),
          Text('Login'.toUpperCase()),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Senha', icon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.login),
                  label: Text('Entrar'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                  label: Text('Criar Conta xD'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
