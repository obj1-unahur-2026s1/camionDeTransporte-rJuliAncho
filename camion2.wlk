object camion {
    const cosasCargadas = []

    method cargarCosa(cosa) {
        cosasCargadas.add(cosa)
        cosa.consecuenciaDeLaCarga()
    }
    method cargarCosas(listaDeCosas) {
        cosasCargadas.add(listaDeCosas)
    }
    method descargarCosa(cosa) {
        cosasCargadas.remove(cosa)
    }

    method peso() = 1000 + cosasCargadas.sum({c => c.peso()})

    method esElPesoDeLasCargasPar() = cosasCargadas.all({c => c.peso().even()})
    
    method hayAlgunaCargaQuePesa(peso) = cosasCargadas.any({c => c.peso() == peso})

    method primerCargaConPeligrosidad(peligrosidad) = cosasCargadas.findOrDefault({c => c.nivelDepeligrosidad() == peligrosidad}, "No hay carga")

    method cosasConNivelDePeligrosidadMayorA(peligrosidad) = cosasCargadas.filter({c => c.nivelDepeligrosidad() > peligrosidad})

    method cosasQueSuperanPeligrosidadDe(cosa) = self.cosasConNivelDePeligrosidadMayorA(cosa.nivelDepeligrosidad())

    method estaExedidoDePeso() = self.peso() > 2500

    method puedeCircularEnRuta(nivelMaximo) = !self.estaExedidoDePeso() and self.cosasQueSuperanPeligrosidadDe(nivelMaximo).isEmpty()

    method algunaCargaPesaEntre(min,max) = cosasCargadas.any({c => c.peso().between(min, max)})

    method cargaMasPesada() = cosasCargadas.max({c => c.peso()})
        
}