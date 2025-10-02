
//공유객체
class DataBox{
	// 데이터가 비어있는지 여부 한단하는 flag.
	boolean isEmpty=true;
	
	int data;
	synchronized void inputData(int data) {
		
		if(!isEmpty) { //데이터가 있으면
			try {
				wait(); //쓰레드를 일시정지 상태로 만듦. 다른 쓰레드가 notify() 할때까지 기다림.
				System.out.println("walt()로 일시정지 상태가 된 쓰레드 : "+ Thread.currentThread().getName());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		this.data = data; //데이터저장
		this.isEmpty = false; //저장후 변경. 데이터가 차있음을 표시.
		System.out.println("입력데이터 : "+data);
		notify(); //일시정지 상태에 있는 쓰레드 하나를 실행대기상태로 만듦.
	}
	
	synchronized void outputData() {
		
		if(isEmpty) { //데이터가 없으면
			try {
				wait(); //쓰레드를 일시정지 상태로 만듦. 다른 쓰레드가 notify() 할때까지 기다림.
				System.out.println("walt()로 일시정지 상태가 된 쓰레드 : "+ Thread.currentThread().getName());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		this.isEmpty = true; //데이터룰 읽은 후 변경. 데이터가 비어있음을 표시
		System.out.println("출력데이터 : "+data);
		notify(); //일시정지 상태에 있는 쓰레드 하나를 실행대기상태로 만듦.
	}
}

public class WaitingWaitNotify {
	public static void main(String[] args) {
		
		//공유객체 생성
		DataBox dataBox = new DataBox();
		
		//Anonymous Class
		Thread t1=new Thread("Thread1") {
			
			@Override
			public void run() {
				for(int i=1;i<9;i++) {
					dataBox.inputData(i);
				}
			}
		};
		
		//Anonymous Class
		Thread t2=new Thread("Thread2") {
			
			@Override
			public void run() {
				for(int i=1;i<9;i++) {
					dataBox.outputData();
				}
			}
		};
		
		Thread.State state=t1 .getState();
		System.out.println("t1 의 상태 : "+state);
		System.out.println("t2 의 상태 : "+t2.getState());
		
		t1.start();
		t2.start();	
		
		System.out.println("t1 의 상태 : "+t1.getState());
		System.out.println("t2 의 상태 : "+t2.getState());
		
	}
}
