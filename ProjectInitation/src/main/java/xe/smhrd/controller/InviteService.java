package xe.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xe.smhrd.model.BoardVO;
import xe.smhrd.model.InviteDAO;
import xe.smhrd.model.InviteVO;
import xe.smhrd.model.MemberVO;

@WebServlet("/InviteService")
public class InviteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

//		카트목록 소환
		List<BoardVO> cartList = (List<BoardVO>)session.getAttribute("cartList");
		if (cartList == null) {
//			cartList = new ArrayList<String>();
			System.out.println("찜목록이 비었습니다");
		} else {

			MemberVO mvo = (MemberVO) session.getAttribute("vo");
			String name = request.getParameter("name");
			String date = request.getParameter("date");
			String address = request.getParameter("address");
			String content = request.getParameter("content");
			String p_id = request.getParameter("p_id");
			InviteVO vo = new InviteVO();

			vo.setM_id(mvo.getM_id());
			vo.setV_name(name);
			vo.setV_date(date);
			vo.setV_adr(address);
			vo.setV_cont(content);
			vo.setP_id(p_id);
			System.out.println(vo);

			InviteDAO dao = new InviteDAO();
			int lastnum = dao.selectLast();
			System.out.println("마지막번호 : " + lastnum);
			int cnt = dao.write(vo);
			vo.setV_id(lastnum);
			if (cnt > 0) {
				System.out.println("초대장 번호 " + lastnum + "번 추가 성공");
				for (int i = 0; i < cartList.size(); i++) {
					vo.setP_id(cartList.get(i).getP_id());
					cnt = 0;
					cnt = dao.addinvsel(vo);
					if (cnt > 0) {
						System.out.println("파티추가 : " + cartList.get(i).getP_id());
					}
				}
				cnt = 0;
				cnt = dao.addinvselitm(lastnum);
				if (cnt > 0) {
					System.out.println("아이템 추가 : " + cnt + '열');
				}
			} else {
				System.out.println("추가실패");
			}
			RequestDispatcher rd = request.getRequestDispatcher("MyPartylist.jsp");
	        rd.forward(request, response);
		}
	}

}
