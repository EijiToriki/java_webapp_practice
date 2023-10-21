package model;

import java.util.List;

/**
 * カートを表すクラス
 * @author zapdo
 *
 */

public class Cart {
	private String userId;
	private List<Product> cart_list;
	
	public Cart(String userId, List<Product> product_list) {
		this.userId = userId;
		this.cart_list = product_list;
	}
	
	public String getUserId() {
		return this.userId;
	}
	
	public List<Product> getProductList(){
		return this.cart_list;
	}
	
	public void add(Product prod) {
		cart_list.add(prod);
	}
	
	public void remove(int index) {
		cart_list.remove(index);
	}
	
	public void clear() {
		cart_list.clear();
	}
	
	public int getTotalPrice() {
		int total = 0;
		for(Product prod: cart_list) {
			total += prod.getPrice();
		}
		return total;
	}
	
	public String getStringTotalPrice() {
		return String.format("%,d", getTotalPrice()) + "円";
	}
}
