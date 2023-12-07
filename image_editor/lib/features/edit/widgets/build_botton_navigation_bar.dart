import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/page_index_controller.dart';

class BuildBottonNavigationBar extends StatelessWidget {
  final PageIndexController pageIndexController;

  const BuildBottonNavigationBar({
    super.key,
    required this.pageIndexController,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BottomNavigationBar(
        currentIndex: pageIndexController.value,

        // Definindo a cor dos itens por seleção
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.green.shade500,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_fix_high_sharp),
            label: 'Ajustes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop),
            label: 'Corte',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.screen_rotation_alt_outlined,
            ),
            label: 'Rotação',
          ),
        ],

        // quando selecionado um item, atualiza o index da pagina
        onTap: (index) => pageIndexController.setValue(index),
      );
    });
  }
}

//// implementação stateful
// class BuildBottonNavigationBar extends StatefulWidget {
  
//   const BuildBottonNavigationBar({super.key});

//   // essa classe somente altera a pagina e opcoes apresetnadas
//   // na barra de navegacao
//   // talvez tenha que receber tambem o controlador do 'editorKey'

//   @override
//   State<BuildBottonNavigationBar> createState() => _BottonNavigationBarState();
// }

// class _BottonNavigationBarState extends State<BuildBottonNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,

//       // Definindo a cor dos itens por seleção
//       unselectedItemColor: Colors.black,
//       selectedItemColor: Colors.white,

//       backgroundColor: Colors.green.shade500,

//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.auto_fix_high_sharp),
//           label: 'Adjusts',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.crop),
//           label: 'Crop',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.screen_rotation_alt_outlined,
//           ),
//           label: 'Rotate',
//         ),
//       ],

//       // quando selecionado um item, atualiza o index da pagina
//       onTap: (index) {
//         // altera o valor da pagina selecionada
//         setState(() {
//           _currentIndex = index;
//         });

//         switch (index) {
//           case 0:
//             editorKey.currentState?.build(context);
//             break;
//           case 1:
//             // essa função realiza o processo de corte da imagem
//             editorKey.currentState?.getCropRect;
//             break;
//           case 2:
//             // funcao que chama a ferramenta de rotacao
//             break;
//         }
//       },
//     );
//   }
// }
