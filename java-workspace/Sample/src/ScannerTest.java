
import java.util.Scanner;

public class ScannerTest {

	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		
		
		System.out.print("이름 : ");
		String name=s.next();
		System.out.print("나이 : ");
		int age=s.nextInt();
		
		System.out.println(name);
		System.out.println(age);
	}

}
