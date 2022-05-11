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

@WebServlet("/InviteService")
public class InviteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

//		īƮ��� ��ȯ
		List<BoardVO> cartList = (List<BoardVO>)session.getAttribute("cartList");
		if (cartList == null) {
//			cartList = new ArrayList<String>();
			System.out.println("������ ������ϴ�");
		} else {

			String name = request.getParameter("name");
			String date = request.getParameter("date");
			String address = request.getParameter("address");
			String content = request.getParameter("content");
			String p_id = request.getParameter("p_id");
			InviteVO vo = new InviteVO();

			vo.setM_id("test1");
			vo.setV_name(name);
			vo.setV_date(date);
			vo.setV_adr(address);
			vo.setV_cont(content);
			vo.setP_id(p_id);
			System.out.println(vo);

			InviteDAO dao = new InviteDAO();
			int lastnum = dao.selectLast();
			System.out.println("��������ȣ : " + lastnum);
			int cnt = dao.write(vo);
			vo.setV_id(lastnum);
			if (cnt > 0) {
				System.out.println("�ʴ��� ��ȣ " + lastnum + "�� �߰� ����");
				for (int i = 0; i < cartList.size(); i++) {
					vo.setP_id(cartList.get(i).getP_id());
					cnt = 0;
					cnt = dao.addinvsel(vo);
					if (cnt > 0) {
						System.out.println("��Ƽ�߰� : " + cartList.get(i).getP_id());
					}
				}
				cnt = 0;
				cnt = dao.addinvselitm(lastnum);
				if (cnt > 0) {
					System.out.println("������ �߰� : " + cnt + '��');
				}
			} else {
				System.out.println("�߰�����");
			}
			RequestDispatcher rd = request.getRequestDispatcher("MylistService");
	        rd.forward(request, response);
		}
	}

}
