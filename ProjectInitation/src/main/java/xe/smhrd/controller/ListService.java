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
import com.google.gson.JsonObject;

import xe.smhrd.model.BoardDAO;
import xe.smhrd.model.BoardVO;
import xe.smhrd.model.MemberVO;

/**
 * Servlet implementation class ListService
 */
@WebServlet("/ListService")
public class ListService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String pt_id = request.getParameter("pt_id");
		BoardDAO dao = new BoardDAO();
		RequestDispatcher rd;
		

		
		List<BoardVO> list = new ArrayList<BoardVO>();

		if (pt_id == null) {
			list = dao.selectPTList();
			for(int i = 0; i<list.size(); i++) {
				String p_img =  dao.selectPimgOne(list.get(i).getPt_id()).getP_img();
				list.get(i).setP_img(p_img);
			}
			request.setAttribute("list", list);
		
//			System.out.println("리스트 사이즈 : "+list.size());
//			rd = request.getRequestDispatcher("BoardPT.jsp");
			
		}

		else {
			list = dao.selectPList(pt_id);
			BoardVO vo = dao.selectPTone(pt_id);
//			request.setAttribute("pvo", vo);
//			request.setAttribute("plist", list);			
			list.add(0, vo);
//			rd = request.getRequestDispatcher("BoardP.jsp");
		}
//		rd.forward(request, response);

//		System.out.println(list.get(0));
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);

	}
}

