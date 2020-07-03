class Planta {
	
	var property semillaDeOrigen
	var property altura 
	var property toleranciaAlSol = pricipioDeToleranciasAlSol.cuantoTolera()
	
	
	method esFuerte() {
		
		return self.toleranciaAlSol() > 9
		
	}
	
	method daSemillas() {
		
		return self.esFuerte()
		
	}
	
	method espacioQueOcupa()
	method leResultaIdeal(unaParcela)
	
	method seNecesitaSiEsEcolologica(unaParcela) {
		return unaParcela.esEcologica()
		   and not unaParcela.tieneComplicaciones()
		   and self.leResultaIdeal(unaParcela)
		
	}
	
	method seNecesitaSiEsIndustrial(unaParcela) {
		
		return unaParcela.esIndustrial()
		   and unaParcela.cantidadPlantas() == 2
		   and self.esFuerte()
	}
	
	
	method seAsociaBien(unaParcela) {
	
	return self.seNecesitaSiEsEcolologica(unaParcela) 
	    or self.seNecesitaSiEsIndustrial(unaParcela)
		
	}
}

class Menta inherits Planta {
	
	override method espacioQueOcupa () {
		
		return self.altura() * 3
		
	}
	
	override method daSemillas() {
		
		return super() or self.espacioQueOcupa() > 1
		
	}
	
	override method leResultaIdeal(unaParcela) {
		
		return unaParcela.superficie() > 6
		
	}
	
}

class Soja inherits Planta {
	
    var property anioDeSuPropiaSemilla
	
	override method toleranciaAlSol() {
		
		if(self.altura() < 0.3) { return 6}
		
		else if(self.altura().between(0.3,0.8)) { return 7}
		
		else {return 12}
		
		
		
	}
	
	method condicionParaDarSemillas() {
		
		return self.anioDeSuPropiaSemilla() < 2007 
		   and self.altura().between(0.75,0.9)
	}
	
	override method daSemillas() {
		
		return super()
		    or self.condicionParaDarSemillas()
		
	}
	
	override method espacioQueOcupa() {
		
		return self.altura() /2
	}
	
	
    override method leResultaIdeal(unaParcela) {
    	
    	return unaParcela.horasAlSol() == self.toleranciaAlSol()
    }
	
}


class Quinoa inherits Planta {
	
	var property espacioQueOcupa
	
	override method toleranciaAlSol() {
		
		if(espacioQueOcupa < 0.3) { return 10}	
		
		else {return super()}
		
	}
	
	override method daSemillas() {
		
		return super() 
		    or self.semillaDeOrigen() < 2005
		
	}
	
	override method leResultaIdeal(unaParcela) {
		
		return unaParcela.plantaConMayorAltura() < 1.5
	}
	
}

class SojaTransgenica inherits Soja {
	
	override method daSemillas() { return false}
	
	override method leResultaIdeal(unaParcela) {
		
		return unaParcela.cantidadMaximaPlantas() == 1
	}
}

class Peperina inherits Menta {
	
	override method espacioQueOcupa() {
		
		return super() * 2
	}
	
	
}


object pricipioDeToleranciasAlSol {
	
	method cuantoTolera() { return 7}
}



