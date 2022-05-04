package xe.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class InviteVO {
	@NonNull
	private int v_id;
	private String m_id;
	private String v_name;
	private String v_adr;
	private String v_date;
	private String v_cont;
	private String p_id;
	private String i_id;
}
