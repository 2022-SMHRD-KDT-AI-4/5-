package xe.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xe.smhrd.model.MemberDAO;
import xe.smhrd.model.MemberVO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		인코딩
		request.setCharacterEncoding("UTF-8");
		
//		파라미터 수집
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		
		MemberVO vo = new MemberVO(m_id, m_pw, null);

		System.out.println(m_id);
		System.out.println(m_pw);
		System.out.println(vo);
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = dao.login(vo);
		
		HttpSession session = request.getSession();
		
//		로그인 성공 여부
		if(mvo == null) {
			System.out.println("로그인 실패");
			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
			response.sendRedirect("Login.jsp");
		}else {
			System.out.println("로그인 성공");
			
			session.setAttribute("vo", mvo);
//		4. main.jsp로 이동
			response.sendRedirect("Main.jsp");
		}
			
		
	}

}
