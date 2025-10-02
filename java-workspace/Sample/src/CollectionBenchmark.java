import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class CollectionBenchmark {

	public static void main(String[] args) {
		// ArrayList vs LinkedList
		List<Integer> arrayList = new ArrayList<>();
		List<Integer> linkedList = new LinkedList<>();
		int startTime=0;
		int endTime=0;
		
		// ArrayList보다 LinkedList가 데이터 추가/삭제 속도가 빠르다.
		
		// ArrayList 데이터 저장 시간 측정
		startTime = (int)System.nanoTime();
		for(int i=0;i<100000;i++) {
			arrayList.add(0,i); //0번 인덱스에 데이터 추가
		}
		endTime = (int)System.nanoTime();
		System.out.println("ArrayList 데이터 저장 시간 : "+(endTime-startTime)+" ns");
		
		// LinkedList 데이터 저장 시간 측정
		startTime = (int)System.nanoTime();
		for(int i=0;i<100000;i++) {
			linkedList.add(0,i); //0번 인덱스에 데이터 추가
		}
		endTime = (int)System.nanoTime();
		System.out.println("LinkedList 데이터 저장 시간 : "+(endTime-startTime)+" ns");

		
		// ArrayList가 LinkedList보다 데이터 조회 속도가 빠르다.
		
		// ArrayList 데이터 조회 시간 측정
		startTime = (int)System.nanoTime();
		for(int i=0;i<10000;i++) {
			arrayList.get(i); //조회
		}
		endTime = (int)System.nanoTime();
		System.out.println("ArrayList 데이터 조회 시간 : "+(endTime-startTime)+" ns");
		
		// LinkedList 데이터 조회 시간 측정
		startTime = (int)System.nanoTime();
		for(int i=0;i<10000;i++) {
			linkedList.get(i); //조회
		}
		endTime = (int)System.nanoTime();
		System.out.println("LinkedList 데이터 조회 시간 : "+(endTime-startTime)+" ns");
		
	}

}
