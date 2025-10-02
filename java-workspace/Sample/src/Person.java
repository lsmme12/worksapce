
public class Person {
	// field
	String name;
	String address;
	// 기본 생성자
	Person(){}
	// 생성자 오버로딩
	Person(String name, String address){
		this.name=name;
		this.address=address;
	}
	
	//method
	void showMe() {
		System.out.println(this.name);
		System.out.println(this.address);
		
	}
}
