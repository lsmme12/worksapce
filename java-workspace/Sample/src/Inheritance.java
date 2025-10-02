// 313~314P 코드
class Human{
	String name;
	int age;
	void  eat(){}
	void sleep(){}
}
class Student extends Human{
	int studentID;
	void goToschool() {}
}
class Worker extends Human{
	int workerID;
	void goTowork() {}
}

public class Inheritance {

	public static void main(String[] args) {
		Human h = new Human();
		h.name = "김현지";
		h.age = 11;
		h.eat();
		h.sleep();
		
		Student s = new Student();
		s.name = "김민성";
		s.age = 16;
		s.studentID =128; // 추가로 정의 한 멤버
		s.eat();
		s.sleep();
		s.goToschool();
		
		Worker w = new Worker();
		w.name = "봉윤정";
		w.age = 45;
		w.workerID =128; //추가로 정의한 멤버]
		w.eat();
		w.sleep();
		w.goTowork();
	}

}
