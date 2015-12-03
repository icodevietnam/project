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
import com.icoding.domain.Image;
import com.icoding.service.DistrictService;
import com.icoding.service.ImageService;

@Controller
public class DistrictController {

	@Autowired
	private DistrictService districtService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = { "/admin/district",
			"/admin/district/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String displayPage(Model model) {
		model.addAttribute("pageName", "Manage District");
		model.addAttribute("title", "Manage District");
		return "district/index";
	}

	@RequestMapping(value = "/district/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<District> getAll(Model model) {
		List<District> listDistricts = new ArrayList<District>();
		listDistricts = districtService.getAll();
		return listDistricts;
	}

	@RequestMapping(value = "/district/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDistrict(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		District district = districtService.get(id);
		Image image = district.getImage();
		district.setImage(null);
		try {
			// imageService.remove();
			districtService.remove(district);
			imageService.remove(image);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/district/new", method = RequestMethod.POST)
	@ResponseBody
	public String adddistrict(HttpServletRequest request, @RequestParam(value = "name") String name,
			@RequestParam(value = "description") String description,
			@RequestParam(value = "image") MultipartFile image) {
		District district = new District();
		district.setName(name);
		district.setDescription(description);
		ImageProcess imageProcess = new ImageProcess();
		district.setImage(imageProcess.uploadImage(image, request, imageService));
		try {
			districtService.saveOrUpdate(district);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/district/update", method = RequestMethod.POST)
	@ResponseBody
	public String updatedistrict(HttpServletRequest request, @RequestParam(value = "districtId") String districtId,
			@RequestParam(value = "name") String name, @RequestParam(value = "description") String description,
			@RequestParam(value = "image") MultipartFile image) {
		District district = districtService.get(Integer.parseInt(districtId));
		district.setName(name);
		district.setDescription(description);
		if (!image.isEmpty()) {
			ImageProcess imageProcess = new ImageProcess();
			district.setImage(imageProcess.uploadImage(image, request, imageService));
		}
		try {
			districtService.saveOrUpdate(district);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/district/get", method = RequestMethod.GET)
	@ResponseBody
	public District getDistrict(@RequestParam(value = "itemId") String itemId) {
		District district = districtService.get(Integer.parseInt(itemId));
		return district;
	}

}
