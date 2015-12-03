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

import com.icoding.domain.Food;
import com.icoding.domain.Image;
import com.icoding.service.FoodService;
import com.icoding.service.FoodTypeService;
import com.icoding.service.ImageService;
import com.icoding.service.StoreService;

@Controller
public class FoodController {

	@Autowired
	private FoodService foodService;

	@Autowired
	private FoodTypeService foodTypeService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = { "/admin/food",
			"/admin/food/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String displayPage(Model model) {
		model.addAttribute("pageName", "Manage Food");
		model.addAttribute("title", "Manage Food");
		model.addAttribute("listFoodTypes", foodTypeService.listFoodType());
		model.addAttribute("listStores", storeService.getAll());
		return "food/index";
	}

	@RequestMapping(value = "/food/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Food> getAll(Model model) {
		List<Food> listFoods = new ArrayList<Food>();
		listFoods = foodService.getAll();
		return listFoods;
	}

	@RequestMapping(value = "/food/new", method = RequestMethod.POST)
	@ResponseBody
	public String addfoodType(HttpServletRequest request, @RequestParam(value = "name") String name,
			@RequestParam(value = "description") String description, @RequestParam(value = "storeBox") String storeBox,
			@RequestParam(value = "foodTypeBox") String foodTypeBox,
			@RequestParam(value = "image") MultipartFile image) {
		Food food = new Food();
		food.setName(name);
		food.setDescription(description);
		food.setFoodType(foodTypeService.get(Integer.parseInt(foodTypeBox)));
		food.setStore(storeService.get(Integer.parseInt(storeBox)));
		ImageProcess imageProcess = new ImageProcess();
		food.setImage(imageProcess.uploadImage(image, request, imageService));
		try {
			foodService.saveOrUpdate(food);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/food/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDistrict(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		Food food = foodService.get(id);
		Image image = food.getImage();
		food.setFoodType(null);
		food.setStore(null);
		try {
			// imageService.remove();
			foodService.remove(food);
			imageService.remove(image);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/food/get", method = RequestMethod.GET)
	@ResponseBody
	public Food getDistrict(@RequestParam(value = "itemId") String itemId) {
		Food food = foodService.get(Integer.parseInt(itemId));
		return food;
	}

	@RequestMapping(value = "/food/update", method = RequestMethod.POST)
	@ResponseBody
	public String updatedistrict(HttpServletRequest request, @RequestParam(value = "foodId") String foodId,
			@RequestParam(value = "name") String name, @RequestParam(value = "description") String description,
			@RequestParam(value = "storeBox") String storeBox, @RequestParam(value = "foodTypeBox") String foodTypeBox,
			@RequestParam(value = "image") MultipartFile image) {
		Food food = foodService.get(Integer.parseInt(foodId));
		food.setName(name);
		food.setDescription(description);
		food.setStore(storeService.get(Integer.parseInt(storeBox)));
		food.setFoodType(foodTypeService.get(Integer.parseInt(foodTypeBox)));
		if(!image.isEmpty()){
			ImageProcess imageProcess = new ImageProcess();
			food.setImage(imageProcess.uploadImage(image, request, imageService));
		}
		try {
			foodService.saveOrUpdate(food);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}
}
