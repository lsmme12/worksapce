import java.util.Arrays;

public class EffectOfReferenceDataArgument {
	public static void modifyData(int[] a) {
		// a는 배열을 가리키는 레퍼런스 변수. a는 main함수에서 만든 배열을 가리킴.
		// 원본이 변경됨.
		
		a[0]=4;
		a[1]=5;
		a[2]=6;
	}
	
	public static void printArray(int[] a) {
		System.out.println(Arrays.toString(a));
	}
	public static void modifyData(int a) {
		a=4;
	}
	public static void print(int a) {
		System.out.println(a);
	}

	public static void main(String[] args) {
		int[] array=new int[] {1,2,3,};
		// call by reference
		modifyData(array); // 배열의 이름은 reference. reference값이 매개변수로 전달됨.
		// call by reference
		printArray(array);
		
		int a=1;
		// call by value
		modifyData(a);
		// call by value
		print(a);
		
		
		

	}

}
