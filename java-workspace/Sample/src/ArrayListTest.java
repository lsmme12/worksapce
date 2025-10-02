// 627p 코드


import java.util.ArrayList;
import java.util.List;
public class ArrayListTest {

	public static void main(String[] args) {
		//upcasting
		List<String> list = new ArrayList<String>();
		//데이터 저장
		list.add("가");
		list.add("나");
		list.add("다");
		list.add("라");
		list.add("마");
		list.add("바");
		list.add("사");
		System.out.println("총 객체수 : " + list.size());
		//데이터 삭제
		list.remove(2); //인덱스로 삭제
		list.remove("다"); //객체로 삭제
		System.out.println("총 객체수 : " + list.size());
		//데이터 읽기
		for(int i=0;i<list.size();i++) {
			String data = list.get(i);
			System.out.println(i+" : "+data);
		}
	}
}
