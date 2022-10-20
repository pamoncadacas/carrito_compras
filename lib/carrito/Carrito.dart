
import 'package:flutter/material.dart';
import 'package:carrito_compras/model/item.dart';

class Carrito extends ChangeNotifier{
  final Map<String, Item> _items = {};
  Map<String, Item> get items{
    return {..._items};
  }
  int get numeroItems{
    return _items.length;
  }
  // retornar el monto total
  double get subTotal{
    var total = 0.0;
    items.forEach((key, elementos) => total += elementos.precio * elementos.cantidad);
    return total;
  }
  // retorna el impuesto
  double get impuesto{
    var total = subTotal * 0.19;
    return total;
  }
  double get total{
    var total = subTotal * 1.19;
    return total;
  }
  void agregarItems(
      String productoId,
      String nombre,
      double precio,
      String unidad,
      String imagen,
      int cantidad,
      ){
        if(_items.containsKey(productoId)){
          _items.update(
            productoId,
              (old) => Item(id: old.id, nombre : old.nombre, precio : old.precio, unidad : old.unidad, imagen : old.imagen, cantidad : old.cantidad+1)
          );
        } else{
          _items.putIfAbsent(
            productoId,
              ()=> Item(id: productoId, nombre : nombre, precio : precio, unidad : unidad, imagen : imagen, cantidad : 1)
          );
        }
      }
      void removeItem(String productoId){
        _items.remove(productoId);
      }
      // constains key es si existe el producto
      void incrementarCantidadItem(String productoId) {
        if(items.containsKey(productoId)) {
          _items.update(
              productoId,
                  (old) => Item(id: old.id, nombre : old.nombre, precio : old.precio, unidad : old.unidad, imagen : old.imagen, cantidad : old.cantidad+1)
          );
        }
      }
  void decrementarCantidadItem(String productoId) {
    // si no existe
    if(!_items.containsKey(productoId)) return;
    if(_items[productoId].cantidad>1) {
      _items.update(
          productoId,
              (old) => Item(id: old.id, nombre : old.nombre, precio : old.precio, unidad : old.unidad, imagen : old.imagen, cantidad : old.cantidad-1)
      );
    }else{
      _items.remove(productoId);
    }
  }

}