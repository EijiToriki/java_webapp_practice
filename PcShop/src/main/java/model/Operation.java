package model;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

/**
 * 店内オペレーション用クラス
 * @author zapdo
 *
 */

public class Operation {
	public boolean loginProc(String userId, String password, HttpSession session) {
		boolean result = authenticate(userId, password);
		
		if(result) {
			Store store = makeStore();
			session.setAttribute("store", store);
			
			Cart cart = new Cart(userId, new ArrayList<Product>());
			session.setAttribute("cart", cart);
		}
		
		return result;
	}
	
	private boolean authenticate(String userId, String password) {
		if(password.equals("pass")) {
			return true;
		}else {
			return false;
		}
	}
	
	private Store makeStore(){
		Store store = new Store("鳥木PC販売", new ArrayList<Product>());
		
		store.add(new Product("A110", "無線マウス", 2000));
		store.add(new Product("A120", "薄型キーボード", 3600));
		store.add(new Product("A130", "Webカメラ", 3900));
		store.add(new Product("A140", "トラックボールマウス", 2900));
		store.add(new Product("A150", "USB接続HDD(外付け)", 9800));
		store.add(new Product("A160", "2m電源タップ５口", 1900));
		store.add(new Product("A170", "USB接続マイク", 3500));
		store.add(new Product("A180", "小型ディスプレイ", 11000));
		store.add(new Product("A190", "LED証明", 4200));
		store.add(new Product("A200", "骨伝導イヤホン", 7800));
		
		return store;
	}
	
	
	public void logoutProc(HttpSession session) {
		session.invalidate();
	}
	
	public void addProd(int idx, HttpSession session) {
		Store store = (Store) session.getAttribute("store");
		Cart cart = (Cart) session.getAttribute("cart");
		
		if((store != null) || (cart != null)) {
			cart.add(store.getProductList().get(idx));
			
			session.setAttribute("cart", cart);
		}
	}

	public void removeProd(int idx, HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		
		if(cart != null) {
			cart.remove(idx);
			
			session.setAttribute("cart", cart);
		}
	}
	
	public void pay(HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");

		
		if(cart != null) {
			session.setAttribute("pay", cart);
			
			Cart newCart = new Cart(cart.getUserId(), new ArrayList<Product>());
			session.setAttribute("cart", newCart);
		}
		
	}

}


