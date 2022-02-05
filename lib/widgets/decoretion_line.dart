import 'package:flutter/material.dart';

/*
* Decoration line wiget is used with the Stack widget.
* It's line that takes up 1\3 screens.
*/

class DecorationLine extends StatelessWidget {
    final double? bottom;
    final double? top;
    final double? color;
    final double? height;

    const DecorationLine({
        this.bottom,
        this.top,
        this.color,
        this.height,
        Key? key
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Positioned(
            top: top,
            bottom: bottom,
            child: Container(
                color: Colors.grey, 
                height: 1, 
                width: MediaQuery.of(context).size.width / 2.5,
            )
        );
    }
}