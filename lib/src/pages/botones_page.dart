import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
      children: <Widget>[
        _fondoApp(),

        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //_titulos son los textos de Classify...
              _titulos(),

              _botonesRedondeados(),
            ],
          ),
        ),
      ],
     ),

     bottomNavigationBar: _bottomNavigationBar(context),
      
    );
  }

 Widget _fondoApp() {
   final gradiente = Container(
     width: double.infinity,
     height: double.infinity,
     decoration: BoxDecoration(
       gradient: LinearGradient(
         // dirección del gradiente según coordenadas x, y
         //      donde empieza, donde se empieza a degradar
         begin: FractionalOffset(0.0, 0.6),
         end: FractionalOffset(0.0, 1.0),
         colors: [
           //el orden de los colores importa, el primer color será el que se verá arriba o a la izquierda primero.
          Color.fromRGBO(52, 54, 101, 1.0),
          Color.fromRGBO(35, 37, 57, 1.0),
          
         ],
       ),
     ),
   );


   final cajaRosa = Transform.rotate(
   //angulo al cual rotar el container
   angle: -pi / 5.0,
   //hijo del Transform.rotate, el cual será girado / rotado
   child: Container(
    height: 360.0,
    width: 360.0,
    decoration: BoxDecoration(
      //bordes del container
      borderRadius: BorderRadius.circular(80.0),
      //color del container
      gradient: LinearGradient(
        colors: [
        Color.fromRGBO(236, 98, 188, 1.0),
        Color.fromRGBO(241, 142, 172, 1.0)
        ],
      ),
     
    ),
  
   ),
  );







   // uso stack para tener un fondo con gradiente y arriba una caja rosada
   return Stack(
     children: <Widget>[
       gradiente,
       //arriba del gradiente irá la caja rosada, así que la pongo después del gradiente

       //Positioned es para ubicar un elemento con coordenadas especificas, justo como yo quiero.
       Positioned(
         top: -100,
         child: cajaRosa
       ),
       
     ],
   );
 }


 Widget _titulos() {


   return SafeArea(
     child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        
          Text('Classify transaction', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 10.0),
          Text('Classify this transaction into a particular category', style: TextStyle(color: Colors.white, fontSize: 16.0,),),
        ],
      ),
     ),
   );
}

 

 Widget _bottomNavigationBar(BuildContext context) {


   return Theme (
           //copiar el tema
     data: Theme.of(context).copyWith(
       
       //color de fondo
       canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
       
       //cambiar el color primario
       primaryColor: Colors.pinkAccent,

       //cambiar color de texto secundario
       textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))),

     ),

     child: BottomNavigationBar(
       
       items: [
         BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0),
            title: Container(),
         ),
         BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, size: 30.0),
            title: Container(),
         ),
         BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container(),
         ),
       ], 
     ),
   );
 }


 Widget _botonesRedondeados() {

//Tabla de elementos, en este caso tabla de Containers
    return Table(
      children: [
        TableRow(
          children: [
      //2 Containers en cada TableRow, cada uno necesita mandar parametros del color, ícono, y texto que tendrá.
           _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
           _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, 'Bus'), 
          ]),
          TableRow(
          children: [
           _crearBotonRedondeado(Colors.pinkAccent, Icons.shop, 'Buy'),
           _crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, 'File'),
          ]),
          TableRow(
          children: [
           _crearBotonRedondeado(Colors.blueAccent, Icons.movie_filter, 'Entertainment'),
           _crearBotonRedondeado(Colors.green, Icons.cloud, 'Grocery'),
          ]),
          TableRow(
          children: [
           _crearBotonRedondeado(Colors.red, Icons.collections, 'Photos'),
           _crearBotonRedondeado(Colors.teal, Icons.help_outline, 'Help'), 
          ]),
      ],
    );
 }
 

 Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
   return Padding(
     //padding o espacio alrededor del Container
     padding:  EdgeInsets.all(15.0),

     //ClipRRect para solucionar problema de Blur en toda la pantalla
        child: ClipRRect(

          //Borde del container y del blur.
          borderRadius: BorderRadius.circular(20.0),

       //BackdropFilter es para aplicar el filtro que en este caso es Blur
          child: BackdropFilter(

         //filtro Blur
         filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),

         //hijo del BackdropFilter
         child: Container(
           height: 180.0,
           
           //decoración del container
           decoration: BoxDecoration(

             //color del container
             color: Color.fromRGBO(62, 66, 107, 0.70),

             //Bordes redondeados del container
            //!reemplazado por el borderRadius del ClipRRect.
          //   borderRadius: BorderRadius.circular(20.0),
           ),
            
            //contenido del container
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar( 

                  //color del CircleAvatar
                  backgroundColor: color,

                  //radio del CircleAvatar
                  radius: 35.0,

                  //contenido del CircleAvatar
                  child: Icon(icono, color: Colors.white, size: 30.0,),
                ),
                SizedBox(height: 10.0,),
                Text(texto, style: TextStyle(color: color),),
              ],
           ),
         ),
       ),
     ),
   );
 }

}