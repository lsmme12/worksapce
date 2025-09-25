
public class OperatorTest {

	public static void main(String[] args) {
		int n1=5;
		System.out.println(n1<<1); // 10. 2배
		int n2=10;
		System.out.println(n2>>1); // 5
		
		int n3=5;
		System.out.println(n3<<2); // 20. 4배
		int n4=20;
		System.out.println(n4>>2); // 5
		
		int n5=5;
		System.out.println(n5<<3); // 40. 8배
		int n6=40;
		System.out.println(n6>>3); // 5
		
		System.out.println(40 >>> 3);
		
		System.out.println(-128 >>> 2); // 음수가 양수가 됨
		
		System.out.println(-128 >> 2);// -128/4==-32
		
		System.out.println((5>2)?"크다" : "작거나같다"); //삼항연산자
	}
}
