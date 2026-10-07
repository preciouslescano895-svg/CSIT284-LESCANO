import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DemoButtonsState();
    //throw UnimplementedError();
  }
}

class _DemoButtonsState extends State<DemoButtons> {
  var _isUnderstood = false;
  @override
  Widget build(BuildContext contents) {
    return Column(
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = false;
                    });
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = true;
                    });
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
            if (_isUnderstood) const Text('Awesome!'),
      ],
    );
  }
}