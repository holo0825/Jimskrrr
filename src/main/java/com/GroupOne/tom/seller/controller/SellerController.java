package com.GroupOne.tom.seller.controller;

import java.sql.Date;
import java.util.List;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.Albert.ajax.dto.MemberDto;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.tom.model.SellerProductBean;
import com.GroupOne.tom.seller.service.SellerService;

@RequestMapping("/seller")
@Controller
public class SellerController {
	
	
	SellerService sellerService;
	ServletContext servletContext;
	
	@Autowired
	public SellerController(SellerService sellerService,ServletContext servletContext) {
		super();
		this.sellerService = sellerService;
		this.servletContext = servletContext;
	}
	
//	@GetMapping("/")
//	public String index() {
//		return "SellerMain";   
//	}
	
	@ModelAttribute("product")
	public SellerProductBean model() {
		SellerProductBean product = new SellerProductBean();
		return product;   
	} 
	
	@GetMapping("/seller/SellerMain")
	public String sellerMain() {
		return "seller/SellerMain";   
	}
	
	@GetMapping("/seller/Seller")
	public String seller() {
		return "seller/Seller";   
	}
	
	@GetMapping("/seller/SellerUpdate")
	public String sellerUpdate(Model model) {
		
		List<SellerProductBean> products = sellerService.findAll();
		
		model.addAttribute("Products", products);
		
		return "seller/SellerUpdate";   
	}
	
	@PostMapping(value = "/seller/sellerForm")
	public String sellerForm(Model model, 
			@ModelAttribute("product") SellerProductBean form) {
		form.setSellerId(sellerId(model));
//		SellerProductBean form = new SellerProductBean(); 	
//		form.setName(Name);
//		form.setPrice(price);
//		form.setPeople(people);
//		form.setDate(date);
		System.out.println("1ok");
		sellerService.insertProduct(form);

		return "redirect:/seller/Seller";
	}	
	
	@GetMapping(value = "/sellerUpdateForm" )
	public String sellerUpdateForm(Model model, 
			@RequestParam(value = "UPDATE" ,required=false) String UPDATE,
			@RequestParam(value = "DELETE" ,required=false) String DELETE,
			@RequestParam(value = "productno") Integer id,
			@RequestParam(value = "productname") String Name,
			@RequestParam(value = "price") Integer price, 
			@RequestParam(value = "people") Integer people,
			@RequestParam(value = "date",required=false) Date date,
			@RequestParam(value = "now") Date now) {
		
		SellerProductBean form = new SellerProductBean(); 
		form.setId(id);
		form.setName(Name);
		form.setPrice(price);
		form.setPeople(people);
		if(date==null) {
			form.setDate(now);
		}else {
			form.setDate(date);
		}
		
		
		if (DELETE != null) {
			sellerService.deleteProduct(id);
		}else if(UPDATE != null) {
			sellerService.updateProduct(form);
		}
		
		return "redirect:/seller/SellerUpdate";
	}	
	
	
	@GetMapping("/getPictureSeller/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp,
			@ModelAttribute("pro") SellerProductBean Seller) {
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		// 用ID找到所有資料
		System.out.println("----------------getProductImage------>" );
		
		Optional<SellerProductBean> bean2 = sellerService.findById(Seller.getId());
		System.out.println("----------------getProductImage2------>" + bean2.get().getProductImage());
		
		SellerProductBean  bean=bean2.get();
		System.out.println("----------------getProductImage3------>" + bean2.get().getProductImage());
		
		
//			
				try { // 找長度
//					len = (int) blob.length();
//					media = blob.getBytes(1, len); // 地1個位元組(JDBC都是從1開始 0會掛掉)-最後一個取出放入
					media=bean.getPicture();
					System.out.println("----------------有圖片哦------------filename--->" + filename);
				} catch (Exception e) {
					System.out.println("----------------圖片錯誤-------------");
					throw new RuntimeException("MemberController的getPicture()發生SQLException: " + e.getMessage());
				}
		
		// 不要放去快取區
		System.out.println("----------------快取前-------------");
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		System.out.println("----------------快取後-------------");

		MediaType mediaType;
		
			mediaType = MediaType.valueOf("image/jpg");
		
		System.out.println("----------------getMimeType 轉MediaType後-------------");
		System.out.println("mediaTypeForm member =" + mediaType);

		headers.setContentType(mediaType);
		// 開始建立
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	public int sellerId(Model model) {
		Member sellerBean = (Member) model.getAttribute("seller");
	    int sellerid = sellerBean.getId();
	    return sellerid;
	}
}
