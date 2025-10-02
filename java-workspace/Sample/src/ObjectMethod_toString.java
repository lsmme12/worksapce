// 360P 코드
class Vehicle {
	String name = "Vehicle";

	// object 클래스의 toString() 메서드를 오버라이딩. 원래는 "패키지명.클래스명@16진수해시코드" 형태로 리턴.
	@Override
	public String toString() {
		return "Vehicle [name=" + name + "]";
	}
	
	// 362P 코드 name 필드가 같으면 같은 객체로 간주 
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Vehicle) {
			if(this.name==((Vehicle)obj).name) {
				return true;
			}
		}
		return false;		
	}	

}


public class ObjectMethod_toString {
	public static void main(String[] args) {
		Vehicle v1 = new Vehicle();
		Vehicle v2 = new Vehicle();
		
		System.out.println(v1); // toString() 자동호출
		System.out.println(v1.equals(v2)); // true
		v1.name="bus";
		v2.name="car";
		System.out.println(v1.equals(v2)); // false
	}
}