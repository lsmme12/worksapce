class A2{
	int m1,m2,m3,m4;
	A2(){
		this.m1=1;
		this.m2=2;
		this.m3=3;
		this.m4=4;
	}
	A2(int a){
		this(); //A()호출
		this.m1=a;
	}
	A2(int a, int b){
		this(a); // A(int a)호출
		this.m2=b;
	}
}




public class ConstructorOverloading {

	public static void main(String[] args) {
		A2 a1=new A2();
		A2 a2=new A2(10);
		A2 a3=new A2(100,200);
		System.out.println(a1.m1);
		System.out.println(a2.m1);
		System.out.println(a3.m1);

	}

}
