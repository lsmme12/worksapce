import java.util.Stack;

public class StackTest {

	public static void main(String[] args) {
		Stack<Integer> stack = new Stack<>();
		
		// 삽입. push
		stack.push(2);
		stack.push(5);
		stack.push(3);
		stack.push(7);
		
		// 삭제. pop
		System.out.println(stack.pop()); 
		System.out.println("size : "+stack.size()); // 삭제된게 있으므로 3
		
		// 검색. search
		System.out.println(stack.search(5)); // 2.top에서부터 몇번쨰에 있는지
		System.out.println(stack.search(2)); // 3.top에서부터 몇번쨰에 있는지
		System.out.println(stack.search(3)); // 1.top에서부터 몇번쨰에 있는지
		System.out.println(stack.search(7)); // -1. 없으면 -1
		System.out.println("size : "+stack.size()); // 삭제된게 없으므로 3
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
