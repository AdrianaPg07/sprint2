import 'package:app/models/encuesta.dart';
import 'package:app/widgets/btcontainer.dart';
import 'package:app/widgets/check.dart';
import 'package:flutter/material.dart';

class Multiple extends StatefulWidget {
  final Pregunta pregunta;
  const Multiple({ Key? key, required this.pregunta }) : super(key: key);

  @override
  _MultipleState createState() => _MultipleState();
}

class _MultipleState extends State<Multiple> {
  @override
  Widget build(BuildContext context) {
    return Containner(
        child: Column(
      children: [
        
        SizedBox(height: 7.0),
        opciones(widget.pregunta.opciones),
        Text(widget.pregunta.id),
      ],
    ));
  }



  Widget opciones(List<Opcion> opciones) {
    return Column(
      children: getOpciones(opciones),
    );
  }

  List<Widget> getOpciones(List<Opcion> opciones) {
    List<Widget> listaOpcionesButton = [];

    for (var i = 0; i < opciones.length; i++) {
      listaOpcionesButton.add(new CheckBoxOption(opcion: opciones[i].valor));
    }
    return listaOpcionesButton;
  }
}
