import 'package:flutter/material.dart';
import 'package:playground_flutter/models/custom_button/custom_button_model.dart';

class ImageButton extends StatelessWidget {
  final List<CustomButtonModel> buttonItems;

  const ImageButton({
    required this.buttonItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(maxHeight: 200),
      child: Row(
        children: buttonItems
            .map(
              (e) => Flexible(
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                  onPressed: e.onPress,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          width: double.infinity,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            e.imageUrl ?? '',
                          ),
                        ),
                      ),
                      if (e.label != null)
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 15.0),
                          child: Text(e.label ?? ''),
                        ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
