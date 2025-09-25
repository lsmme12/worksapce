
public class TypeTest {

	public static void main(String[] args) {
		int a=10;
		int b=100;
		int percentage=(a/b)*100;
		System.out.println(percentage); // 정수 나누기 정수는 정수이므로 0
		
		percentage=(a*100)/b;
		System.out.println(percentage);
		
		int c=10;
		//short s=c; //int to short 불가. int가 범위가 더 크기 때문.
		short s= (short)c; //강제 형변환. (short)cast 연산자 사용
		System.out.println(s);
	}
	
}
