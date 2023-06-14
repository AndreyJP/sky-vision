import 'package:flutter/material.dart';
import 'package:sky_vision/components/app_bar.dart';
import 'package:sky_vision/components/form_text_field.dart';
import 'package:sky_vision/components/snack_bar.dart';
import 'package:sky_vision/controller/city_controller.dart';

import '../components/main_title.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final _cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mainTitle(text: 'Pesquise uma cidade'),
          FormTextField(
            labelText: 'Cidade',
            hintText: 'Cidade',
            textController: _cityNameController,
          ),
          IconButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              final messenger = ScaffoldMessenger.of(context);

              if (_cityNameController.text.isNotEmpty) {
                bool pesquisaSucesso = await CityController.instance
                    .getCity(_cityNameController.text);

                if (pesquisaSucesso) {
                  navigator.pushNamed('/skyvision/city');
                } else {
                  messenger.showSnackBar(
                    const SnackBar(
                      content: Text('Nenhuma cidade encontrada'),
                      backgroundColor: Color.fromARGB(255, 219, 104, 81),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBar(
                    message: 'Preencha o campo de pesquisa!',
                    color: const Color.fromARGB(255, 219, 155, 81)
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.search,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
