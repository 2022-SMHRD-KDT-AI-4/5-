package xe.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import xe.smhrd.model.BoardDAO;
import xe.smhrd.model.BoardVO;

@WebServlet("/CartClearService")
public class CartClearService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		BoardDAO dao = new BoardDAO();
		List<BoardVO> cartList = cartList = new ArrayList<BoardVO>();
				
		session.setAttribute("cartList", cartList);
//		RequestDispatcher rd = request.getRequestDispatcher("Cartlist.jsp");
//		rd.forward(request, response);
	}

}
