class Persona {
  const formasDePago = []
  const listaCosas = []
  var plata

  method pagar(precio){
    if(plata>precio) plata -= precio
  }

  method cambiarFormaDePago(){
    formasDePago.get(1)
  }
  method cantidadCosas() {
    listaCosas.size()
  }
}
class Efectivo {
  var efectivo
  method pagar(precio){
    if(efectivo>precio) efectivo -= precio
  }
}

class Debito {
  var cuentaBancaria
  method pagar(precio) {
    if(cuentaBancaria>precio) cuentaBancaria -= precio
  }
}

class Credito {
  var cuentaBancaria
  const limiteCompra
  const cantidadCuotas
  const interes
  const listaCuotas = []
  method pagar(precio){
    if(cuentaBancaria>precio && limiteCompra>precio) cuentaBancaria -= self.cuota(precio) else listaCuotas.add(self.cuota(precio))
  }
  method cuota(precio) = (precio/cantidadCuotas) + interes

  method montoTotal() = listaCuotas.sum({c=>c.cuota()})
}

class NuevaForma inherits Credito {
  const descuento
  override method pagar(precio) {
    super(precio) - descuento
  } 

}
class Sueldo {
  var mes
  var salario
  method cobrar(precio) {
    salario += precio
  }
}

class CompradorCompulsivo inherits Persona {
  override method pagar(precio){
    if(plata>precio) plata -= precio else self.buscarForma()
  }
  method buscarForma(){
    formasDePago.forEach({f=>f.pagar()})
  }
}
