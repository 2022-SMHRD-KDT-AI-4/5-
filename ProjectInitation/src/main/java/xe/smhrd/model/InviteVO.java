package xe.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InviteVO {
	private int num;
	private int v_id;
	private String m_id;
	private String m_name;
	private String v_name;
	private String v_adr;
	private String v_date;
	private String v_cont;
	private String p_id;
	private String p_name;
	private String p_img;
	private String i_id;
	private String i_name;
	private String sel_g;
	private String sel_h;
}
