package xe.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xe.smhrd.model.InviteDAO;
import xe.smhrd.model.InviteVO;
@WebServlet("/VoteService")
public class VoteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int v_id = Integer.parseInt(request.getParameter("v_id"));
		String[] seli_id = request.getParameterValues("seli_id");	
		System.out.println("투표 입력 테스트 시작"); // 입력받은 id 콘솔
		System.out.println("v_id : "+v_id); // 입력받은 id 콘솔
		System.out.println("seli_id : "+seli_id);
		if(seli_id!=null) {
		for(int i = 0; i < seli_id.length; i++) {
		System.out.println("seli_id"+i+" : "+seli_id[i]); // 입력받은 아이템목록 콘솔
		}
		InviteDAO dao = new InviteDAO();
		InviteVO vo = new InviteVO();
		vo.setV_id(v_id);
		for(int i = 0; i < seli_id.length; i++) {
			vo.setI_id(seli_id[i]);
			System.out.println("vo : "+vo);	// 결과 콘솔
			dao.voteOne(vo);
		}}else {
			System.out.println("seli_id가 비었습니다");
		}
		
//		임시결과보기용
//		RequestDispatcher rd = request.getRequestDispatcher("MylistService");
//		rd.forward(request, response);
		
	}

}
