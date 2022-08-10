package com.mellow.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mellow.domain.CosmeticVO;
import com.mellow.domain.UserVO;
import com.mellow.mapper.mellowMapper;

@Controller
public class AppMellowController {
	private static final CosmeticVO vo = null;

	@Autowired // self service
	mellowMapper mapper;
	 //회원가입
	   @RequestMapping("/join.do")
	   public String gojoin() {
		   return "join";
	   }
	   
	   @PostMapping("/join.do")
	   public String join(UserVO vo, Model model) {
		   
		   System.out.println("안드로이드 vo" + vo);
		   int result = mapper.userJoin(vo);
		   System.out.println(result);
		   
		   String url = "";
	       model.addAttribute("vo", vo);
	       if (result >0) {
	         url = "join.do";
	         System.out.println("회원가입성공");
	      } else {
	         url = "join.do";
	      }
	      
	      return "redirect:/" + url;
	   }
	   
	   
	   //앱로그인
	   @RequestMapping("/applogin.do")
	   public String gologin(UserVO vo) {
		      return "applogin";
	   }
	  
//	   @PostMapping("/applogin.do")
//	   public ResponseEntity<String> applogin(UserVO vo, Model model) {
//		   // public ResponseEntity<String> applogin(UserVO vo, Model model) {
//		   System.out.println(vo.getUser_id());
//		   System.out.println(vo.getUser_pw());
//		   
//		   UserVO result = mapper.userLogin(vo);
//		   System.out.println(result);
//		   JSONObject vo1 = new JSONObject();
//		   vo1.put("user", result);
//		   String url = "";
//	       //model.addAttribute("vo", vo);
//	       if (result != null) {
//	    	   System.out.println("로그인성공");
//	    	//return vo1;   
//	         //url = "applogin.do";
//	      } else {
//	    	  System.out.println("로그인실패");
//	         //url = "index.do";
//	    	// return null;
//	      } 
//	      //System.out.println(url);
//	      return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
//	   }   
	   
	   
	   
	   
	   @PostMapping("/applogin.do")
	   public @ResponseBody JSONObject applogin(UserVO vo, Model model) {
		   // public ResponseEntity<String> applogin(UserVO vo, Model model) {
		   System.out.println(vo.getUser_id());
		   System.out.println(vo.getUser_pw());
		   
		   UserVO result = mapper.userLogin(vo);
		   System.out.println(result);
		   JSONObject vo1 = new JSONObject();
		   vo1.put("user", result);
		   String url = "";
	       //model.addAttribute("vo", vo);
	       if (result != null) {
	    	   System.out.println("로그인성공");
	    	return vo1;   
	         //url = "applogin.do";
	      } else {
	    	  System.out.println("로그인실패");
	         //url = "index.do";
	    	 return null;
	      } 
	      //System.out.println(url);
	   }   
	   
	   
	   
