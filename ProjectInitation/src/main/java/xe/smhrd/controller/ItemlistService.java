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


@WebServlet("/ItemlistService")
public class ItemlistService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String p_id = request.getParameter("p_id");
			
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectPartyItemList(p_id);
		
		request.setAttribute("ilist", list);
			
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);		
	}

}
