// 325P 코드 , 327P 코드 둘다 같이 한것. 
class A100{
	int m=3;
	void abc() {
		System.out.println("A100:abc()");
	}
}
class B100 extends A100{
	int n=4;
	void bcd() {
		System.out.println("B100:bcd()");
	}
}




public class Typecasting_2 {

	public static void main(String[] args) {
		A100 ab=new B100(); //Up casting (저동 형변환). 자식 to 부모 가능.
		System.out.println(ab.m);
		ab.abc();
		// System.out.println(ab.n); // 접근 불가
		// System.out.println(ab.bcd()); // 접근 불가
		
		// --327P code
		A100 aa=new A100();
		System.out.println(aa instanceof A100);
		
		A100 aabb = new B100(); // Up casting
		System.out.println(aabb instanceof B100);
		
		B100 b=(B100)aabb; // Down casting ( 강제 형변환 ). 부모 to 자식 불가 cast 연산자 사용
		System.out.println(b.m);
		System.out.println(b.n);
		b.abc();
		b.bcd();
	}

}
