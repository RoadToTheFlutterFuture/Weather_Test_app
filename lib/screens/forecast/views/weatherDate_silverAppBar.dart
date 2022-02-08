import 'package:flutter/material.dart';


class WeatherDateSilverAppBar extends StatelessWidget {
     final bool status;
     final String title;

    const WeatherDateSilverAppBar({
        this.status = false,
        this.title = '',
        Key? key
    }) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        return SliverAppBar(
            pinned: true,
            stretch: status,
            title: status ? null : Container(
                width: double.infinity,
                child: Text(title),
            ),
            flexibleSpace: status ?
                FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 15, bottom: 15),
                    centerTitle: false,
                    title: Container(
                        height: double.infinity,
                         alignment: Alignment.bottomLeft,
                        child: Text(title)),
                ) :
                null,
        );
    }
}

 