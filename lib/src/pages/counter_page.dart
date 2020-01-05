import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterPage extends StatefulWidget {
  // Return new instance of _CounterPageState()
  @override
  State<StatefulWidget> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // Variable for reuse TexStyle in differents widgtes
  final _myTextStyle = new TextStyle(fontSize: 25);
  final _backgroundOrange = new Color(0xFFFF9000);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _backgroundOrange,
          title: Text('Stateful Widget Example'),
          centerTitle: true,
          elevation: 10.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Number of tabs:',
                style: _myTextStyle,
              ),
              Text('$_counter', style: getTextStyleWithColor())
            ],
          ),
        ),
        floatingActionButton: _createButtons());
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: _reset,
          backgroundColor: _backgroundOrange,
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: _remove,
          backgroundColor: _backgroundOrange,
        ),
        SizedBox(width: 5.0),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _add,
          backgroundColor: _backgroundOrange,
        )
      ],
    );
  }

  void _add() {
    setState(() => _counter++);
  }

  void _remove() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      } else {
        _counter = 0;
      }
    });
  }

  void _reset() {
    setState(() => _counter = 0);
  }

  TextStyle getTextStyleWithColor() =>
      const TextStyle(fontSize: 25, color: Colors.purple);
}
