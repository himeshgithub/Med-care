import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Color color;
  final double borderRadius;
  final Widget child;
  final VoidCallback onPressed;

  CustomRaisedButton(
      {@required this.color, // use color is required
       this.borderRadius,
       this.onPressed,
       this.child})
        : assert(color!=null); // color can't be null

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 50.0,
      child: RaisedButton(
          child: child, //show text in button
          onPressed: onPressed,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          )),
    );
  }
}
