import plantas.*

class Parcela {
	
	var property ancho
	var property largo
	var property horasAlSol
	var property plantas = []
	var property tipoDeParcela
	
	method superficie() { return ancho * largo}
	method esMayorElAncho() { return ancho > largo}
	
	method cantidadMaximaPlantas() {
		
		if(self.esMayorElAncho()) { return self.superficie() / 5}
		else {return  self.superficie() / 3 + largo}
		
	}
	
	
	method tieneComplicaciones() {
		
		return plantas.any({p=>p.toleranciaAlSol() < self.horasAlSol() })
	}
	
	method cantidadPlantas() {
		
		return plantas.size()
	}
	
	method puedePlantar() {
		
		return self.cantidadPlantas() < self.cantidadMaximaPlantas()
	}
	
	method aguantaElSolDeParcela(unaPlanta) {
		
		return unaPlanta.toleranciaAlSol() >= horasAlSol - 2 
		
	}
	
	method plantar(unaPlanta) {
		
		if(self.puedePlantar()) { plantas.add(unaPlanta)}
		
		else if(not self.puedePlantar()) { self.error("no puede plantar")}
		
		else if(not self.aguantaElSolDeParcela(unaPlanta)) { self.error("la planta se calcina")}
		
		
	}
	
	method plantaConMayorAltura() {
		
		return plantas.max({p=>p.altura()}.altura())	
	}
	
	method esEcologica() { return tipoDeParcela == ecologica}
	method esIndustrial() { return tipoDeParcela == industrial}
	
	method cantidadPlantasBienAsociadas() {
		
		return plantas.count({p=>p.leResultaIdeal(self)})
	}
	
	method porcentajeDePlantasBienAsociadas() {
		
		return self.cantidadPlantasBienAsociadas() / self.cantidadPlantas()
	}
	
	
}

object ecologica {}

object industrial {}






