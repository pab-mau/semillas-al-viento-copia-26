object inta {
	
	var property parcelas = #{}
	
	method cantidadTotalPlantas() {
		
		return parcelas.sum({p=>p.cantidadPlantas()})
	}
	
	method cantidadParcelas() {
		
		return parcelas.size()
	}
	
	
	method promedioDePlantas() {
		
		return self.cantidadTotalPlantas() / self.cantidadParcelas()
			
	}
	
	method parcelaConMasDe4Plantas() {
		
		return parcelas.filter({p=>p.cantidadPlantas() > 4})
		
	}
	
	method parcelaConMaxPorcentajeDePBienAsociadas() {
		
		return parcelas.max({p=>p.porcentajeDePlantasBienAsociadas()})
	}
	
	
	
	method laMasAutosustentable () {
		
		return self.parcelaConMasDe4Plantas()
		   and self.parcelaConMaxPorcentajeDePBienAsociadas()
		
	}
}
