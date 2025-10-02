import java.util.LinkedList;
import java.util.Queue;

public class QueueTest {

	public static void main(String[] args) {
		// Queue 는 interface 이므로 객체생성 불가. 자식을 통해 객체 생성
		Queue<Integer> queue = new LinkedList<>(); // Queue 인터페이스는 LinkedList로 구현 upcasting
		
		// 삽입 add
		queue.add(3);
		queue.add(4);
		queue.add(5);
		queue.add(9);
		
		// 꺼내기 remove
		System.out.println(queue.remove()); // 3
		System.out.println("size : "+queue.size());  //3
		System.out.println(queue.remove()); // 4
		System.out.println("size : "+queue.size()); // 2
		System.out.println(queue.remove()); // 5
		System.out.println("size : "+queue.size()); // 1
		System.out.println(queue.remove()); // 9
		System.out.println("size : "+queue.size()); // 0
//		System.out.println(queue.remove()); // 예외발생. NoSuchElementException
		System.out.println(queue.poll()); // null
		
		Queue<Integer> queue2 = new LinkedList<>();
		
		//삽입 offer
		queue2.offer(3);
		queue2.offer(4);
		queue2.offer(5);
		
		//꺼내기 poll
		System.out.println(queue2.poll()); // 3
		System.out.println("size : "+queue2.size());  //2
		System.out.println(queue2.poll()); // 4
		System.out.println("size : "+queue2.size()); // 1
		System.out.println(queue2.poll()); // 5
		System.out.println("size : "+queue2.size()); // 0
		System.out.println(queue2.poll()); // null. 예외 발생 안함. 이 방법이 좀더 안전.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
