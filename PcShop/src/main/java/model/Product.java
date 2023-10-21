package model;

/**
 * 商品クラス
 * @author zapdo
 *
 */

public class Product {
	private String id;
	private String name;
	private int price;
	
	public Product(String id, String name, int price) {
		this.id = id;
		this.name = name;
		this.price = price;
	}
	
	public String getId() {
		return this.id;
	}

	public String getName() {
		return this.name;
	}

	public int getPrice() {
		return this.price;
	}
	
	public String getPriceString() {
		return String.format("%,d", price) + "円";
	}
	
	
}
