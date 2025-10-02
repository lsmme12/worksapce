// 296P 코드
class AA{
	int m=3; // 인스턴스 필드
	static int n=5; // 정적 필드 // static은 공유 메모리. 모든 객체가 하나의 n을 공유 
	
	// static 은 상수 선언에 주로 사용 
	final static double PI=3.14; // 상수 . final은 값 변경 불가 
}


public class StaticFleld_2 {

	public static void main(String[] args) {
		System.out.println(AA.n); // 클래스명. 정적 필드명 형식 으로 사용
		
		AA a1 = new AA(); 
		AA a2 = new AA();
		
		
		a1.n=7; // 권장하지 않음. 정적필드는 클래스명. 정적필드명 형식으로 사용
		System.out.println(a1.n); // 7
		System.out.println(a2.n); // 7
		
		System.out.println(AA.PI);
	}
}
