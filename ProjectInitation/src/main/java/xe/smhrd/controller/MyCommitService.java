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

@WebServlet("/MyCommitService")
public class MyCommitService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int v_id = Integer.parseInt(request.getParameter("v_id"));
		String[] seli_id = request.getParameterValues("seli_id");
		InviteDAO dao = new InviteDAO();
		InviteVO vo = dao.selectMyOne(v_id);
		vo.setV_id(v_id);
		dao.clearAll(v_id);		//입력전 초기화를 시킴
		if(seli_id!=null) {
			for(int i = 0; i < seli_id.length; i++) {
				System.out.println(seli_id[i]);
				}
			for(int i = 0; i < seli_id.length; i++) {
				vo.setI_id(seli_id[i]);		// vo에 id를 입력
				System.out.println(vo);
				dao.resultOne(vo);			// id에 +1을 시킴
			}
		}
		List<InviteVO> list = dao.selectMyItem(v_id);
		session.setAttribute("myvo", vo);
		session.setAttribute("myitemlist", list);
		session.setAttribute("popup", true);
		RequestDispatcher rd = request.getRequestDispatcher("MyPartyView.jsp?popup=true");
		rd.forward(request, response);
	}

}
