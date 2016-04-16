package com.askari

import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import static org.springframework.http.HttpStatus.*

class PhotoController {

	def uploadPhoto(){
		
		java.util.List<MultipartFile> files = request.getFile('file')
		
		if (files.empty){
			log.error("No file to upload");
			response.status = NOT_ACCEPTABLE.value()
			return	
		}
		
		MultipartFile file = files.get(0)
		
		String urlPath = "https://www.askari.xyz/assets"
		String dir = "/var/www/askari-assets";
		
		Random random = new Random() ;
		int randomNumber = random.nextInt(999999999);
		String filename = randomNumber.toString() + ".png";
		
		String filePath = dir + "/" + filename;
		
		File fileDest = new File(filePath)
		file.transferTo(fileDest)
		
		String uri = urlPath+"/"+filename;
		HashMap<String,String> responseDict = new HashMap<String,String>()
		responseDict.put("url", fileDest)
		
		render responseDict as JSON
		render status: OK
	}
	
}
