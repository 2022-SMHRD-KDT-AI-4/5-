package xe.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

@WebServlet("/CartDelete")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String p_id = request.getParameter("p_id");
		String pt_id = request.getParameter("pt_id");
		int num = Integer.parseInt(request.getParameter("num"));
		ArrayList<String> cartList = (ArrayList)session.getAttribute("cartList");
		if(cartList==null) {
			cartList = new ArrayList<String>();
		}
		
//		중복값을 삭제한다
		for(int i = 0; i<cartList.size(); i++) {
			if(p_id.equals(cartList.get(i))) {
				cartList.remove(i);
				break;
			}
		}
		
		session.setAttribute("cartList", cartList);
//		
		for(int i=0;i<cartList.size(); i++) {
		    System.out.println("cartList : "+cartList.get(i));
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ViewService?pt_id="+pt_id+"&num="+num);
		rd.forward(request, response);
	}

}
