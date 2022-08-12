package com.mellow.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class UserVO {
	@NonNull
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
