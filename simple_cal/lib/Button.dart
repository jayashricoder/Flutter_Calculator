import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String? text;

  final int? fillColor;

  final int? textColor;

  final double? textSize;

  final Function? callback;

  const Button({
    Key? key,
    this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: () {
            callback!(text);
          },
          child: Text(
            text!,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
          color: fillColor != null ? Color(fillColor!) : null,
          textColor: Color(textColor!),
        ),
      ),
    );
  }
}