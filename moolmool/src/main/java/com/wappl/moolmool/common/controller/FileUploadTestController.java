package com.wappl.moolmool.common.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.wappl.moolmool.common.util.FileUploadUtil;
import com.wappl.moolmool.common.util.MediaTypeCheckUtil;

@Controller
public class FileUploadTestController {
	
	private static final String uploadPath = "c:\\upload"; //윈도우
	//private static final String uploadPath = "/home/yeodong/upload";

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String uploadForm() {
		return "common/upload";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString() + "_" + originalName;
		
		File target = new File(uploadPath, saveName);
		
		FileCopyUtils.copy(fileData, target);
		
		return saveName;
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(MultipartFile file, Model model) throws IOException {
		System.out.println("originalName: " + file.getOriginalFilename());
		System.out.println("size: " + file.getSize());
		System.out.println("contentType: " + file.getContentType());
		
		String saveName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("saveName", saveName);
		return "uploadResult";	
	}
	
	@RequestMapping(value="/uploadAjax", method = RequestMethod.GET)
	public String uploadAjax() {
		return "common/uploadAjax";
	}
	
	@ResponseStatus(code=HttpStatus.CREATED)
	@RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String uploadAjax(MultipartFile file) throws Exception{
		return FileUploadUtil
				.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
	}
	
	@ResponseBody
	@RequestMapping("/viewImg")
	public ResponseEntity<byte[]> viewImage(String fileName) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		System.out.println(fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		MediaType mType = MediaTypeCheckUtil.getMediaType(formatName);
		HttpHeaders headers = new HttpHeaders();
		in = new FileInputStream(uploadPath + "\\" + fileName);
		//in = new FileInputStream(uploadPath + "/" + fileName);
		
		if(mType != null) {
			headers.setContentType(mType);
			entity = new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} /*else {
			fileName = fileName.substring(fileName.indexOf("_") + 1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\""+
				new String(fileName.getBytes("UTF-8"), "ISO_8859-1")+"\"");
		}*/else {
			in.close();
			return null;
		}
		
		in.close();
		return entity;
	}
}
