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

		String pt_id = request.getParameter("pt_id");
		int num = Integer.parseInt(request.getParameter("num"));
			
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		vo.setPt_id(pt_id);
		BoardDAO dao = new BoardDAO();
		BoardVO bvo = dao.selectViewOne(vo);
		bvo.setNum(num);
		dao.viewPlusOne(bvo.getP_id());
		List<BoardVO> list = dao.selectPartyItemList(bvo.getP_id());
		int maxnum = dao.selectPList(pt_id).size();
//		System.out.println("리스트 사이즈 : "+list.size());
//		System.out.println("vo:"+bvo);
		
		
		request.setAttribute("bvo", bvo);
		request.setAttribute("ilist", list);
		request.setAttribute("maxnum", maxnum);
        
        RequestDispatcher rd = request.getRequestDispatcher("BoardView.jsp");
        rd.forward(request, response);
		
	}

}
