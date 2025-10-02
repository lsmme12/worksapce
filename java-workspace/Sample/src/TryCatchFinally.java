//예외처리 연습
import java.util.Scanner;
public class TryCatchFinally {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in); // Scanner 객체 생성
		System.out.print("분자입력: ");
		int a=scanner.nextInt();
		System.out.print("분모입력: ");
		int b=scanner.nextInt();
		try {
			System.out.println(a/b); //분모가 0이면 무한대. ArithmeticException
		}catch(Exception e) {
			e.printStackTrace(); //디버깅용 출력
			//System.out.println("분모가 0이면 안됩니다.");
		}
		System.out.println("이 메세지가 보일까요?");
		
	}

}
