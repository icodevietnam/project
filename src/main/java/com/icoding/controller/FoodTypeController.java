package com.icoding.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.icoding.domain.District;
import com.icoding.domain.FoodType;
import com.icoding.domain.Image;
import com.icoding.service.FoodTypeService;

@Controller
public class FoodTypeController {

	@Autowired
	private FoodTypeService foodTypeService;

	@RequestMapping(value = { "/admin/foodType",
			"/admin/foodType/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String displayPage(Model model) {
		model.addAttribute("pageName", "Manage Food Type");
		model.addAttribute("title", "Manage Food Type");
		model.addAttribute("listParent", foodTypeService.listParent());
		return "foodType/index";
	}

	@RequestMapping(value = "/foodType/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<FoodType> getAll(Model model) {
		List<FoodType> listFoodTypes = new ArrayList<FoodType>();
		listFoodTypes = foodTypeService.getAll();
		return listFoodTypes;
	}
	
	@RequestMapping(value = "/foodType/new", method = RequestMethod.POST)
	@ResponseBody
	public String addfoodType(HttpServletRequest request, @RequestParam(value = "name") String name,
			@RequestParam(value = "description") String description,
			@RequestParam(value = "foodTypeBox") String foodTypeId) {
		FoodType foodType= new FoodType();
		foodType.setName(name);
		foodType.setDescription(description);
		if (foodTypeId.equalsIgnoreCase("0")) {
			foodType.setFoodType(null);
		}else {
			FoodType ft = foodTypeService.get(Integer.parseInt(foodTypeId));
			foodType.setFoodType(ft);
		}
		try {
			foodTypeService.saveOrUpdate(foodType);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}
	
	@RequestMapping(value = "/foodType/get", method = RequestMethod.GET)
	@ResponseBody
	public FoodType getDistrict(@RequestParam(value = "itemId") String itemId) {
		FoodType foodType = foodTypeService.get(Integer.parseInt(itemId));
		return foodType;
	}
	
	@RequestMapping(value = "/foodType/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDistrict(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		FoodType foodType = foodTypeService.get(id);
		if(foodType.getFoodType()!=null){
			foodType.setFoodType(null);
		}
		try {
			// imageService.remove();
			foodTypeService.remove(foodType);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}
	
	@RequestMapping(value = "/foodType/update", method = RequestMethod.POST)
	@ResponseBody
	public String updatefoodType(HttpServletRequest request,@RequestParam(value = "foodTypeId") String foodTypeId,
			@RequestParam(value = "name") String name, @RequestParam(value = "description") String description, @RequestParam(value="foodTypeBox") String foodTypeBox) {
		FoodType foodType = foodTypeService.get(Integer.parseInt(foodTypeId));
		foodType.setName(name);
		foodType.setDescription(description);
		if(foodTypeBox.equalsIgnoreCase("0")){
			foodType.setFoodType(null);
		}else {
			foodType.setFoodType(foodTypeService.get(Integer.parseInt(foodTypeBox)));
		}
		try {
			foodTypeService.saveOrUpdate(foodType);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}
}
