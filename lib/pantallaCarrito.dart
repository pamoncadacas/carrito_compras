import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrito/Carrito.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({Key key}) : super(key: key);


  @override
  State<PantallaCarrito> createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: const Text("C A R R I T O"),
          elevation: 0,
        ),
        body: Container(
          child: carrito.items.isEmpty ? const Center(child: Text("V A C I O"),): Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              for(var item in carrito.items.values)
              Card(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(item.imagen, width: 100,),
                    Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 100,
                          child: Column(

                            children: [
                              Text(
                                item.nombre
                              ),
                              Text(
                                'S/. ${item.precio} x ${item.unidad}'
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.purple[200],
                                      borderRadius: const BorderRadius.all(Radius.circular(30))
                                    ),

                                    child: IconButton(
                                      icon:  const Icon(
                                        Icons.remove, size: 13, color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          carrito.decrementarCantidadItem(item.id);
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.cantidad.toString()
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.purple[200],
                                        borderRadius: const BorderRadius.all(Radius.circular(30))
                                    ),
                                    child:  IconButton(
                                      icon: const Icon(
                                          Icons.add, size: 13, color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          carrito.incrementarCantidadItem(item.id);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                    Container(
                      height: 100,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: Center(
                        child: Text(
                          'S/. ${item.precio * item.cantidad}'.toString(), style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                )
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                child: Row(
                  children:  [
                    const Expanded(child: Text(
                        "S U B T O T A L:"
                    ),),
                    Text('S/. ${carrito.subTotal}'.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:  [
                    const Expanded(child: Text(
                        "I M P U E S T O:"
                    ),),
                    Text('S/. ${carrito.impuesto}'.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:  [
                    const Expanded(child: Text(
                        "T O T A L:"
                    ),),
                    Text('S/. ${carrito.total}'.toString()),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
