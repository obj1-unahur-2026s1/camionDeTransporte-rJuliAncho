
object knightRider {
    
    method peso() = 500
    method nivelDePeligrosidad() = 10

}

object bumblebee {
    var formaActual = auto
    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel()


    method cambiarForma(forma) { formaActual = forma}

}

object auto {
    method nivel() = 15
}

object robot {
    method nivel() = 30
}
object paqueteDeLadrillos {
    var cantidadDeLadrillos = 10
    method peso() = cantidadDeLadrillos * 2
    method nivelDePeligrosidad() = 2
    method cantidadDeLadrillosNueva(cantidad){
        cantidadDeLadrillos = cantidad
    }
}


object bateria {
    var tieneMisiles = true
    method peso() = if(tieneMisiles) 300 else 200
    method nivelDePeligrosidad() = 10

    method descargarMisiles() {
        tieneMisiles = !tieneMisiles
    }
}

object contenedor {
    const cosas = []

    method cargarCosas(cosa) {
        cosas.add(cosa)
    }


    method peso() = 100 + self.pesoDeCosas()
    method nivelDePeligrosidad() = if (not cosas.isEmpty()) self.cosaMasPeligrosa().nivelDePeligrosidad()
    method pesoDeCosas() = cosas.sum({c => c.peso()})
    method cosaMasPeligrosa() = cosas.max({c => c.nivelDePeligrosidad()})
    method meterElementos(listaElementos){ cosas.addAll(listaElementos)}
}


object residuos {
    var property peso = 10

    method nivelDePeligrosidad() = 200

}
object arena {
    var property peso = 10
    method nivelDePeligrosidad() = 1
}

object embalaje {
   
    var cosaEnvuelta = bateria
    
    method peso() = cosaEnvuelta.peso()
    
    method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad() * 0.5
    method cambiarLoQueEnvuelve(nuevaCosa){
        cosaEnvuelta = nuevaCosa
    } 

}




