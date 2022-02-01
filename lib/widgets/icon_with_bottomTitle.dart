
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class IconWithBottomTitle extends StatelessWidget {
    final IconData icon;
    final String title;

    const IconWithBottomTitle({
        required this.icon,
        this.title = '-',
        Key? key
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                DottedBorder(
                    color: Colors.grey,
                    child: Icon(icon),
                ),
                SizedBox(height: 5),
                Text(title),
            ],
        );
    }
}