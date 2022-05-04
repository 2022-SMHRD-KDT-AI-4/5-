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
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectBoard();
		request.setAttribute("list", list);
		System.out.println("����Ʈ ������ : "+list.size());
		RequestDispatcher rd = request.getRequestDispatcher("ABoardMain.jsp");
		rd.forward(request, response);
	}

}
