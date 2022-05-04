package xe.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xe.smhrd.model.MemberDAO;
import xe.smhrd.model.MemberVO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		인코딩
		request.setCharacterEncoding("UTF-8");
		
//		파라미터 수집
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("n_pw1");
		String m_name = request.getParameter("m_name");
		
		MemberVO mvo = new MemberVO(m_id, m_pw, m_name);
		MemberDAO dao = new MemberDAO();
		
		System.out.println(m_id);
		System.out.println(m_pw);
		System.out.println(m_name);
		
		System.out.println(mvo);
		int cnt = dao.join(mvo);
		
		if(cnt > 0) {
			System.out.println("회원가입이 완료되었습니다.");
			response.sendRedirect("Main.jsp");
		}else {
			System.out.println("다시 회원가입하세요.");
			response.sendRedirect("Join.jsp");
		}
		
	}

}
