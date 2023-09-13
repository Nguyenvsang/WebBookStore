package com.nhom14.webbookstore.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface CloudinaryService {
	String uploadImage(MultipartFile image, String publicId) throws IOException;
}
