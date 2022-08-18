package com.mellow.mapper;

import java.util.ArrayList;

import com.mellow.domain.CosmeticVO;
import com.mellow.domain.UserVO;
import com.mellow.domain.cosmeticinfoVO;
import com.mellow.domain.csVO;

public interface mellowMapper {
   public UserVO userLogin(UserVO vo);
   public int userJoin(UserVO vo);
   public int applogin(UserVO vo);
   public ArrayList<CosmeticVO> cosmeticList(String user_id);
   public ArrayList<CosmeticVO> coslistClose(String user_id);
   public ArrayList<CosmeticVO> coslistOpen(String user_id);
   public cosmeticinfoVO barcodeRead(String barcode); //바코드에 맞는 상품명 출력
   public int registCos(CosmeticVO vo); // 화장품 등록정보 저장
   public int btnOpen(CosmeticVO vo);
   public int btnOpenApp(CosmeticVO vo);
   public int btnDelete(CosmeticVO vo);
   public int btnDeleteApp(CosmeticVO vo);
   public cosmeticinfoVO cosInfo(String cos_name);
   public CosmeticVO btnDelete(String user_id, String req_seq); //화장품리스트 삭제
   public int cosInfoUpdate(cosmeticinfoVO vo);
   public ArrayList<CosmeticVO> cosRecommend(CosmeticVO cosVO);
   public int incuiryInsert(csVO cs); // 문의사항에 들어온값을 저장하기 위한 매퍼
   public ArrayList<csVO> csList(String user_id);   // 리스트를 출력하기 위한 매퍼
}