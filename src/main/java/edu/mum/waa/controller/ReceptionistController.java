package edu.mum.waa.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.waa.domain.Receptionist;
import edu.mum.waa.domain.User;
import edu.mum.waa.service.ReceptionistService;

@Controller
public class ReceptionistController {
	@Autowired
	ReceptionistService receptionistService;

	@RequestMapping(value = "/admin/receptionist/addReceptionist", method = RequestMethod.GET)
	public String addReceptionistForm(@ModelAttribute("addReceptionist") Receptionist receptionist) {
		return "addReceptionist";
	}

	@RequestMapping(value = "/admin/receptionist/addReceptionist", method = RequestMethod.POST)
	public String addReceptionist(@Valid @ModelAttribute("addReceptionist") Receptionist receptionist,
			BindingResult bindingResult, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes)
			throws FileNotFoundException {
		if (receptionistService.emailExists(receptionist)) {
			bindingResult.rejectValue("email", "receptionist.Email");
		}
		if (bindingResult.hasErrors()) {
			return "addReceptionist";
		}

		MultipartFile image = receptionist.getImage();
		String rootDirectory = "C:\\\\Users\\\\Niroj\\\\Desktop\\\\WAA_Project_JDN_Team\\\\clinic-appointment-system\\\\src\\\\main\\\\webapp\\\\resources\\\\images\\\\";
		if (image != null && !image.isEmpty()) {
			String imageFileName = image.getOriginalFilename().toLowerCase();
			String acceptedFileExtentions = ".jpg .png .gif";
			int lastIndex = imageFileName.lastIndexOf('.');
			String imageFileExtension = imageFileName.substring(lastIndex, imageFileName.length());

			if (acceptedFileExtentions.contains(imageFileExtension)) {
				Receptionist savedReceptionist = receptionistService.add(receptionist);
				String destinationImage = rootDirectory + savedReceptionist.getLastName() + "_"
						+ savedReceptionist.getId() + ".jpg";

				try {
					image.transferTo(new File(destinationImage));
				} catch (Exception e) {
					// rollback the save
					receptionistService.delete(savedReceptionist);
					throw new FileNotFoundException("Unable to save file: " + image.getOriginalFilename());
				}

				redirectAttributes.addFlashAttribute("receptionist", savedReceptionist);

				return "redirect:/admin/receptionist";

			} else {
				model.addAttribute("imgError", true);
			}

		} else {
			model.addAttribute("imgError", true);
		}

		return "addReceptionist";
	}

	@RequestMapping(value = "/admin/receptionist", method = RequestMethod.GET)
	public String getList(Model model) {
		List<Receptionist> receptionists = receptionistService.findAllActive();
		model.addAttribute("receptionists", receptionists);
		return "adminReceptionists";
	}

	@RequestMapping(value = "/admin/receptionist/addReceptionist/{id}", method = RequestMethod.GET)
	public String editReceptionistPage(@PathVariable("id") long id,
			@ModelAttribute("addReceptionist") Receptionist receptionist, Model model) {
		receptionist = receptionistService.findOne(id);
		model.addAttribute("addReceptionist", receptionist);

		return "addReceptionist";
	}

	@RequestMapping(value = "/admin/receptionist/addReceptionist/{id}", method = RequestMethod.POST)
	public String editReceptionist(@ModelAttribute("addReceptionist") Receptionist receptionist, Model model,
			BindingResult bindingResult) {
		User user = receptionistService.getUserFromReceptionist(receptionist.getId());
		receptionist.getUser().setId(user.getId());

		if (receptionistService.emailExists(receptionist)) {
			bindingResult.rejectValue("email", "receptionist.Email");
		}
		if (bindingResult.hasErrors()) {
			return "addReceptionist";
		}

		receptionistService.edit(receptionist);
		return "redirect:/admin/receptionist";
	}

	@RequestMapping(value = "/admin/receptionist/deleteReceptionist/{id}", method = RequestMethod.GET)
	public String deleteReceptionist(@PathVariable("id") long id) {
		receptionistService.delete(id);
		return "redirect:/admin/receptionist";

	}

	@RequestMapping(value = "/receptionist/receptionistProfile", method = RequestMethod.GET)
	public String viewProfilePage(Model model) {
		Receptionist receptionist = receptionistService.findByEmail(ControllerHelper.getCurrentUser().getUsername());
		model.addAttribute("receptionist", receptionist);
		return "receptionistProfile";

	}

}