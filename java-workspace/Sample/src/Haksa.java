// person 과 같이 하는 것. 연습.
public class Haksa {

	public static void main(String[] args) {
		Person p1=new Person("홍길동","서울");
		p1.showMe();
		
		Person p2=new Person();
		p2.name="이순신";
		p2.address="제주도";
		p2.showMe();

	}

}
