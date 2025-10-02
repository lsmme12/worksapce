import java.io.File;

public class FileIO {

	public static void main(String[] args) {
		File temp1 = new File("c:\\temp1");
		System.out.println(temp1.getAbsolutePath()); // 절대 경로
		System.out.println(temp1.isDirectory()); // 디렉토리 여부
		System.out.println(temp1.isFile()); // 파일 여부
		
		File dir = new File("C:temp1\\hkd");
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		File file = new File("C:\\temp1\\hkd\\2025\\10\\02");
		if(!file.exists()) {
			file.mkdirs(); // 하위 디렉토리까지 생성.
		}
		
		File[] files = temp1.listFiles(); // temp 디렉토리 내 파일 및 디렉토리 목록
		for(File f : files) {
			System.out.println(f.getName());
		}
		
		
	}
}
