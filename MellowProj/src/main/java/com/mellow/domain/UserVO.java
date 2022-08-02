package com.mellow.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserVO {
	
	private String user_id;
	private String user_pw;
	private String user_pnum;
	private String user_name;
	private String user_birthdate;
	private String user_gender;
	private String user_skintype;
	private String user_skintrouble;
	private String user_joindate;
	private String user_type;

}
