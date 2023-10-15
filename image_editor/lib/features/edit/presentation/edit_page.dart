import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:image_editor/image_editor.dart';

import '../../share/presentation/save_image.dart';
import 'color_filter.dart';

class EditPage extends StatefulWidget {
  final List arguments;
  const EditPage({super.key, required this.arguments});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();

  late File image;
  @override
  void initState() {
    super.initState();
    image = widget.arguments[0];
  }

  // cria a variavel que irá receber a pagina selecionada
  int _currentIndex = 0;

  // variavel que irá receber os valores de brilho, contrate e saturação
  double brightness = 0;
  double contrast = 1;
  double saturation = 0;

  // variavel que irá definir o tipo de corte padrao
  double _aspectRatio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: buildImage(),
            ),
            //colocar a barra de edicao de atributos ou posição
            pageOptions(),
          ]),
      bottomNavigationBar: buildBottomNavigationBar(), // bottomNavigationBar: ,
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
          onPressed: reset,
        ),
        // esse botão deve enviar para a proxima pagina, salvando as mudancas na foto
        IconButton(
          icon: const Icon(Icons.check_outlined),
          // na funcao onpressed deve-se ir para a proxima janela (compartilhamento)
          onPressed: editAndSave,
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,

      // Definindo a cor dos itens por seleção
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.white,

      backgroundColor: Colors.green.shade500,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_fix_high_sharp),
          label: 'Adjusts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.crop),
          label: 'Crop',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.screen_rotation_alt_outlined,
          ),
          label: 'Rotate',
        ),
      ],

      // quando selecionado um item, atualiza o index da pagina
      onTap: (index) {
        // altera o valor da pagina selecionada
        setState(() {
          _currentIndex = index;
        });

        // esse codigo nao se reflete em nenhuma mudança no programa
        switch (index) {
          case 0:
            // editorKey.currentState?.build(context);
            editorKey.currentState?.getCropRect;
            break;
          case 1:
            // essa função realiza o processo de corte da imagem
            editorKey.currentState?.getCropRect;
            break;
          case 2:
            // funcao que chama a ferramenta de rotacao
            break;
        }
      },
    );
  }

  Widget pageOptions() {
    if (_currentIndex == 0) {
      return buildAdjusts();
    }

    if (_currentIndex == 1) {
      return buildCrop();
    }

    return buildPosition();
  }

  // construção do view de apresentação da imagem
  Widget buildImage() {
    return ColorFiltered(
        // aplica o filtro de ajuste de brilho
        colorFilter: ColorFilter.matrix(
          ColorFilterGenerator.contrastAdjustMatrix(
            contrast: contrast,
          ),
        ),
        /* 
        // uma opcao é usar o codigo comentado:
        ChangeColors(
                brightness: brightness,
                saturation: saturation,
        // porem resolvi seguir a implementação também 
        // encontrada no ColorOption para manter a consistencia
        */
        child: ColorFiltered(
          colorFilter:
              ColorFilter.matrix(ColorFilterGenerator.contrastAdjustMatrix(
            contrast: contrast,
          )),
          // aplica o filtro de ajuste de saturação
          child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                  ColorFilterGenerator.saturationAdjustMatrix(
                saturation: (saturation + 1),
                /*
                  tem que somar 1, pois caso contrario,
                  a saturação poderá retornar 0 e assim
                  reduzir o fator de saturação da imagem
                 */
              )),
              // gera a imagem na tela do aplicativo
              child: ExtendedImage(
                  image: ExtendedFileImageProvider(
                    image, // Habilita o cache da imagem
                    cacheRawData: true,
                  ),
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  extendedImageEditorKey: editorKey,
                  mode: _currentIndex == 0
                      ? ExtendedImageMode.none
                      : ExtendedImageMode.editor,
                  fit: BoxFit.contain,
                  initEditorConfigHandler: (ExtendedImageState? state) {
                    return EditorConfig(
                      maxScale: 8.0,
                      cropRectPadding: const EdgeInsets.all(20.0),
                      hitTestSize: 20.0,
                      cropAspectRatio: _aspectRatio,
                    );
                  })),
        ));
  }

  // construção do view de edicao das caracteristicas
  Widget buildAdjusts() {
    return Container(
        color: Colors.green.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildSaturation(),
            buildBrightness(),
            buildContrast(),
          ],
        ));
  }

  Widget buildSaturation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.invert_colors_on_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              "Saturation",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Slider(
            label: saturation.toStringAsFixed(2),
            onChanged: (double value) {
              setState(() {
                saturation = value;
              });
            },
            divisions: 50,
            value: saturation,
            min: -1,
            max: 1,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Text(saturation.toStringAsFixed(2)),
        ),
      ],
    );
  }

  Widget buildBrightness() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.brightness_6,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              "Brightness",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Slider(
            label: brightness.toStringAsFixed(2),
            onChanged: (double value) {
              setState(() {
                brightness = value;
              });
            },
            divisions: 50,
            value: brightness,
            min: -1,
            max: 1,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Text(brightness.toStringAsFixed(2)),
        ),
      ],
    );
  }

  Widget buildContrast() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.contrast_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              "  Contrast  ",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Slider(
            label: contrast.toStringAsFixed(2),
            onChanged: (double value) {
              setState(() {
                contrast = value;
              });
            },
            divisions: 50,
            value: contrast,
            min: 0,
            max: 2,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Text(contrast.toStringAsFixed(2)),
        ),
      ],
    );
  }

  // construção do view de edicao da posição da imagem
  Widget buildPosition() {
    return Container(
      color: Colors.green.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.flip),
            onPressed: flip,
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_ccw_outlined),
            onPressed: rotateRight,
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_cw_outlined),
            onPressed: rotateLeft,
          ),
        ],
      ),
    );
  }

  // deve estar no controlador da variavel 'editorKey.currentState'
  void flip() {
    editorKey.currentState?.flip();
  }

  // deve estar no controlador da variavel 'editorKey.currentState'
  void rotateRight() {
    editorKey.currentState?.rotate(right: true);
  }

  // deve estar no controlador da variavel 'editorKey.currentState'
  void rotateLeft() {
    editorKey.currentState?.rotate(right: false);
  }

  // construção do view de corte da imagem
  Widget buildCrop() {
    // tem que ver pra adicionar um widget, pois atualmente nao tenho
    // nenhum valor definido para tamanho, apenas o livre
    return Container(
        color: Colors.green.shade50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                icon: const Icon(Icons.crop_free_outlined),
                onPressed: () {
                  setState(() {
                    _aspectRatio = 0.0;
                  });
                }),
            IconButton(
                icon: const Icon(Icons.crop_din_outlined),
                onPressed: () {
                  setState(() {
                    _aspectRatio = 1.0;
                  });
                }),
            IconButton(
                icon: const Icon(Icons.crop_portrait_outlined),
                onPressed: () {
                  setState(() {
                    _aspectRatio = 3.0 / 4.0;
                  });
                }),
          ],
        ));
  }

  // deve estar no controlador da variavel 'editorKey.currentState'
  // reseta as configurações iniciais da imagem sendo editada
  void reset() {
    editorKey.currentState?.reset();
    setState(() {
      brightness = 0;
      contrast = 1;
      saturation = 0;
    });
  }

  Future<void> editAndSave() async {
    // captura todas as operações realizadas na imagem por meio do metodo state
    final ExtendedImageEditorState? state = editorKey.currentState;
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
    option.addOption(ColorOption.saturation(saturation + 1));
    option.addOption(ColorOption.brightness(brightness + 1));
    option.addOption(ColorOption.contrast(contrast));

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
