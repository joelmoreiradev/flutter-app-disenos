import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Column es para poner una lista de widgets en dirección vertical.
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[


          _crearImagen(),
         // -------------
          _crearTitulo(),
        // --------------
          _crearAcciones(),

          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          
        ],
        ),
      ),
    );
  }


  Widget _crearImagen(){
    return Container(
      width: double.infinity,
      child: Image(
               image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/1000/327/737/man-made-devil-s-bridge-bridge-germany-wallpaper-preview.jpg'),
               height: 250.0,
               fit: BoxFit.cover,
            ),
    );
  }

  Widget _crearTitulo(){
     return SafeArea(
       child: Container(
          /* El padding es para poner espacios o "bordes" invisibles
          en una zona determinada (left, right, top) o en todas las direcciones
          (EdgeInsets.all)*/
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
             child: Row(
              
               children: <Widget>[
        //Expanded toma todo el espacio posible sin robar espacio a otros widgets.
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Lago con un puente', style: estiloTitulo,),
                          //espacio entre ambos textos
                          SizedBox(height: 1.0,),
                          //espacio entre ambos textos
                          Text('Un lago que se encuentra en Alemania', style: estiloSubTitulo,)
                        ],
                      ),
                    ),
                  
                 Icon(Icons.star, color:Colors.red, size: 30.0,),
                 Text('41', style: TextStyle(fontSize: 20.0),)

               ],
             ),
           ),
     );
  }


  Widget _crearAcciones(){
    
      return Row(
        //alinear de manera separada horizontalmente
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
         _accion(Icons.call, 'CALL'),
          
         _accion(Icons.near_me, 'ROUTE'),
          
         _accion(Icons.share, 'SHARE'),
          

        ],
      );
   
  }


  //IconData y String son argumentos que se requerirán al usar _accion()
  Widget _accion(IconData icon, String texto){
    return Column(
         children: <Widget>[
           //muestro el icono que se mande como argumento de _accion()
           Icon(icon, color:  Colors.blue, size: 40.0,),
           //muestro el texto que se mande como argumento de _accion()
           Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue)),
           
         ],
       );
  }


  Widget _crearTexto(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Minim amet anim quis fugiat fugiat deserunt consectetur dolor excepteur mollit quis. Mollit eiusmod aute exercitation dolor pariatur fugiat nulla qui fugiat officia minim esse et enim. Exercitation aute nostrud laboris proident aliqua. Velit labore commodo non laboris labore incididunt reprehenderit enim. Aliquip amet cillum laboris ipsum. Aute exercitation velit nisi tempor minim eiusmod tempor officia excepteur cillum ea velit minim.',
          textAlign: TextAlign.justify,
           
        ),

      ),
    );
  }

}