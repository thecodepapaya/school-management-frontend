import 'package:flutter/material.dart';

class EntityCard extends StatelessWidget {
  final String name;
  final void Function() onPressed;
  static const double cardSize = 200;

  EntityCard({
    @required this.name,
    @required this.onPressed,
  })  : assert(name != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RaisedButton(
        onPressed: this.onPressed,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: cardSize*1.6,
          height: cardSize,
          child: Center(
            child: Text(this.name),
          ),
        ),
      ),
    );
  }
}
