package model;

import java.util.List;

/**
 * 店舗情報を表すクラス
 * @author zapdo
 *
 */

public class Store {
	private String name;
	private List<Product> product_list;
	
	public Store(String name, List<Product> product_list) {
		this.name = name;
		this.product_list = product_list;
	}
	
	public String getName() {
		return this.name;
	}
	
	public List<Product> getProductList(){
		return this.product_list;
	}
	
	public void add(Product prod) {
		product_list.add(prod);
	}
	
	public void remove(int index) {
		product_list.remove(index);
	}
	
	public void clear() {
		product_list.clear();
	}
}
