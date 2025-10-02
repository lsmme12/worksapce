// 686p 코드

import java.util.HashMap;
import java.util.Map;

public class HashMapMethod {

	public static void main(String[] args) {
		// Map : Key, Value 쌍으로 저장, Key는 중복 불가, Value는 중복 가능
		// Key를  사용하므로 더직관적임.
		Map<String, String> hMap1 = new HashMap<>();
		
		// 추가
		hMap1.put("black", "000000");
		hMap1.put("white", "ffffff");
		hMap1.put("red", "ff0000");
		// 읽기
		System.out.println(hMap1.get("black"));
		System.out.println(hMap1.get("white"));
		System.out.println(hMap1.get("red"));
		
		// Key Set 을 구하기
		for(String key : hMap1.keySet()) {
			System.out.println(key + " : " + hMap1.get(key));
		}
		
		// 수정
		hMap1.put("red", "ff1111");
		System.out.println("red : " + hMap1.get("red"));
		hMap1.replace("red", "ff0000");
		System.out.println("red : " + hMap1.get("red"));
		
		// 삭제
		hMap1.remove("red");
		System.out.println("red : " + hMap1.get("red"));
		
		
		
		
		
		
		
	}
}
