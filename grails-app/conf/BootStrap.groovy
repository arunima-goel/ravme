import org.ravishingme.CosmeticBrand;
import org.ravishingme.Speciality

class BootStrap {

    def init = { servletContext ->
		if (Speciality.list().size() == 0) {
			def specialities = ["Make up", "Hair styling", "Speciality 3", "Speciality 4"]
			specialities.each { speciality ->
				new Speciality(speciality).save(failOnError:true)
			}
		}
		
		if (CosmeticBrand.list().size() == 0) {
			def cosmeticBrands = ["brand1", "brand2", "brand3", "brand4"]
			cosmeticBrands.each { cosmeticBrand ->
				new CosmeticBrand(cosmeticBrand).save(failOnError:true)
			}
		}
		
    }
    def destroy = {
    }
}
