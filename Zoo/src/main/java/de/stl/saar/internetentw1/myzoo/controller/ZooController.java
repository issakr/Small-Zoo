package de.stl.saar.internetentw1.myzoo.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import de.stl.saar.internetentw1.myzoo.database.Database;
import de.stl.saar.internetentw1.myzoo.model.Animal;
import de.stl.saar.internetentw1.myzoo.model.Compound;

/**
 * Der Controller steuert die Navigation innerhalb der Anwendung. Die Methoden
 * geben an, wohin die Navigation beim Aufruf einer bestimmten URL erfolgen soll,
 * nehmen Request-Parameter entgegen, die von Formularen gesendet wurden, und 
 * schreiben neue Parameter in die Requests.
 * 
 * @author Sakr, Issam & Wagner, David
 *
 */
@Controller
public class ZooController {
	private List<Compound> compounds = Database.findAllCompounds();
	private List<Animal> animals;
	private Compound compound;
	private Animal animal;
	
	@RequestMapping("/")
	public String index() {		
		return "index";
	}
	
	@RequestMapping("check-compound")
	public String checkCompound(Model model, String compoundName){
		
			if(compoundName==null){
				model.addAttribute("chooseCompound", true);
				return "index";
			}
			compound = Database.findCompoundByName(compoundName);
			model.addAttribute("compound", compound);
			animals = compound.getAnimals();
			model.addAttribute("animals", animals);
		
		return "compound";
	}
	
	@RequestMapping("check-animal")
	public String checkanimal(Model model, String animalName){
		
			if(animalName==null){
				model.addAttribute("chooseAnimal", true);
				return "compound";
			}
			animal = Database.findAnimalByName(animalName);
			model.addAttribute("animal", animal);
		
		return "animal";
	}

	@RequestMapping("feed")
	public String feed(){
		animal.feed();
		return "animal";
		}

	@RequestMapping("compound")
	public String compound(){
		return "compound";
		}
	

	/**
	 * 	Diese Methode wird als erste ausgefuehrt
	 **/

	 
	@ModelAttribute
	public void modelData(Model model) {
		model.addAttribute("compounds", compounds);
		model.addAttribute("compound", compound);
		model.addAttribute("animals", animals);
		model.addAttribute("animal", animal);
	}
	
}

