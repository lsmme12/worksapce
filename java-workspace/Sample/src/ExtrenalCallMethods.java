class A1{
	void print() {
		System.out.println("안녕");
	}
	int data() {
		return 3;
	}
	double sum(int a,double b) {
		return a+b;
	}
	void printMonth(int m) {
		if(m<0 || m>12) {
			System.out.println("잘못된 입력");
			return;
		}
		System.out.println(m+"월입니다.");
	}
}



public class ExtrenalCallMethods {

	public static void main(String[] args) {
		A1 a=new A1();
		a.print();
		int k=a.data();
		System.out.println(k);
		double result=a.sum(3, 5.2);
		System.out.println(result);
		a.printMonth(5);
		a.printMonth(15);
		
		A1 b=new A1(); //b는 인스턴스명. 인스턴스명에는 인스턴스를 가리키는 레퍼런스가 저장됨.
		b.data();
		
		// new A1() 이 실행되면 인스턴스가 생성되고 생성된 인스턴스를 가리키는 레퍼런스가 리턴됨.
		new A1().printMonth(7); // 여기서 레퍼런스값은 한번 사용후 없어짐.
		new A1().print();
	}

}
