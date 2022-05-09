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

@WebServlet("/CartService")
public class CartService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String p_id = request.getParameter("p_id");
		String pt_id = request.getParameter("pt_id");
		String action = request.getParameter("action");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = new BoardDAO();
		
//		카트목록 소환
//		ArrayList<String> cartList2 = (ArrayList)session.getAttribute("cartList2");
//		if(cartList==null) {
//			cartList = new ArrayList<String>();
//		}
		
		List<BoardVO> cartList = (List<BoardVO>)session.getAttribute("cartList");
		if(cartList==null) {
			cartList = new ArrayList<BoardVO>();
		}
		
		
////		버전1
//		if(action.equals("delete")) {
////			중복값을 삭제한다
//			for(int i = 0; i<cartList.size(); i++) {
//				if(p_id.equals(cartList.get(i))) {
//					cartList.remove(i);
//					break;
//				}
//			}
//		}
//		else {
////			만약 중복되면 안넣게 하고 싶다
//			boolean flag = true;
//			for(int i = 0; i<cartList.size(); i++) {
////				System.out.printf("%s : %s \n",p_id, cartList.get(i));
//				if(p_id.equals(cartList.get(i))) {
////					System.out.println("중복확인");
//					flag = false;
//					break;
//				}
//			}
//			if(flag) {
//				cartList.add(p_id);
//			}
//			
//		}
		
		
//		버전2
		if(action.equals("delete")) {
//			중복값을 삭제한다
			for(int i = 0; i<cartList.size(); i++) {
				if(p_id.equals(cartList.get(i).getP_id())) {
					cartList.remove(i);
					break;
				}
			}
		}
		else {
//			만약 중복되면 안넣게 하고 싶다
			boolean flag = true;
			for(int i = 0; i<cartList.size(); i++) {
				if(p_id.equals(cartList.get(i).getP_id())) {
					flag = false;
					break;
				}
			}
			if(flag) {
				cartList.add(dao.selectPone(p_id));
			}
			
		}
		
//		테스트용 콘솔
		System.out.println("------테스트1-------");
		for(int i = 0; i < cartList.size(); i++) {
			System.out.println(cartList.get(i).getP_id());
			System.out.println(cartList.get(i).getP_name());
			System.out.println(cartList.get(i).getP_img());
		}
		
		session.setAttribute("cartList", cartList);
		RequestDispatcher rd = request.getRequestDispatcher("Cartlist.jsp");
		rd.forward(request, response);
	}

}
