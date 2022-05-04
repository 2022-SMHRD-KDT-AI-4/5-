package xe.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import xe.smhrd.model.BoardDAO;
import xe.smhrd.model.BoardVO;

@WebServlet("/WriteService")
public class WriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String savePath = request.getSession().getServletContext().getRealPath("img");
		int maxSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
//		System.out.println(savePath);

		MultipartRequest multi = new MultipartRequest(request, savePath, // 어디에 저장할지
				maxSize, // 허용 용량
				encoding, // 인코딩 방식
				new DefaultFileRenamePolicy()
		// 중복된 파일이 들어왔을때, 자동으로 이름 변경
		);

// 파라미터 수집
		String p_id = multi.getParameter("p_id");
		String pt_id = multi.getParameter("pt_id");
		String p_name = multi.getParameter("p_name");
		String p_cont = multi.getParameter("p_cont");
// 파일이름 출력
// getFilesystemName("Name")
		String fileName = multi.getFilesystemName("file");
		System.out.println(fileName);

		BoardVO bvo = new BoardVO();
		bvo.setP_id(p_id);
		bvo.setPt_id(pt_id);
		bvo.setP_name(p_name);
		bvo.setP_cont(p_cont);
		bvo.setP_img(fileName);
		System.out.println(bvo);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.write(bvo);

		if (cnt > 0) {
			System.out.println("작성성공");
			response.sendRedirect("ListService");
		} else {
			System.out.println("작성실패");
			response.sendRedirect("ABoardWrite.jsp");
		}

	}

}
