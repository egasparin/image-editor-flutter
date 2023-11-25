import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/adjust_controller.dart';
import '../functions/select_icons.dart';

class BuildSlider extends StatelessWidget {
  final String nameOfParameter;
  final AdjustController adjustControlerParameter;

  const BuildSlider({
    super.key,
    required this.nameOfParameter,
    required this.adjustControlerParameter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    selectIcons(nameOfParameter),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    nameOfParameter,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  )
                ])),
        Observer(builder: (context) {
          return SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Slider(
                label: adjustControlerParameter.viewStringValue,
                onChanged: (double value) {
                  adjustControlerParameter.setValue(value);
                },
                divisions: 50,
                value: adjustControlerParameter.viewDoubleValue,
                min: -1,
                max: 1,
              ));
        }),
        Observer(builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    adjustControlerParameter.viewStringValue,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          );
        }),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        )
      ],
    );
  }
}

//// implementação stateful:
// class BuildSlider extends StatefulWidget {
//   final String nameOfParameter;
//   final AdjustController adjustControlerParameter;

//   const BuildSlider({
//     super.key,
//     required this.nameOfParameter,
//     required this.adjustControlerParameter,
//   });

//   @override
//   State<BuildSlider> createState() => _BuildSliderState();
// }

// class _BuildSliderState extends State<BuildSlider> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.03,
//         ),
//         Column(
//           children: <Widget>[
//             Icon(
//               Icons.invert_colors_on_outlined,
//               color: Theme.of(context).colorScheme.primary,
//             ),
//             Text(
//               widget.nameOfParameter,
//               style: TextStyle(color: Theme.of(context).colorScheme.secondary),
//             )
//           ],
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.6,
//           child: Slider(
//             label: widget.adjustControlerParameter.viewStringValue,
//             onChanged: (double value) {
//               widget.adjustControlerParameter.setValue(value);
//             },
//             divisions: 50,
//             value: widget.adjustControlerParameter.viewDoubleValue,
//             min: -1,
//             max: 1,
//           ),
//         ),
//         Padding(
//           padding:
//               EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
//           child: Text(widget.adjustControlerParameter.viewStringValue),
//         ),
//       ],
//     );
//   }
// }


