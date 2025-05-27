package day0515;

import java.io.FileWriter;
import java.io.IOException;

public class createHTML {

	public static void main(String[] args) {
		String msg="내이름은 <strong>최승재</strong>입니다.";
		
		try {
			FileWriter fw = new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.html");
			fw.write(msg);
			fw.flush();
			if (fw !=null) {fw.close();}//end if 
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
}
