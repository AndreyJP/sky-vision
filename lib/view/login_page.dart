import 'package:flutter/material.dart';
import 'package:sky_vision/components/app_bar.dart';
import 'package:sky_vision/components/elevated_button.dart';
import 'package:sky_vision/components/form_text_field.dart';
import 'package:sky_vision/components/main_title.dart';
import 'package:sky_vision/controller/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mainTitle(text: 'Entrar no Sky Vision'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormTextField(
                  labelText: 'E-mail',
                  hintText: 'E-mail',
                  textController: _emailController,
                  inputType: TextInputType.emailAddress,
                  inputValidator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Por favor, preencha o campo e-mail';
                    } else if (!email.contains('@')) {
                      return 'Por favor, informe um e-mail válido';
                    }
                    return null;
                  },
                ),
                FormTextField(
                  labelText: 'Senha',
                  hintText: 'Senha',
                  textController: _passwordController,
                  obscureText: true,
                  inputValidator: (passwd) {
                    if (passwd == null || passwd.isEmpty) {
                      return 'Por favor, preencha o campo senha';
                    } else if (passwd.length < 8) {
                      return 'Por favor, informe uma senha válida';
                    }
                    return null;
                  },
                ),
                mainButton(
                  buttonText: 'Entrar',
                  buttonCollor: const Color(0xFF2a4688),
                  buttonFunction: () async {
                    final navigator = Navigator.of(context);
                    final messenger = ScaffoldMessenger.of(context);

                    if (_formKey.currentState!.validate()) {
                      bool loginSucesso = await UserController.instance.login(
                          _emailController.text, _passwordController.text);

                      if (loginSucesso) {
                        navigator.pushNamed('/skyvision/search');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'As credencias informadas estão incorretas'),
                            backgroundColor: Color.fromARGB(255, 219, 104, 81),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
