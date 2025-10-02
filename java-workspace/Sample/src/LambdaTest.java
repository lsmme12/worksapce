
interface AInterface {
	void abc(); // 추상메서드
}
class B implements AInterface {
	// 부모 A의 추상메서드 반드시 구현
	@Override
	public void abc() {		
		System.out.println("abc");
	}	
}

public class LambdaTest {
	public static void main(String[] args) {
		B b = new B();
		b.abc();
		
		AInterface b2= new B(); // upcasting
		b2.abc();
		
		// 익명 클래스
		AInterface b3= new AInterface() {
			@Override
			public void abc() {
				System.out.println("abc");				
			}
		};
		b3.abc();
		
		// 람다식
		AInterface b4 = () -> { System.out.println("abc"); };
		b4.abc();
	}
}
