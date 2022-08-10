package com.mellow.mapper;

import java.util.ArrayList;

import com.mellow.domain.CosmeticVO;
import com.mellow.domain.UserVO;

public interface mellowMapper {
	public UserVO userLogin(UserVO vo);
	public int userJoin(UserVO vo);
	public int applogin(UserVO vo);
	public ArrayList<CosmeticVO> cosmeticList();
	public ArrayList<CosmeticVO> cosmeticlistopen();
	public ArrayList<CosmeticVO> cosmeticlistclose();
	public CosmeticVO cosmetic_delete(CosmeticVO vo);
 	
}
