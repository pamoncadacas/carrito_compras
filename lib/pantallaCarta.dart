import 'package:carrito_compras/carrito/Carrito.dart';
import 'package:carrito_compras/model/Carta.dart';
import 'package:carrito_compras/pantallaCarrito.dart';
import 'package:carrito_compras/pantallaInicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaCarta extends StatefulWidget {
  const PantallaCarta({Key key}) : super(key: key);

  @override
  _PantallaCartaState createState() => _PantallaCartaState();
}

class _PantallaCartaState extends State<PantallaCarta> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    padding: const EdgeInsets.all(13.0),
  );

  @override
  Widget build(BuildContext context) {
    // el constructor le pasa la funcionalidad dela clase carrito
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            key: _globalKey,
            backgroundColor: Colors.purple[200],
            appBar: AppBar(
              title: Center(
                child: Text("Productos disponibles", style: GoogleFonts.handlee(
                  color: Colors.black
                )),
              ),
              backgroundColor: Colors.purple[200],
              elevation: 0,
              bottom:  TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text("G R A N O S", style: GoogleFonts.titanOne(
                        color: Colors.black
                      )),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text("V E R D U R A S / F R U T A S", style: GoogleFonts.titanOne(
                        color: Colors.black
                      ),),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text("B E B I D A S", style: GoogleFonts.titanOne(
                        color: Colors.black
                      ),),
                    ),
                  ),
                ],
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {
                       carrito.numeroItems!=0 ?
                           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => PantallaCarrito()),
                           )
                           :
                           const SnackBar(content: Text(
                             "Llenar carrito"
                           ));

                      }
                    ),
                    Positioned(
                        top: 6,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(4)),
                            // para configurar el ancho
                            constraints: const BoxConstraints(
                              minWidth: 14,
                              minHeight: 14
                            ),
                          child: Text(carrito.numeroItems.toString(), textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black, fontSize: 10),),
                        ),
                    )
                  ],
                )
              ],
            ),
            drawer: menuLateral(),
            body: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                      itemCount: granos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.0),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x000005cc),
                                    blurRadius: 30,
                                    offset: Offset(10, 10))
                              ]),
                          child: Column(
                            children: [
                              Image.asset(granos[index].imagen, width: 100,),
                              Text(
                                granos[index].nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  'S/.${granos[index].precio.toString()}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              ElevatedButton.icon(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItems(
                                        // toString para q reciba una cadena de texto
                                        granos[index].id.toString(),
                                        granos[index].nombre,
                                        granos[index].precio,
                                        "1",
                                        granos[index].imagen,
                                        1);
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                label: const Text("A G R E G A R"),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                      itemCount: verduras.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.2),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x000005cc),
                                    blurRadius: 30,
                                    offset: Offset(10, 10))
                              ]),
                          child: Column(
                            children: [
                              Image.asset(verduras[index].imagen, width: 100,),
                              Text(
                                verduras[index].nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'S/.${verduras[index].precio.toString()}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              ElevatedButton.icon(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItems(
                                        // toString para q reciba una cadena de texto
                                        verduras[index].id.toString(),
                                        verduras[index].nombre,
                                        verduras[index].precio,
                                        "1",
                                        verduras[index].imagen,
                                        1);
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                label: const Text("A G R E G A R"),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                      itemCount: bebidas.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 0.9),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x000005cc),
                                    blurRadius: 30,
                                    offset: Offset(10, 10))
                              ]),
                          child: Column(
                            children: [
                              Image.asset(bebidas[index].imagen, width: 100,),
                              Text(
                                bebidas[index].nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'S/.${bebidas[index].precio.toString()}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              ElevatedButton.icon(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItems(
                                        // toString para q reciba una cadena de texto
                                        bebidas[index].id.toString(),
                                        bebidas[index].nombre,
                                        bebidas[index].precio,
                                        "1",
                                        bebidas[index].imagen,
                                        1);
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                label: const Text("A G R E G A R"),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ));
    });
  }
}

class menuLateral extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple[200],
            ),
            child: Column(
              children: <Widget> [
                const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 70.0,
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text('C A R R I T O  D E  C O M P R A S', style: GoogleFonts.poiretOne(
                  color: Colors.white,
                  fontSize: 15,
                ),),
              ],
            ),
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "I N I C I O",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => const PantallaCarta()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "P R O D U C T O S",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.airplay,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => const PantallaCarta()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "C A R R I T O",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) =>  PantallaCarrito()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "T I E N D A",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.account_box,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => PantallaInicio()));
            },
          ),
        ],
      ),
    );
  }
}
