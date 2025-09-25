
public class StringTest {

	public static void main(String[] args) {
		String str1=new String("안녕");
		String str2=str1; // str1에 저장된 래퍼런스 값을 str2에 복사
		
		System.out.println(str1==str2); // referece 값이 같으면 true
		System.out.println(str1.equals(str2)); // referece 가리키는 값이 같으면 true
		
		str1="안녕하세요?";
		System.out.println(str1);
		System.out.println(str2);
		
		System.out.println(str1==str2);
		System.out.println(str1.equals(str2));
		
		String str3=new String("안녕");
		String str4=new String("안녕");
		System.out.println(str3==str4); // reference 값이 같으면 true
		System.out.println(str3.equals(str4));  // reference 가리키는 값이 같으면 true
		
		String str5="안녕";
		String str6="안녕";
		System.out.println(str5==str6); // reference 값이 같으면 true
		System.out.println(str5.equals(str6));  // reference 가리키는 값이 같으면 true
		
		// 자바에서는 무자열의 값이 같은지 비교할 때 equals() 를 사용. == 는 레퍼런스 값이 같은지 비교. 
		
		// 파일확장자구하기
		String fileName="2025.09.25.list.txt";
		String extension=fileName.substring(fileName.lastIndexOf(".")+1); // 마지막'.'의 위치다음부터 끝까지 구함.
		System.out.println(extension);
		
		String[] result=fileName.split("\\."); // "."을 기준으로 분리해서 배열에 저장.
		extension=result[result.length-1];
		System.out.println(extension);
		
		String firstName="길동";
		String lastName="홍";
		String fullName=lastName.concat(firstName);
		System.out.println(fullName);
		System.out.println(lastName); //원본 변경없다.
		
		String spaceString="   자바      ";
		System.out.println("Java"+spaceString.trim()+"Java");
	}

}


