package xe.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data						//기본메서드 생성
@AllArgsConstructor			//모든 필드를 매개변수로 받는 생성자
@NoArgsConstructor
public class BoardVO {
	private int num;
	private String m_id;
	private String m_pw;
	private String i_id;
	private String i_name;
	private String i_cont;
	private String it_id;
	private String it_name;
	private String p_id;
	private String p_name;
	private String p_cont;
	private String p_img;
	private String p_view;
	private String pt_id;
	private String pt_name;
	private String pt_cont;
	

}
