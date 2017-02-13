package com.wappl.moolmool.common.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {

	@RequestMapping(value="/fileupload/tmp", method = RequestMethod.POST)
	public String imageUpload(HttpServletRequest request, 
			Model model,
			HttpServletResponse response,
			@RequestParam MultipartFile upload) {
		HttpSession session = request.getSession();
		String rootPath = session.getServletContext().getRealPath("/");
		String savePath = "resources/upload";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		File dirPath = new File(rootPath + savePath);
		
		if(! dirPath.exists()) {
			dirPath.mkdir();
		}

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			out = new FileOutputStream(new File(rootPath + "/" + savePath + "/" + fileName));
			out.write(bytes);
			
			String fileUrl = session.getServletContext().getContextPath() + "/" + savePath + "/" + fileName;
			
		    model.addAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"))
		    		.addAttribute("fileUrl", fileUrl);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "common/fileupload";
	}
}
