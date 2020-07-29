package grasse.admin.item;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

@Controller
public class CKEditorFileUploadController {

	@RequestMapping(value = "/admin/fileUpload.do", method = RequestMethod.POST)
	public void fileUpoad(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		// 인코딩
		OutputStream out = null;
		PrintWriter printWriter = null;
		MultipartFile file = multiFile.getFile("upload");

		try {

			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String uploadPath = request.getSession().getServletContext().getRealPath("../");

			File uploadFile = new File(uploadPath);
			fileName = uid.toString();
			uploadPath = uploadPath + "resources" + File.separator + "ckUpload" + File.separator + fileName;
			out = new FileOutputStream(new File(uploadPath));
			
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			// String callback = request.getParameter("CKEditorFunoNum");
			printWriter = response.getWriter();
			response.setContentType("text/html");
			String fileUrl = request.getContextPath() + "/resources/ckUpload/" + fileName; // 작성화면

			// Json 데이터로 등록
			// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "img/test.jpg"}
			// 이런 형태로 리턴이 나가야함
			JsonObject json = new JsonObject();
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);
			printWriter.println(json);

			printWriter.flush();

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
		return;
	}

}
