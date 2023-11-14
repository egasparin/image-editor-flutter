// essa era a funcao que estava sendo usada e funcionando até a data
// de 13/11/2023. Foi substituida pela new_edit_page.dart

import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_editor/image_editor.dart';
import 'package:simple_image_editor/features/edit/widgets/build_app_bar.dart';
import 'package:simple_image_editor/features/edit/widgets/build_image.dart';
import '../../share/presentation/save_image.dart';
import '../widgets/build_botton_navigation_bar.dart';

import '../controller/adjust_controller.dart';
import '../controller/aspect_ratio_controller.dart';
import '../controller/editor_key_controller.dart';
import '../controller/page_index_controller.dart';
import '../widgets/build_page_options.dart';
import 'color_filter.dart';

class OldEditPage extends StatefulWidget {
  final List arguments;
  const OldEditPage({super.key, required this.arguments});

  @override
  State<OldEditPage> createState() => _NewEditPageState();
}

class _NewEditPageState extends State<OldEditPage> {
  late File image;
  @override
  void initState() {
    super.initState();
    image = widget.arguments[0];
  }

  // declaração de todos os controladores utilizados
  PageIndexController pageIndexController = PageIndexController();
  AspectRatioController aspectRatioController = AspectRatioController();
  EditorKeyController editorKeyController = EditorKeyController();
  AdjustController saturationController = AdjustController();
  AdjustController brightnessController = AdjustController();
  AdjustController contrastController = AdjustController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      appBar: BuildAppBar(
        saturationController: saturationController,
        brightnessController: brightnessController,
        contrastController: contrastController,
        editorKeyController: editorKeyController,
        image: image,
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              // child: buildImage(),
              child: BuildImage(
                  image: image,
                  saturationController: saturationController,
                  brightnessController: brightnessController,
                  contrastController: contrastController,
                  editorKeyController: editorKeyController,
                  aspectRatioController: aspectRatioController,
                  pageIndexController: pageIndexController),
            ),
            //colocar a barra de edicao de atributos ou posição
            PageOptions(
              saturationController: saturationController,
              brightnessController: brightnessController,
              contrastController: contrastController,
              aspectRatioController: aspectRatioController,
              editorKeyController: editorKeyController,
              pageIndexController: pageIndexController,
            )
          ]),
      bottomNavigationBar: BuildBottonNavigationBar(
        pageIndexController: pageIndexController,
      ), // bottomNavigationBar: ,
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Text("Edition"),
      centerTitle: true,
      backgroundColor: Colors.green.shade500,
      actions: <Widget>[
        // tem que ver se precisa o botão de retorno Navigator pop
        // criar o botão que volta aos valores originais
        IconButton(
          icon: const Icon(Icons.settings_backup_restore),
          // na funcao onpressed deve-se restaurar a imagem original
          onPressed: () {
            editorKeyController.reset();
            contrastController.reset();
            brightnessController.reset();
            saturationController.reset();
          },
        ),
        // esse botão deve enviar para a proxima pagina, salvando as mudancas na foto
        IconButton(
          icon: const Icon(Icons.check_outlined),
          // na funcao onpressed deve-se ir para a proxima janela (compartilhamento)
          onPressed: () => editAndSave(),
        ),
      ],
    );
  }

  // construção do view de apresentação da imagem
  Widget buildImage() {
    return Observer(builder: (context) {
      // variaveis observadas pelo observer
      // tem que ser declarada aqui pois somente é acessada
      // fora do contexto deste widget
      aspectRatioController.value;

      return ColorFiltered(
          // aplica o filtro de ajuste de brilho (tem que ajustar)
          colorFilter: ColorFilter.matrix(
              ColorFilterGenerator.brightnessAdjustMatrix(
                  brightness: brightnessController.value)),
          /*
            // uma opcao é usar o codigo comentado:
            ChangeColors(
                    brightness: brightness,
                    saturation: saturation,
            // porem resolvi seguir a implementação também
            // encontrada no ColorOption para manter a consistencia
            */
          child: ColorFiltered(
            colorFilter: ColorFilter.matrix(
                ColorFilterGenerator.contrastAdjustMatrix(
                    contrast: contrastController.value)),
            // aplica o filtro de ajuste de saturação
            child: ColorFiltered(
                colorFilter: ColorFilter.matrix(
                    ColorFilterGenerator.saturationAdjustMatrix(
                        saturation: saturationController.value)),
                // gera a imagem na tela do aplicativo
                child: ExtendedImage(
                    image: ExtendedFileImageProvider(
                      image, // Habilita o cache da imagem
                      cacheRawData: true,
                    ),
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    extendedImageEditorKey: editorKeyController.editorKey,
                    mode: pageIndexController.equalTo(0)
                        ? ExtendedImageMode.none
                        : ExtendedImageMode.editor,
                    fit: BoxFit.contain,
                    initEditorConfigHandler: (ExtendedImageState? state) {
                      return EditorConfig(
                        maxScale: 8.0,
                        cropRectPadding: const EdgeInsets.all(20.0),
                        hitTestSize: 20.0,
                        cropAspectRatio: aspectRatioController.value,
                      );
                    })),
          ));
    });
  }

  Future<void> editAndSave() async {
    // captura todas as operações realizadas na imagem por meio do metodo state
    final ExtendedImageEditorState? state =
        editorKeyController.editorKey.currentState;
    final EditActionDetails? action = state!.editAction;

    // define uma imagem com base no existente no state
    final Uint8List editedImage = state.rawImageData;
    final ImageEditorOption option = ImageEditorOption();

    // captura as operações de crop, rotação e espelhamento realizadas na imagem
    final Rect? rectCrop = state.getCropRect();
    final double? radianRotate = action?.rotateAngle;
    final bool flipHorizontal = action!.flipY;
    final bool flipVertical = action.flipX;

    // aplica as operações de corte, espelhamento, rotação e ajuste de cores
    option.addOption(ClipOption.fromRect(rectCrop!));
    option.addOption(
        FlipOption(horizontal: flipHorizontal, vertical: flipVertical));
    option.addOption(RotateOption(radianRotate!.toInt()));
    option.addOption(ColorOption.saturation(saturationController.value));
    option.addOption(ColorOption.brightness(brightnessController.value));
    option.addOption(ColorOption.contrast(contrastController.value));

    // definindo o formato de saída da imagem com a mesma qualidade de entrada
    option.outputFormat = const OutputFormat.jpeg(100);

    // aplicando a edição com base nas optios coletadas
    final finalImage = await ImageEditor.editImage(
      image: editedImage,
      imageEditorOption: option,
    );
    image.writeAsBytesSync(finalImage!);

    // enviando a imagem para a tela de salvamento/compartilhamento
    WidgetsBinding.instance.addPostFrameCallback(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SaveImage(
                  arguments: [image],
                )),
      ),
    );
  }
}
