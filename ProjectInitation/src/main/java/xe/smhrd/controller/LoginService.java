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
		
//		���ڵ�
		request.setCharacterEncoding("UTF-8");
		
//		�Ķ���� ����
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		
		MemberVO vo = new MemberVO(m_id, m_pw, null);

		System.out.println(m_id);
		System.out.println(m_pw);
		System.out.println(vo);
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = dao.login(vo);
		
		HttpSession session = request.getSession();
		
//		�α��� ���� ����
		if(mvo == null) {
			System.out.println("�α��� ����");
			session.setAttribute("errMsg", "�α��� ������ �ùٸ��� �ʽ��ϴ�.");
			response.sendRedirect("Login.jsp");
		}else {
			System.out.println("�α��� ����");
			
			session.setAttribute("vo", mvo);
//		4. main.jsp�� �̵�
			response.sendRedirect("Main.jsp");
		}
			
		
	}

}
