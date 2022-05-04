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

import xe.smhrd.model.BoardDAO;
import xe.smhrd.model.BoardVO;


@WebServlet("/ViewService")
public class ViewService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. �Ķ���� ����
		String pt_id = request.getParameter("pt_id");
		int num = Integer.parseInt(request.getParameter("num"));
			
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		vo.setPt_id(pt_id);
		BoardDAO dao = new BoardDAO();
		BoardVO bvo = dao.selectViewOne(vo);
//		List<BoardVO> list = dao.selectPartyItemList(p_id);
//		System.out.println("����Ʈ ������ : "+list.size());
		System.out.println("vo:"+bvo);
		
		
		//3. ��ü���ε�
//		request.setAttribute("vlist", list);
		request.setAttribute("bvo", bvo);
		request.setAttribute("num", num);
        
		
		//4. �������̵�
        RequestDispatcher rd = request.getRequestDispatcher("ABoardView.jsp");
        rd.forward(request, response);
		
	}

}
