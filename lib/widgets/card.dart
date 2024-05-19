import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            //ITEMS DE CAJA
            Icon(widget.icon,
            color: Colors.teal,),
            const SizedBox(
              width: 12.0,
            ),
            Text(widget.text),
            
          ],
        ),
      ),
    );
  }
}