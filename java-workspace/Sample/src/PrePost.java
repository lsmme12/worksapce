
public class PrePost {

	public static void main(String[] args) {
		int a=3;
		int b=++a; //a를 먼저 증가시킨 후 a를 사용
		System.out.println(a);
		System.out.println(b);

		int c=3;
		int d=c++; //c를 먼저 사용한 후 증가
		System.out.println(c);
		System.out.println(d);
	
		int e=3;
		System.out.println(++e); //e를 먼저 증가시킨 후 e를 사용
		int f=3;
		System.out.println(f++); //f를 먼저 사용한 후 f를 증가
		
	}
}
