package xe.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xe.smhrd.model.InviteDAO;
import xe.smhrd.model.InviteVO;
@WebServlet("/MyVoteService")
public class MyVoteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int v_id = Integer.parseInt(request.getParameter("v_id"));
		InviteDAO dao = new InviteDAO();
		InviteVO vo = dao.selectMyOne(v_id);
		List<InviteVO> list = dao.selectMyItem(v_id);
		
//		System.out.println("------Å×½ºÆ®1-------");
//		System.out.println(vo);
//		for(int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i));
//		}
		session.setAttribute("myvo", vo);
		session.setAttribute("myitemlist", list);
		RequestDispatcher rd = request.getRequestDispatcher("MyPartyVote.jsp");
		rd.forward(request, response);
	}

}
