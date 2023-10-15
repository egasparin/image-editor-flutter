// import 'package:flutter/material.dart';

// // tem que receber como variavel o controlador da da variavel
// // 'editorKey' para resetar os valores dos parametros

// class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
//   // passo o valor das variaveis necessarias, como por exemplo
//   final numero;

//   // deve-se declarar a classe no contrutor
//   const BuildAppBar({super.key, this.numero});

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Text("Edition"),
//       centerTitle: true,
//       backgroundColor: Colors.green.shade500,
//       actions: <Widget>[
//         // tem que ver se precisa o botão de retorno Navigator pop
//         // criar o botão que volta aos valores originais
//         IconButton(
//           icon: const Icon(Icons.settings_backup_restore),
//           // na funcao onpressed deve-se restaurar a imagem original
//           // a funcao esta no controlador da variavel 'editorKey'..
//           onPressed: () {
//             reset;
//           },
//         ),
//         // esse botão deve enviar para a proxima pagina, salvando as mudancas na foto
//         IconButton(
//           icon: const Icon(Icons.check_outlined),
//           // na funcao onpressed deve-se ir para a proxima janela (compartilhamento)
//           // essa funcao é mais complicada (devo olhar ela no fim)
//           onPressed: () {
//             editAndSave;
//           },
//         ),
//       ],
//     );
//   }
// }
