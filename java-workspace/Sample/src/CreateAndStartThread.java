
class MyThread extends Thread {
	@Override
	public void run() {
		for (int i=0;i<10;i++) {
			System.out.println("Mythread : ......... ");			
		}
	}	
}
class MyThread2 extends Thread {
	@Override
	public void run() {
		for (int i=0;i<10;i++) {
			System.out.println("MyThread2 : @@@@@@@@@");			
		}
	}	
}
class MyThread3 implements Runnable {
	@Override
	public void run() {
		for (int i=0;i<10;i++) {
			System.out.println("Mythread3 : ######### ");			
		}
	}	
}

public class CreateAndStartThread {
	public static void main(String[] args) {
		MyThread t1=new MyThread();
		t1.start(); // JVM에 t1쓰레드관리를 시작하도록 등록. run()메서드가 호출됨. 즉시실행되지 않음.
		MyThread2 t2=new MyThread2();
		t2.start(); // JVM에 t2쓰레드관리를 시작하도록 등록. run()메서드가 호출됨. 즉시실행되지 않음.

		MyThread3 r1=new MyThread3();
		Thread t3=new Thread(r1); // Runnable인터페이스 구현객체를 Thread객체 생성시 매개변수로 전달
		t3.setPriority(10); //우선순위 설정 1~10까지. 기본값 5
		t3.start(); // JVM에 t3쓰레드관리를 시작하도록 등록. run()메서드가 호출됨. 즉시실행되지 않음.
		
		System.out.println("main thread 종료");
	}

}
