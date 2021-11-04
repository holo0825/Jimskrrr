package com.GroupOne.kai.function;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.kai.service.ActivityService;


@Controller
public class ProcessImage {

	ActivityService activityService;
	ServletContext servletContext; // get pic用

	@Autowired
	public ProcessImage(ActivityService activityService, ServletContext servletContext) {
		this.activityService = activityService;
		this.servletContext = servletContext;
	}

	
	
	
	
	public ProcessImage() {
		
	}

	//上傳圖片
	//回傳一個做好的bean->
	
	//原先的bean-->originMb
	//處理好的bean-->dataMb
//	public ActivityBean uploadImage(ActivityBean dataMb,ActivityBean originMb) {
//		System.out.println("------------------進入處裡圖片方法---------------");
//		// =========================存圖片的方法================================================
//				// 1.存進資料庫(只需要備份一次) 2.存去系統的資料夾中(減輕DB負擔)
//
//				// 方法1.存進資料庫
//				// 上面做完存玩後 再來搬檔案
//				// 為了要自定義檔案(圖片)名稱+主鍵
//		MultipartFile memberImage = originMb.getProductImage();
//		
//		if (memberImage.getSize()==0) {
//			
//			System.out.println("----------------判斷沒圖片上傳哦---------------");
//			//未選圖片
//		}else {
//			String originalFilename=memberImage.getOriginalFilename();
//			if (originalFilename.length()>0&&originalFilename.lastIndexOf(".") > -1) {
//				originMb.setFileName(originalFilename);
//				
//				dataMb.setFileName(originalFilename);
//				System.out.println("originalFilename--黨名--------?"+originalFilename);
//			}
//			//再去建建一個blob物件
//			if (memberImage!=null&&!memberImage.isEmpty()) {
//				try {
//					byte[] b=memberImage.getBytes();
//					Blob blob=new SerialBlob(b);
//					originMb.setHead_shot(blob);
//					
//					dataMb.setHead_shot(blob);
//					System.out.println("blob===2進轉完圖片======>"+blob);
//				} catch (Exception e) {
//					e.printStackTrace();
//					throw new RuntimeException("檔案上傳發生錯誤 in processImage 90");
//				}
//			}
//		}	
//		return dataMb;	
//	}
	
		//----------------載入圖片----------------
		// 加入存取圖片
		// 把表格欄位的圖片抓出來往前端送
		// 要怎麼把blob抓出來改成byte陣列(圖片、檔案)
		@GetMapping("/getPictureactivity/{id}")
		public ResponseEntity<byte[]> getPicture(HttpServletResponse resp,
				@ModelAttribute("activityPage") ActivityBean mb) {
			System.out.println("------------------/getPicture/{id}------------------------id->" + mb.getId());
			// 要放的byte陣列
			byte[] media = null;
			// media - headers(表投)
			HttpHeaders headers = new HttpHeaders();
			String filename = "";
			int len = 0;
			// 用ID找到所有資料
			System.out.println("----------------getProductImage------>" );
			
			Optional<ActivityBean> bean2 = activityService.selectOneUsers(mb.getId());
			System.out.println("----------------getProductImage2------>" + bean2.get().getProductImage());
			
			ActivityBean  bean=bean2.get();
			System.out.println("----------------getProductImage3------>" + bean2.get().getProductImage());
			
			
//				
					try { // 找長度
//						len = (int) blob.length();
//						media = blob.getBytes(1, len); // 地1個位元組(JDBC都是從1開始 0會掛掉)-最後一個取出放入
						media=bean.getActivity_photo();
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

		

}