	   //화장품리스트 전부가져오기
	   @RequestMapping("/cosmeticlist.do")
	  // @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	   public @ResponseBody JSONObject list() {
		   System.out.println("리스트전체가져오기");
		   //Map<String, Object> map = new HashMap<String, Object>();	  
		  //map.put("datas", "123");
		   //map.put("cosmeticList", (List<CosmeticVO>)mapper.cosmeticList(vo));
		   //map.put("cosmeticList", mapper.cosmeticList(vo));
		   ArrayList<CosmeticVO> result =  mapper.cosmeticList();
		   SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		   SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		   JSONObject jsonMain=new JSONObject();
		   JSONArray arrays = new JSONArray();
		   try {
		   for(CosmeticVO vo : result) {
			   int i=0;
			   
				Date exp = sdfYMDHms.parse(vo.getExp_date());
				Date using = sdfYMDHms.parse(vo.getDiscard_date());
//				System.out.println("date1 :" +date + ", date2 : " +date2);
				if(exp.compareTo(using)<0) {
					System.out.println("date1가 더 옛날"+ exp);
					vo.setDiscard_date(vo.getExp_date());
				}else {
					System.out.println("date2가 더 옛날" + using);
				}
			  // if (vo.getExp_date())
			   JSONObject row = new JSONObject();
			   System.out.println(vo.getDiscard_date());
			  // row.put("user_id", vo.getUser_id());
			   row.put("req_seq", vo.getReq_seq());
			   row.put("cos_name", vo.getCos_name());
			   row.put("cos_type", vo.getCos_type());
			   row.put("open_yn", vo.getOpen_yn());
			   row.put("discard_date", vo.getDiscard_date());
			
			   //row.put("req_bar",vo.getReg_seq());
			  // row.put("exp_date", vo.getExp_date());
			  // row.put("using_date", vo.getUsing_date());
			  // row.put("open_date", vo.getOpen_date());
			  // row.put("user_id", vo.getUser_id());
			   //row.put("cos_file",vo.getCos_file());
			   
			   arrays.add(i, row);
			   i++;
			   
		   }
		   jsonMain.put("cosmetics", arrays);
		   } catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   return jsonMain;
	   }
	   
	   
	   
	  //화장품 리스트 개봉O만 가져오기
	   @RequestMapping("/cosmeticlistopen.do")
	   public @ResponseBody JSONObject list1() {
		   System.out.println("개봉여부O");

		   ArrayList<CosmeticVO> result1 =  mapper.cosmeticlistopen();
		   SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		   SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		   JSONObject jsonMain=new JSONObject();
		   JSONArray arrays = new JSONArray();
		   try {
		   for(CosmeticVO vo : result1) {
			   int i=0;
			   
				Date exp = sdfYMDHms.parse(vo.getExp_date());
				Date using = sdfYMDHms.parse(vo.getDiscard_date());
				if(exp.compareTo(using)<0) {
					vo.setDiscard_date(vo.getExp_date());
				}else {
				}
			   JSONObject row = new JSONObject();
			   System.out.println(vo.getDiscard_date());
			   row.put("req_seq", vo.getReq_seq());
			   row.put("cos_name", vo.getCos_name());
			   row.put("cos_type", vo.getCos_type());
			   row.put("open_yn", vo.getOpen_yn());
			   row.put("discard_date", vo.getDiscard_date());
			
			   arrays.add(i, row);
			   System.out.println(arrays);
			   i++;
			   
		   }
		   jsonMain.put("cosmetics", arrays);
		   } catch (ParseException e) {
				e.printStackTrace();
			}
		   return jsonMain;
	   }
	   
	   
		  //화장품 리스트 개봉X만 가져오기
	   @RequestMapping("/cosmeticlistclose.do")
	   public @ResponseBody JSONObject list2() {
		   System.out.println("개봉여부X");

		   ArrayList<CosmeticVO> result2 =  mapper.cosmeticlistclose();
		   SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		   SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		   JSONObject jsonMain=new JSONObject();
		   JSONArray arrays = new JSONArray();
		   try {
		   for(CosmeticVO vo : result2) {
			   int i=0;
			   
				Date exp = sdfYMDHms.parse(vo.getExp_date());
				Date using = sdfYMDHms.parse(vo.getDiscard_date());
				if(exp.compareTo(using)<0) {
					vo.setDiscard_date(vo.getExp_date());
				}else {
				}
			   JSONObject row = new JSONObject();
			   System.out.println(vo.getDiscard_date());
			   row.put("req_seq", vo.getReq_seq());
			   row.put("cos_name", vo.getCos_name());
			   row.put("cos_type", vo.getCos_type());
			   row.put("open_yn", vo.getOpen_yn());
			   row.put("discard_date", vo.getDiscard_date());
			
			   arrays.add(i, row);
			   i++;
			   
		   }
		   jsonMain.put("cosmetics", arrays);
		   } catch (ParseException e) {
				e.printStackTrace();
			}
		   return jsonMain;
	   }
	   
	   
	   
	   @RequestMapping("/cosmetic_delete.do")
	   public @ResponseBody JSONObject cosmetic_delete(CosmeticVO vo,Model model){
		   System.out.println(vo.getReq_seq());
		   //System.out.println(vo.getCos_name());
		   
		   CosmeticVO result=mapper.cosmetic_delete(vo);
		   System.out.println(result);
		   JSONObject vo1=new JSONObject();
		   vo1.put("list", result);
		   String url="";
		   
		   if (result!=null) {
			   System.out.println("delete success");
			   return vo1;
		   }else {
			   System.out.println("delete fail");
			   return null;
		   }
		   
	   }
	   
	   
	   
	   
	   
	   

}
