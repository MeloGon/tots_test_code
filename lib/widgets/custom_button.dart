import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? marginV;
  final double? marginH;
  final Icon? icon;
  final bool enabled;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  const CustomButton(
      {super.key,
      this.text,
      this.color = Colors.black,
      this.marginV,
      this.marginH,
      this.enabled = true,
      required this.onPressed,
      this.icon,
      this.width,
      this.height = 53,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: marginH ?? 0, vertical: marginV ?? 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            elevation: 0,
            backgroundColor: color,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(55),
              ),
            ),
          ),
          onPressed: enabled ? onPressed : null,
          child: SizedBox(
            width: width,
            height: height,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (text != null)
                    Text(
                      text!,
                      style: TextStyle(color: Colors.white, fontSize: fontSize),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
