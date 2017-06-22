
import java.util.List
import java.time.LocalDateTime

class FuncionProgramada {
	var List<Dia> dias
	var Funcion func
	var AdmDispositivo adm
	
	new(List<Dia> dias, Funcion func, AdmDispositivo adm){
		this.dias = dias
		this.func = func
		this.adm = adm
	}
	
	def void execute(){
		if(this.esElMomento){
			func.execute(adm)
		}
	}
	
	def boolean esElMomento(){
		val LocalDateTime ldt = LocalDateTime.now()
		this.esElDia(ldt) && this.esLaHora(ldt) && this.esElMinuto(ldt)
	}
	
	def boolean esElDia(LocalDateTime ldt){
		dias.map(day | day.dia).contains(ldt.dayOfWeek)
	}
	
	def boolean esLaHora(LocalDateTime ldt){
		dias.map(day | day.hora).contains(ldt.hour)
	}
	def boolean esElMinuto(LocalDateTime ldt){
		dias.map(day | day.minuto).contains(ldt.minute)
	}
}