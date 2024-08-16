package techblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class HelperToManageFiles {
	
	public static void deleteFile(String path) {
		File file = new File(path);
		file.delete();
	}
	
	public static void saveFile(InputStream input, String path) throws IOException {
		byte b[] = new byte[input.available()];
		input.read(b);
		
		FileOutputStream output = new FileOutputStream(path);
		output.write(b);
		output.flush();
		output.close();
	}
}
