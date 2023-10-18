package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InputServlet
 */
@WebServlet("/input-servlet")
public class InputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの取得
		String nameStr = "【名前】" + request.getParameter("name");
		String passwordStr = "【パスワード】" + request.getParameter("password");
		String genderStr = "【性別】" + request.getParameter("gender");
		String[] foodArray = request.getParameterValues("food");
		String foodStr = "【好物】";
		if (foodArray != null) {
			for (String food : foodArray) {
				foodStr += (food + "　");
			}
		} else {
			foodStr += "(未選択)";
		}
		String hobbyStr = "【趣味】" + request.getParameter("hobby");
		
		// リストに格納
		List<String> infoList = new ArrayList<String>();
		infoList.add(nameStr);
		infoList.add(passwordStr);
		infoList.add(genderStr);
		infoList.add(foodStr);
		infoList.add(hobbyStr);
		
		// リクエストスコープへのデータ格納
		request.setAttribute("infoList", infoList);
		
		// 転送オブジェクトを取得
		RequestDispatcher dispatcher = request.getRequestDispatcher("output.jsp");
		
		// 転送
		dispatcher.forward(request, response);
		
	}
}
