import 'package:flutter/material.dart';
import 'package:sky_vision/components/app_bar.dart';
import 'package:sky_vision/components/main_title.dart';
import 'package:sky_vision/components/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainTitle(
              text: 'Bem-vindo ao Sky Vision',
            ),
            menuCard(
              textMenu: 'Acessar o Sky Vision',
              iconModel: Icons.login,
              clickFuncion: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
            menuCard(
              textMenu: 'Sobre o Sky Vision',
              iconModel: Icons.info,
              clickFuncion: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Cadastre-se',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
