//공유객체
class MyData{
	int data;
	
	public synchronized void plusData() {
		int mydata = data; //데이터가져오기
		try {
			Thread.sleep(2000); //2초지연
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		mydata += 10; //데이터 증가
}
}
class PlusThread extends Thread{
	MyData mydata;
	
	public PlusThread(MyData mydata) {
		this.mydata = mydata;
	}
	
	@Override
	public void run() {
		mydata.plusData();
		System.out.println("실행결과: " + mydata.data);
	}
}

public class SynchronizedMethod {

	public static void main(String[] args) {
		MyData mydata = new MyData();
		
		// PlusTherad 1
		Thread plusThread1 = new PlusThread(mydata);
		plusThread1.setName("PlusThread1");
		plusThread1.start();
		
		try {Thread.sleep(1000);} catch (InterruptedException e) {e.printStackTrace();} //1초 기다림
		
		// PlusTherad 2
		Thread plusThread2 = new PlusThread(mydata);
		plusThread2.setName("PlusThread2");
		plusThread2.start();
	}
}
