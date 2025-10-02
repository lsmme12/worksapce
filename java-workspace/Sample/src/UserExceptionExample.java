import java.util.Scanner;

//사용자 정의 예외 클래스
class MinusException extends Exception {
	public MinusException() {
		super();
	}
	//메세지를 매개변수로 받는 생성자. 생성자 오버로딩
	public MinusException(String message) {
		super(message); //Exception 클래스의 생성자 호출
	}
}
class OverException extends Exception {
	public OverException() {
		super();
	}
	//메세지를 매개변수로 받는 생성자. 생성자 오버로딩
	public OverException(String message) {
		super(message); //Exception 클래스의 생성자 호출
	}
}
class A111{
	void abc(int score) throws MinusException, OverException {
		if(score<0) {
			throw new MinusException("점수가 음수일 수 없습니다."); //예외 객체 생성
		}else if(score>100) {
			throw new OverException("점수가 100점을 넘을 수 없습니다.");
		}else {
			System.out.println("점수: "+score);
		}
	}
	void bcd() {
		try {
			abc(-5);
		}catch(MinusException e) {
			e.printStackTrace();
		}catch(OverException e) {
			e.printStackTrace();
		}
	}
	public void checkScore(int score) throws MinusException, OverException {
	    abc(score);
	}

}

public class UserExceptionExample {
	//기본 생성자
	public static void main(String[] args) {
		A111 a = new A111();
		Scanner scanner = new Scanner(System.in);
		System.out.print("점수입력(0~100): ");
		int score=scanner.nextInt();
		try {
			a.checkScore(score);
			}catch(MinusException |OverException e) {
				System.out.println(e.getMessage());
		}
		scanner.close();

	}

}
