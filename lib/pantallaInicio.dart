// importamos los paquetes necesarios
import 'package:flutter/material.dart';
import 'package:carrito_compras/pantallaCarta.dart';
import 'package:google_fonts/google_fonts.dart';
// creamos una clase llamada PantallaInicio
class PantallaInicio extends StatefulWidget {
  const PantallaInicio({Key key}) : super(key: key);


  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  // creamos una variable donde se almacena el style del raised button
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    shape: const CircleBorder(),
    padding: const  EdgeInsets.all(13.0),
  );

  @override
  Widget build(BuildContext context) {
    // retornamos un scaffold
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      // retornamos la pantalla que va aparecer al inicio
      body: Stack(
        children: <Widget> [
          Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 15, left: 5, top: 50, bottom: 50),
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(200)
                    )
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("B I E N V E N I D O S  A  L A  M E J O R  T I E N D A", style: GoogleFonts.handlee(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 2,
                      )),
                    ),

                  ),
                ),
              )
          ),
          // la columna va a contener el logo de la tienda
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Center(
                child: Image.asset("assets/img/logo.jpg",
                  width: MediaQuery.of(context).size.width/2,
                  height: 200,
                ),
              ),
              const Padding(

                  padding: EdgeInsets.only(top: 100)
              ),
              // y va a tener un boton para iniciar al carrito
              ElevatedButton(
                style: raisedButtonStyle,
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.purple[200],
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const PantallaCarta())
                  )
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
