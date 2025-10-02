import java.util.HashSet;
import java.util.Set;

public class SetTest {

	public static void main(String[] args) {
		Set<String> set = new HashSet<>();
		set.add("가");
		set.add("나");
		set.add("다");
		set.add("라");
		set.add("마");
		set.add("바");
		set.add("사");
		set.add("아");
		set.add("가"); // 중복안됨.	
		set.add("나"); // 중복안됨.
		
		
		// 출력시 입력 순서대로 출력되지 않음
		for(String s : set) {
			System.out.println(s);
		}
	}
}
