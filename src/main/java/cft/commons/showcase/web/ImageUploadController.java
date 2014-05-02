package cft.commons.showcase.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cft.commons.core.model.display.ResultJSON;

@Slf4j
@Controller
public class ImageUploadController {

	@Value("${upload.file.path}")
	private String uploadFilePath;

	@RequestMapping(value = "/view/imageUpload", method = RequestMethod.GET)
	public String test(String item, String subItem, Model model, HttpSession session) {
		session.setAttribute("item", item);
		session.setAttribute("subItem", subItem);
		return "imageUpload";
	}

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/api/imageUpload", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON uploadFileHandler(@RequestParam("fileName") String fileName, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) {

		ResultJSON json = new ResultJSON();

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				String contentType = file.getContentType().toLowerCase();

				if (contentType.contains("image") && (contentType.contains("jpeg") || contentType.contains("png"))) {

					String orgFileName = file.getOriginalFilename();
					String fileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
					String uploadFileName = "img" + System.currentTimeMillis() + fileExtension;

					// Create the file on server
					String uploadFullPath = System.getProperty("application.webapproot") + File.separatorChar
							+ uploadFilePath;
					log.info("Server uploadFullPath=" + uploadFullPath);
					File serverFile = new File(uploadFullPath + File.separatorChar + uploadFileName);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();

					json.setSuccess(true);
					json.setMessage("Image uploaded onto: " + serverFile.getAbsolutePath());
					json.setDataObject(uploadFileName);
				} else {
					json.setMessage("Not image, can't upload.");
				}

			} catch (Exception e) {
				json.setMessage(e.getMessage());
			}
		} else {
			log.info("file.isEmpty");
			json.setMessage("File is empty");
		}

		return json;
	}

}
