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
public class CartVO {
	
	
	private String p_id;
	private String pt_id;
	@NonNull
	private String p_name;
	private String p_cont;
	private String p_img;
	@NonNull
	private int p_view;
	
	
}
