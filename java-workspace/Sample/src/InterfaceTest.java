// InterfaceTest 예제 코드
interface printable{
	void print(); // public abstract void print ();
}
class A4 implements printable{
	@Override
	public void print() {
		System.out.println("A4");
	}
}

public class InterfaceTest {

	public static void main(String[] args) {
		// printable p=new printable(); // 인터페이스 인스턴스 생성불가
		A4 p=new A4();
		p.print();
	}

}
