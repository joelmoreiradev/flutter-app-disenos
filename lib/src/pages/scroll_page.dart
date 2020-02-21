import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
         children: <Widget>[
           _pagina1(),
           _pagina2(),
         ],
      ),
    );
  }
// -------- página 1 ------------
 Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
 }

// -----------------------------


// -------- página 2 -----------
 Widget _pagina2() {
   
   return Container(
     //tamaños del container
     width: double.infinity,
     height: double.infinity,
     
     //color exacto RGB del container
     color: Color.fromRGBO(108, 192, 218, 1.0),
     child: Center(
       child: RaisedButton(
         //texto, colores y estilos del botón
         child: Padding(padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
         child: Text('Bienvenido', style: TextStyle(fontSize: 20.0),),
         ),
         textColor: Colors.white,
         color: Colors.blue,

         //bordes redondeados
         shape: StadiumBorder(),

         //acción del botón
         onPressed: (){},
         
         ),
     ),
   );

 }
 // ----------------------------




Widget _colorFondo() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    //color rgb, y al final la opacidad 1.0 para que sea un color sólido, números menores son semi/transparentes.
    color: Color.fromRGBO(108, 192, 218, 1),
  );
}

Widget _imagenFondo() {
  //imágen que abarque todo el espacio posible
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Image(
      image: AssetImage('assets/scroll-1.png'),

      //esto es para que la imágen se expanda todo el espacio posible respetando las dimensiones de la imágen.
      fit: BoxFit.cover,
    ),
  );
}

Widget _textos() {


   final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);
 
   return SafeArea(
        child: Column(
        children: <Widget>[
          
          Text('11°', style: estiloTexto,),
          Text('Miercoles', style: estiloTexto,),

          Expanded(child: Container(),),
          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 70.0,)
        ],
     ),
   );

}

}