
public class FlexibleSizeArrayArgument {

	public static void main(String[] args) {
		method1(1,2);
		method1(1,2,3);
		// method(); //에러. parameter값이 있어야함.
		
		method2("안녕","방가");
		method2("떙큐","베리","감사");
		
	}
	// 가변길이 parameter 를 가진 메서드
	public static void method1(int...values) {
		System.out.println("입력매개변수 길이 :  " +values.length);
				for(int i=0;i<values.length;i++) {
					System.out.print(values[i]+" ");
				}
				System.out.println();
	}
	public static void method2(String...values) {
		System.out.println("입력매개변수 길이 :  " +values.length);
				for(int i=0;i<values.length;i++) {
					System.out.print(values[i]+" ");
				}
				System.out.println();
	}

}
