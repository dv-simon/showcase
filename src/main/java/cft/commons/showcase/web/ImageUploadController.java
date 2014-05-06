package cft.commons.showcase.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cft.commons.core.model.display.ResultJSON;
import cft.commons.core.util.FileDirUtils;

@Slf4j
@Controller
public class ImageUploadController {

	@Value("${upload.filepath.imagetemp}")
	private String imageTempPath;

	@Value("${upload.filepath.imageprod}")
	private String imageProdPath;

	@RequestMapping(value = "/view/imageUpload", method = RequestMethod.GET)
	public String test(String item, String subItem, Model model, HttpSession session) {
		session.setAttribute("item", item);
		session.setAttribute("subItem", subItem);
		return "imageUpload";
	}

	/**
	 * Upload single file using Spring Controller for preview
	 */
	@RequestMapping(value = "/api/previewImage", method = RequestMethod.POST)
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
					String reName = "img" + System.currentTimeMillis() + fileExtension;

					// Create the temp file on server
					String uploadFullPath = System.getProperty("application.webapproot") + File.separatorChar
							+ imageTempPath;

					log.info("Server uploadFullPath=" + uploadFullPath);
					File serverFile = new File(uploadFullPath + File.separatorChar + reName);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();

					json.setSuccess(true);
					json.setDataObject(reName);
				} else {
					json.setMessage("Not image, can't upload.");
				}

			} catch (Exception e) {
				log.error("Exception during previewImage.", e);
			}
		} else {
			log.warn("file.isEmpty");
			json.setMessage("File is empty");
		}

		return json;
	}

	/**
	 * get list of image file name 
	 */
	@RequestMapping(value = "/api/image", method = RequestMethod.GET)
	public @ResponseBody
	ResultJSON getImageList() {
		ResultJSON json = new ResultJSON();

		List<String> imageList = new ArrayList<String>();

		String imageProdFullPath = System.getProperty("application.webapproot") + File.separatorChar + imageProdPath;

		String[] exts = new String[] { "png", "jpg" };
		List<File> fileList = FileDirUtils.listFiles(new File(imageProdFullPath), exts, false);

		for (File file : fileList) {
			imageList.add(file.getName());
		}

		json.setSuccess(true);
		json.setDataObject(imageList);

		return json;

	}

	/**
	 * transfer confirmed image to PROD folder
	 */
	@RequestMapping(value = "/api/confirmImage", method = RequestMethod.GET)
	public @ResponseBody
	ResultJSON confirmImage(String fileName) {
		ResultJSON json = new ResultJSON();

		File srcFile = new File(System.getProperty("application.webapproot") + File.separatorChar + imageTempPath
				+ File.separatorChar + fileName);

		File destFile = new File(System.getProperty("application.webapproot") + File.separatorChar + imageProdPath
				+ File.separatorChar + fileName);

		try {
			FileUtils.copyFile(srcFile, destFile);
		} catch (IOException e) {
			log.error("Exception during confirmImage.", e);
		}

		if (destFile.exists()) {
			json.setSuccess(true);
		}

		return json;

	}
}
