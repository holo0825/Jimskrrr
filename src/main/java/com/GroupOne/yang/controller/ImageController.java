package com.GroupOne.yang.controller;

import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.yang.model.ArticleBean;
import com.GroupOne.yang.service.ArticleService;

@Controller
public class ImageController {

	ArticleService articleService;
	ServletContext servletContext;
	
	@Autowired
	public ImageController(ArticleService articleService, ServletContext servletContext) {
		this.articleService = articleService;
		this.servletContext = servletContext;
	}

	public ImageController() {
	}
	@GetMapping("/getPicture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp,
			@ModelAttribute("article") ArticleBean ab){
		 String filePath = "/resources/images/NoImage.jpg";
		 
		byte[] media = null;
		HttpHeaders headers= new HttpHeaders();
//		String filename="";
		
		int len=0;
		//用ID找到所有資料
		Optional<ArticleBean> bean2 = articleService.getArticleById(ab.getId());
		if(ab != null) {
			Blob blob = bean2.get().getArticleImage();
//			filename = bean2.get().getFilename();
			if(blob!=null) {
				try {
					len=(int) blob.length();
					media = blob.getBytes(1, len);
				}catch (Exception e) {
						throw new RuntimeException("getPicture()發生SQLException");
				}
			}else {
				media = toByteArray(filePath);
//				filename= filePath;
			}
		}else {
			media = toByteArray(filePath);
//			filename=filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		
//		String mimeType = servletContext.getMimeType(filename);
//		MediaType mediaType = MediaType.valueOf(mimeType);
//		System.out.println("mimeType"+mimeType);
//		System.out.println("-------MediaType"+mediaType);
		MediaType mediaType;
        mediaType = MediaType.valueOf("image/jpg");
        headers.setContentType(mediaType);

		ResponseEntity<byte[]> responseEntity=new ResponseEntity<>(media,headers,HttpStatus.OK);
		return responseEntity;
	}
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = servletContext.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = servletContext.getResourceAsStream(filepath);
			fis.read(b);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
}
