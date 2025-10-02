// abstract 예제 코드

abstract class airplane{
	abstract void takeoff(); //추상메서드
}
class F16 extends airplane{
	@Override
	void takeoff() {
		System.out.println("F16 이륙합니다.");
	}
}
class B747 extends airplane{
	@Override
	void takeoff() {
		System.out.println("B747 이륙합니다.");
	}
}


public class AbstractTest {
	public static void main(String[] args) {
		//airplane a=new airplane(); // 추상클래스는 인스턴스 생성 불가
		
		airplane a1 = new F16();
		airplane a2 = new B747();
		
        a1.takeoff(); 
        a2.takeoff(); 
	}
}
