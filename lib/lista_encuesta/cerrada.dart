

import 'package:app/models/encuesta.dart';
import 'package:app/services/encuesta_service.dart';
import 'package:app/widgets/btcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cerrada extends StatefulWidget {
  final Pregunta pregunta;
  const Cerrada({ Key? key, required this.pregunta }) : super(key: key);

  @override
  _CerradaState createState() => _CerradaState();
}

class _CerradaState extends State<Cerrada> {
  String opcionSeleccionada = '';
  String selected = 'no response';

  @override
  Widget build(BuildContext context) {
    return  Containner(
      child:  Column(
        children: [
          nombre(widget.pregunta.enunciado),
          opciones(widget.pregunta.opciones),
          Text(widget.pregunta.id),
        ],
      ),    
    );
  }
  Widget nombre(String titulo){
    return Padding(
      padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
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
  Widget opciones(List<Opcion> opciones) {
    return Column(
      children: getOpciones(opciones),
    );
  }

  List<Widget> getOpciones(List<Opcion> opciones) {
    List<Widget> listaOpcionesButton = [];
    for (var i = 0; i < opciones.length; i++) {
      listaOpcionesButton.add(ListTile(
        title: Text(opciones[i].valor),
        leading: Radio<String>(
          value: opciones[i].valor,
          groupValue: selected,
          onChanged: (value) {
            final aplicacionService =
                Provider.of<EncuestaService>(context, listen: false);
           if (aplicacionService != true) return;
          setState(() {
          selected = value as String;
            /*  if (!aplicacionService.obtenerEncuestas(
                  widget.pregunta, selected)) {
                aplicacionService.add(widget.pregunta, selected);
              }*/
            });
          },
          activeColor: Color.fromRGBO(0,0,140,1.0),
        ),
      ));

  
    
    }
    return listaOpcionesButton;
  }    
}