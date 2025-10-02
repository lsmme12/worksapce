// 335P~336P 코드
class Animal {
	void cry() {
		System.out.println("짖다(울다)...");
	}
}
class Bird extends Animal{
	// Animal의 cry() 메서드를 재정의(오버라이딩)
	void cry() {
		System.out.println("짹짹...");
	}
}
class Cat extends Animal{
	// Animal의 cry() 메서드를 재정의(오버라이딩)
	void cry() {
		System.out.println("야옹...");
	}
}
class Dog extends Animal{
	// Animal의 cry() 메서드를 재정의(오버라이딩)
	void cry() {
		System.out.println("멍멍...");
	}
}

public class MethodOverriding_2 {

	public static void main(String[] args) {
		Animal aa=new Animal();
		Bird bb=new Bird();
		Cat cc=new Cat();
		Dog dd=new Dog();
		
		aa.cry();
		bb.cry();
		cc.cry();
		dd.cry();
		
		Animal a1=new Bird(); // Up casting
		Animal a2=new Cat(); // Up casting
		Animal a3=new Dog(); // Up casting
		
		a1.cry(); // 오버라이딩한 메서드 호출
		a2.cry(); // 오버라이딩한 메서드 호출
		a3.cry(); // 오버라이딩한 메서드 호출
		
		//객체의 배열 336P
		Animal[] animals = new Animal[] {new Bird(), new Cat(), new Dog()}; 
		for (Animal a:animals) {
			a.cry(); //오버라이딩한 메서드 호출
		}
		
		Animal[] animals2=new Animal[5];
		animals2[0]=new Bird();
		animals2[1]=new Cat();
		for(Animal a:animals) {
			a.cry(); // 오버라이딩한 메서드 호출
		}
		animals2[2]=new Dog();
		animals2[3]=new Dog();
		animals2[4]=new Cat();
		for(Animal a:animals) {
			a.cry(); // 오버라이딩한 메서드 호출
		}
	}
}
