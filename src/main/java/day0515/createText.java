package day0515;

import java.io.FileWriter;
import java.io.IOException;

public class createText {

	public static void main(String[] args) {
		String msg="오늘은 AJAX 동작은 쉽지않구만";
		
		try {
			FileWriter fw = new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.txt");
			fw.write(msg);
			fw.flush();
			if (fw !=null) {fw.close();}//end if 
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
}
