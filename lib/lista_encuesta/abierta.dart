

import 'package:app/models/encuesta.dart';
import 'package:app/widgets/btcontainer.dart';
import 'package:flutter/material.dart';

class PreguntaAbierta extends StatefulWidget {
  final Pregunta pregunta;

  const PreguntaAbierta({Key? key, required this.pregunta})
      : super(key: key);

  @override
  _PreguntaAbiertaState createState() => _PreguntaAbiertaState();
}

class _PreguntaAbiertaState extends State<PreguntaAbierta> {
  @override
  Widget build(BuildContext context) {
    return Containner(
      child: Column(
        children: [
          nombre(widget.pregunta.id),
          SizedBox(height: 15.0),
          campoRespuesta(),
        ],
      ),
    );
  }

  Widget nombre(String titulo) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          titulo,
          style: TextStyle(
            color: Color.fromRGBO(44, 44, 44, 1.0),
            fontSize: 20.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget campoRespuesta() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(164, 164, 166, 1.0),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: TextField(
        maxLines: 4,
        cursorColor: Color.fromRGBO(44, 44, 44, 1.0),
      ),
    );
  }
}
