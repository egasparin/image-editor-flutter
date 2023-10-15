// import 'package:crop_image/crop_image.dart';
// import 'package:flutter/material.dart';

// class CropPage extends StatefulWidget {
//   const CropPage({Key? key}) : super(key: key);

//   @override
//   State<CropPage> createState() => _CropPageState();
// }

// class _CropPageState extends State<CropPage> {
//   final controller = CropController();
//   var _image = Image.asset('./images/imagem.jpg');
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                   child: CropImage(
//                 controller: controller,
//                 image: _image,
//                 // image:Image.asset('./images/imagem.jpg'),
//                 paddingSize: 25.0,
//                 alwaysMove: true,
//               )),
//               _buildCropButtons(),
//             ],
//           ),
//         ),
//       );

//   Widget _buildCropButtons() => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.settings_backup_restore),
//             onPressed: _originalRatio,
//           ),
//           IconButton(
//             icon: const Icon(Icons.aspect_ratio),
//             onPressed: _freeRatio,
//           ),
//           IconButton(
//             icon: const Icon(Icons.one_x_mobiledata_rounded),
//             onPressed: _equalRatio,
//           ),
//           IconButton(
//             icon: const Icon(Icons.image_aspect_ratio_rounded),
//             onPressed: _photoRatio,
//           ),
//           IconButton(
//             icon: const Icon(Icons.check_outlined),
//             onPressed: _finished,
//           ),
//         ],
//       );

//   Future<void> _originalRatio() async {
//     controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
//     controller.aspectRatio = 1.0;
//   }

//   Future<void> _freeRatio() async {
//     const value = -1.0;
//     controller.aspectRatio = value == -1 ? null : value;
//     controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
//   }

//   Future<void> _equalRatio() async {
//     const value = 1.0;
//     controller.aspectRatio = value == -1 ? null : value;
//     controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
//   }

//   Future<void> _photoRatio() async {
//     const value = (3 / 4);
//     controller.aspectRatio = value == -1 ? null : value;
//     controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
//   }

//   Future<void> _finished() async {
//     final croppedImage = await controller.croppedImage();
//     setState(() {
//       _image = croppedImage;
//     });
//     // aqui tem que fazer apresenta a imagem editada
//     // ignore: use_build_context_synchronously
//     await showDialog<bool>(
//       context: context,
//       builder: (context) {
//         return SimpleDialog(
//           contentPadding: const EdgeInsets.all(6.0),
//           titlePadding: const EdgeInsets.all(8.0),
//           children: [
//             const SizedBox(height: 5),
//             _image,
//             TextButton(
//               onPressed: () => Navigator.pop(context, true),
//               child: const Text('Voltar'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
