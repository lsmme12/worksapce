//전가
class BClass{
	void bcd() throws InterruptedException{
		Thread.sleep(5000);
		System.out.println("5초지연 후 출력");
	}
	void abc() {
		try {
			bcd();
		}catch(InterruptedException e) {
			e.printStackTrace(); //디버깅용 출력
		}
	}
}
public class ThrowException {
	public static void main(String[] args) {
		BClass b = new BClass();
		b.abc();
	}
}
