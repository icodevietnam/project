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

import com.icoding.domain.Image;
import com.icoding.domain.Store;
import com.icoding.service.DistrictService;
import com.icoding.service.FoodTypeService;
import com.icoding.service.ImageService;
import com.icoding.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private DistrictService districtService;

	@Autowired
	private FoodTypeService foodTypeService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = { "/admin/store",
			"/admin/store/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String displayPage(Model model) {
		model.addAttribute("pageName", "Manage Store");
		model.addAttribute("title", "Manage Store");
		model.addAttribute("listDistricts", districtService.getAll());
		model.addAttribute("listStoreTypes", foodTypeService.listStoreType());
		return "store/index";
	}

	@RequestMapping(value = "/store/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Store> getAll(Model model) {
		List<Store> listStores = new ArrayList<Store>();
		listStores = storeService.getAll();
		return listStores;
	}

	@RequestMapping(value = "/store/new", method = RequestMethod.POST)
	@ResponseBody
	public String addfoodType(HttpServletRequest request, @RequestParam(value = "name") String name,
			@RequestParam(value = "description") String description, @RequestParam(value = "address") String address,
			@RequestParam(value = "openHourBox") String openHourBox,
			@RequestParam(value = "closeHourBox") String closeHourBox,
			@RequestParam(value = "priceLimit") String priceLimit, @RequestParam(value = "phone") String phone,
			@RequestParam(value = "districtBox") String districtBox,
			@RequestParam(value = "storeTypeBox") String storeTypeBox,
			@RequestParam(value = "image") MultipartFile image) {
		Store store = new Store();
		store.setName(name);
		store.setDescription(description);
		store.setAddress(address);
		store.setOpenHour(openHourBox);
		store.setCloseHour(closeHourBox);
		store.setPriceLimit(priceLimit);
		store.setPhone(phone);
		store.setDistrict(districtService.get(Integer.parseInt(districtBox)));
		store.setStoreType(foodTypeService.get(Integer.parseInt(storeTypeBox)));
		ImageProcess imageProcess = new ImageProcess();
		store.setImage(imageProcess.uploadImage(image, request, imageService));
		try {
			storeService.saveOrUpdate(store);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/store/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDistrict(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		Store store = storeService.get(id);
		Image image = store.getImage();
		store.setImage(null);
		store.setDistrict(null);
		store.setStoreType(null);
		try {
			// imageService.remove();
			storeService.remove(store);
			imageService.remove(image);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/store/get", method = RequestMethod.GET)
	@ResponseBody
	public Store getDistrict(@RequestParam(value = "itemId") String itemId) {
		Store store = storeService.get(Integer.parseInt(itemId));
		return store;
	}

	@RequestMapping(value = "/store/update", method = RequestMethod.POST)
	@ResponseBody
	public String updatedistrict(HttpServletRequest request, @RequestParam(value = "storeId") String storeId,
			@RequestParam(value = "name") String name, @RequestParam(value = "description") String description,
			@RequestParam(value = "address") String address, @RequestParam(value = "openHourBox") String openHourBox,
			@RequestParam(value = "closeHourBox") String closeHourBox,
			@RequestParam(value = "priceLimit") String priceLimit, @RequestParam(value = "phone") String phone,
			@RequestParam(value = "districtBox") String districtBox,
			@RequestParam(value = "storeTypeBox") String storeTypeBox,
			@RequestParam(value = "image") MultipartFile image) {
		Store store = storeService.get(Integer.parseInt(storeId));
		store.setName(name);
		store.setDescription(description);
		store.setAddress(address);
		store.setOpenHour(openHourBox);
		store.setCloseHour(closeHourBox);
		store.setPriceLimit(priceLimit);
		store.setPhone(phone);
		store.setDistrict(districtService.get(Integer.parseInt(districtBox)));
		store.setStoreType(foodTypeService.get(Integer.parseInt(storeTypeBox)));
		if (!image.isEmpty()) {
			ImageProcess imageProcess = new ImageProcess();
			store.setImage(imageProcess.uploadImage(image, request, imageService));
		}
		try {
			storeService.saveOrUpdate(store);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}
}
