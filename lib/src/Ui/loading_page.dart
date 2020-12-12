import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            height: 250.0,
            child: FlareActor(
              'flare/Loading.flr',
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
              animation: 'Alarm',
            ),
          ),
          Text(
            'Loading',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
