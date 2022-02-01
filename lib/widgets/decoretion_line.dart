import 'package:flutter/material.dart';

class DecorationLine extends StatelessWidget {
    final double? bottom;
    final double? top;

    const DecorationLine({
        this.bottom,
        this.top,
        Key? key
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Positioned(
            top: top,
            bottom: bottom,
            child: Container(
                color: Colors.black, 
                height: 2, 
                width: 150,
            )
        );
    }
}