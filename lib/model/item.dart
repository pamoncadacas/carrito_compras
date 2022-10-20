
class Item{
  String id;
  String nombre;
  double precio;
  String unidad;
  String imagen;
  int cantidad;

   Item({ this.id, this.nombre, this.precio,  this.unidad,   this.imagen,
      this.cantidad});

  map(dynamic o){
    id = o["id"];
    nombre = o["nombre"];
    precio = o["precio"];
    unidad = o["unidad"];
    imagen = o["imagen"];
    cantidad = o["cantidad"];
  }

  Map<String, dynamic> toMap() {
    var map =<String, dynamic>{};
    map["id"] = id;
    map["nombre"] = nombre;
    map["precio"] = precio;
    map["unidad"] = unidad;
    map["imagen"] = imagen;
    map["cantidad"] = cantidad;
    return map;
  }
  Map<String, dynamic> toJson(){
    final   Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["nombre"] = nombre;
    data["precio"] = precio;
    data["unidad"] = unidad;
    data["imagen"] = imagen;
    data["cantidad"] = cantidad;
    return data;
  }
}



