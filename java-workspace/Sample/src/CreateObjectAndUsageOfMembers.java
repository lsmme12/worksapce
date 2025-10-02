// A 클래스를 만들면, 최상위 클래스인 object 자동으로 상속을 받음.
class A{
	// field 와 method를 classs의 member라고 함.
	int m=3; // field
	void print() { // method
		System.out.println("객체 생성 및 활용");
	}
	// 다형성
	void print(int age) {
		System.out.println("나이: "+age);
	}
}




public class CreateObjectAndUsageOfMembers {
	
	// static은 인스턴스를 생성하지 않고. 실행메모리에 올려서 사용할 수 있게 해줌.
	// 시스템이 main함수를 호출해야하기 떄문에 static을 붙여서 인스턴스 생성없이 사용할 수 있게 함.
	public static void main(String[] args) {
		//A 클래스로 인스턴스 생성 a는 레퍼런스값을 저장하는 변수.
		A a=new A(); // a는 A클래스로 만든 인스턴스를 가리키는 참조값이 저장되는 변수.
		
		a.m=5; // a의 m에 5를 대입
		System.out.println(a.m);
		
		a.print(); // a의 print() 호출
		
		a.print(20);

	}

}
