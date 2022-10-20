// importamos los paquetes necesarios
import 'package:carrito_compras/carrito/Carrito.dart';
import 'package:flutter/material.dart';
import 'package:carrito_compras/pantallaInicio.dart';
import 'package:provider/provider.dart';
// este metodo va a ejecutar nuestra aplicacion
void main() => runApp(
  ChangeNotifierProvider(
    // declarar con que clase va a trabajar
    create: (context) => Carrito(),
    child: const MyApp(),
  )
);
// creamos la clase myApp que hereda de StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // le ponemos un titulo
      title: 'Carrito de Compras',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const PantallaInicio(),
    );
  }

}


