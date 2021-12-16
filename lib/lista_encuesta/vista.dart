import 'package:app/models/encuesta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'abierta.dart';
import 'cerrada.dart';
import 'multiple.dart';

class Encuesta_screen extends StatefulWidget {
  final Seccion seccion;
  final int index;
  final int max;
  const Encuesta_screen({ Key? key, required this.seccion, required this.index, required this.max,  }) : super(key: key);

  @override
  _Encuesta_screenState createState() => _Encuesta_screenState();
}

class _Encuesta_screenState extends State<Encuesta_screen> {
  @override
  Widget build(BuildContext context) {
   return Container(
     
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          
          Column(
            children: cargarPreguntas(widget.seccion.preguntas),
          ),
          Row(
            children: [
              (widget.index == 1)
                  ? Container()
                  : TextButton(
                      onPressed: () {},
                      child: Text(
                        'Anterior',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
              Expanded(child: SizedBox()),
              (widget.index == widget.max)
                  ? Container()
                  : TextButton(
                      onPressed: () {},
                      child: Text(
                        'Siguiente',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(10, 161, 244, 1.0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }



  List<Widget> cargarPreguntas(List<Pregunta> preguntas) {
    List<Widget> preguntasCard = [];
    for (var pregunta in preguntas) {
      if (pregunta.tipoPregunta == 'simple') {
        preguntasCard.add(Cerrada(pregunta: pregunta));
      }
      if (pregunta.tipoPregunta == 'multiple') {
        preguntasCard.add(Multiple(pregunta: pregunta));
      }
      if (pregunta.tipoPregunta == 'abierta') {
        preguntasCard.add(PreguntaAbierta(pregunta: pregunta));
      }

      preguntasCard.add(SizedBox(height: 20.0));
    }

    return preguntasCard;
  }



}
