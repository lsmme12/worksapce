//09.29 Super 문 예제
class Shape{	
	String name="도형";
	//생성자오버로딩
	Shape(){
		System.out.println("Shape() 생성자");
	}
	Shape(String name){
		this.name=name;
		System.out.println("Shape(String name) 생성자");
	}	
	void draw() {
		System.out.println("Shape");
	}
}
class Circle extends Shape{
	Circle(){
		super("원"); // 부모생성자 호출. 반드시 첫줄에 와야함.
		System.out.println("Circle()생성자");
		super.draw(); // 보모의 draw()메서드 호출
		draw(); // 자신의 draw() 메서드 호출
	}
	void draw() {
		System.out.println("Circle");
	}
}

public class SuperTest {

	public static void main(String[] args) {
		Circle c=new Circle();
	}

}