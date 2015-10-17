import org.ravishingme.Speciality

class BootStrap {

    def init = { servletContext ->
		
		def specialities = ["Make up", "Hair styling", "Speciality 3", "Speciality 4"]
		specialities.each { speciality ->
			new Speciality(speciality).save(failOnError:true)
		}
		
    }
    def destroy = {
    }
}
