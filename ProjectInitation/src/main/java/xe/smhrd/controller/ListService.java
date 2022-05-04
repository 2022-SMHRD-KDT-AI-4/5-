package xe.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xe.smhrd.model.BoardDAO;
import xe.smhrd.model.BoardVO;

/**
 * Servlet implementation class ListService
 */
@WebServlet("/ListService")
public class ListService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pt_id = request.getParameter("pt_id");
		BoardDAO dao = new BoardDAO();
		RequestDispatcher rd;

		if (pt_id == null) {
			List<BoardVO> list = dao.selectPTList();
			request.setAttribute("list", list);
//			System.out.println("리스트 사이즈 : "+list.size());
			rd = request.getRequestDispatcher("ABoardPT.jsp");
		}

		else {
			List<BoardVO> list = dao.selectPList(pt_id);
			BoardVO vo = dao.selectPTone(pt_id);
			request.setAttribute("vo", vo);
			request.setAttribute("list", list);
			rd = request.getRequestDispatcher("ABoardP.jsp");
		}
		rd.forward(request, response);
	}
}
