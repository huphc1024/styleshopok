package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LibraryFile {
	
	public static String rename(String fileName){
		String[] arrImg =  fileName.split("\\.");
		String duoiFileImg = arrImg[arrImg.length - 1];
		String nameFile = "";
		for (int i  = 0;i< (arrImg.length - 1) ; i++) {
			if(i == 0){
				nameFile = arrImg[i];
			}else{
				nameFile += "-"+arrImg[i];
			}
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("ddMMyyyyhhmmss");
		String portal_time = format.format(date.getTime());
		nameFile = nameFile + "_"+ portal_time +"."+duoiFileImg;
		return nameFile;
	}
	
	
}