import 'package:flutter/material.dart';
import '../widgets/background.dart';
import '../widgets/select_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Simple Editor"),
          centerTitle: true,
          backgroundColor: Colors.green.shade500,
          actions: <Widget>[
            // botão que levará para a pagina de configuração
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ]),
      body: const Stack(alignment: Alignment.center, children: <Widget>[
        Background(),
        SelectImage(),
      ]), // bottomNavigationBar: ,
    );
  }
}
