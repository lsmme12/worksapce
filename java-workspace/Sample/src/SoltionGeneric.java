class Apple{
	String name;
	int price;
	
	Apple(String name, int price){
		this.name = name;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Apple [name=" + name + ", price=" + price + "]";
	}
}
class Pencil{
	String name;
	int price;
	
	Pencil(String name, int price){
		this.name = name;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Pencil [name=" + name + ", price=" + price + "]";
	}
}
// Generic Class 
class Goods<T>{
	private T t;
	public T get() {
		return t;
	}
	public void set(T t) {
		this.t = t;
	}
}

public class SoltionGeneric {
	public static void main(String[] args) {
		// Generic Class 의 인스턴스 생성시 타입을 결정
		Goods<Apple> goods1 = new Goods<Apple>();
		goods1.set(new Apple("RedApple", 1000));
		System.out.println(goods1.get());
		
		// Generic Class 의 인스턴스 생성시 타입을 결정
		Goods<Pencil> goods2 = new Goods<Pencil>();
		goods2.set(new Pencil("Monami", 500));
		System.out.println(goods2.get());
	}
}


