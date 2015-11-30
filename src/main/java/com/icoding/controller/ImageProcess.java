package com.icoding.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.icoding.domain.Image;
import com.icoding.service.ImageService;

public class ImageProcess {

	private static final Logger logger = LoggerFactory.getLogger(ImageProcess.class);

	public Image uploadImage(MultipartFile file, HttpServletRequest request, ImageService imageService) {
		Image image = null;
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Creating the directory to storefile
				File dir = new File(request.getServletContext().getRealPath("") + File.separator + "image");
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				image = new Image();
				image.setExt("abc");
				image.setName(file.getOriginalFilename());
				image.setPath(serverFile.toString());
				imageService.saveOrUpdate(image);

				logger.info("Server File Location=" + serverFile.getAbsolutePath());
				logger.debug("Debug: Save Image Into Upload Folder Successfully");
				return image;

			} catch (Exception e) {
				e.printStackTrace();
				logger.debug("Debug: Save Image Into Upload Folder Fail");
				return image;
			}
		} else {
			logger.debug("Debug: Save Image Into Upload Folder Fail");
			return image;
		}
	}
}
