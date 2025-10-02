class AAA{
	int a=3;
	void abc() {
		int b=5;
		//inner class
		class BBB{
			void bcd() {
				System.out.println(a);
				System.out.println(b);
				a=5;
				//b=7; //local variable b cannot be assigned because it is final
			}
		}
		//inner class의 인스턴스 생성. outer class안에서 사용.
		BBB bbb = new BBB();
		bbb.bcd();
	}
}

public class AccessMemberAndLocalVariable {


	public static void main(String[] args) {
		AAA a = new AAA();
		a.abc();

	}

}
