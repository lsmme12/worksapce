
public class ArrayTest {

	public static void main(String[] args) {
		int[] array1=new int[3]; //크기가 3인 int형 배열생성. reference값을 array1에 저장
		int[] array2; // 배열의 이름 선언
		array2=new int[3]; //크기가 3인 int형 배열을 생성해서 reference값을 array2에 저장
		
		array1[0]=10;
		array1[1]=20;
		array1[2]=30;
		
//		System.out.println(array1[0]);
//		System.out.println(array1[1]);
//		System.out.println(array1[2]);
		
		//array1[3]=40; // error. 배열의 크기를 벗어남.
		
//		for(int i=0;i<array1.length;i++) {
//			System.out.println(array1[i]);
//		}
		
		// array1의 요소를 순서대로 하나씩 v에 넣어서 처리
//		for(int v : array1) {
//			System.out.println(v);
//		}
		
		int[][] array3=new int[][] {{100,200,300},{400,500,600}};
//		System.out.println(array3.length); // 2. 행의 갯수
//		System.out.println(array3[0].length); // 3. 열의 갯수
//		System.out.println(array3[1].length); // 3. 열의 갯수
		
		for (int[] arr : array3) {
			for(int v : arr) {
				System.out.println(v);
			}
		}
		
		// 비정방형 배열
		int [][] array4=new int[][] {{1,2},{3,4,5}};
		int [][ ]array5={{1,2},{3,4,5}};
		
		for(int i=0;i<array5.length;i++) {
			for(int j=0;j<array5[i].length;j++) {
				System.out.print(array5[i][j]+" ");
			}
			System.out.println();
		}
		
		for(int[] array:array5) { //행반복
			for(int k:array) { // 열반복
				System.out.print(k +" ");
			}
			System.out.println(); //줄바꾸기
		}
	
	}

}
