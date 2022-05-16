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


@WebServlet("/ViewService")
public class ViewService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pt_id = request.getParameter("pt_id");
		int num = Integer.parseInt(request.getParameter("num"));
		
//		System.out.println(pt_id + num);
			
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		vo.setPt_id(pt_id);
		BoardDAO dao = new BoardDAO();
		BoardVO bvo = dao.selectViewOne(vo);
		bvo.setNum(num);
		dao.viewPlusOne(bvo.getP_id());
		int maxnum = dao.selectPList(pt_id).size();
		
		request.setAttribute("bvo", bvo);
		request.setAttribute("maxnum", maxnum);
		
//		System.out.println(bvo);
		
		Gson gson = new Gson();
		JsonObject Jsonobject = new JsonObject();
		Jsonobject.addProperty("maxnum", maxnum);
		Jsonobject.addProperty("num", bvo.getNum());
		Jsonobject.addProperty("p_id", bvo.getP_id());
		Jsonobject.addProperty("p_name", bvo.getP_name());
		Jsonobject.addProperty("p_cont", bvo.getP_cont());
		Jsonobject.addProperty("p_img", bvo.getP_img());
		Jsonobject.addProperty("p_view", bvo.getP_view());
		Jsonobject.addProperty("pt_id", bvo.getPt_id());
		
		String json = gson.toJson(Jsonobject);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		
        RequestDispatcher rd = request.getRequestDispatcher("BoardView.jsp");
        rd.forward(request, response);
		
		
		
	}

}
