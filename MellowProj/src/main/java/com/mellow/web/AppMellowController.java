package com.mellow.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mellow.domain.CosmeticVO;
import com.mellow.domain.UserVO;
import com.mellow.domain.csVO;
import com.mellow.mapper.mellowMapper;

@Controller
public class AppMellowController {
	private static final CosmeticVO vo = null;

	@Autowired // self service
	mellowMapper mapper;

	private String user_id;
	 //회원가입
	   @RequestMapping("/appjoin.do")
	   public String gojoin(UserVO vo) {
		   return "join";
	   }
	   
	   @PostMapping("/appjoin.do")
	   public @ResponseBody String appjoin(UserVO vo, Model model) {
		   
		   System.out.println("안드로이드 vo" + vo);
		   int result = mapper.userJoin(vo);
		   System.out.println(result);
		   
		   String url = "";
	       model.addAttribute("vo", vo);
	       if (result > 0) {
	         url = "success";
	         System.out.println("회원가입성공");
	      } else {
	         url = "";
	      }
	      
	      return url;
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
	         //url = "index.do";ㄱ5444
	    	 return null;
	      } 
	      //System.out.println(url);
	   }   
	   
	   
	   
	   //화장품리스트 전부가져오기
	   @RequestMapping("/cosmeticlist.do")
	  // @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	   public @ResponseBody JSONObject list(String user_id) {
		  System.out.println("전체리스트 user_id :"+user_id);
		   
		   //Map<String, Object> map = new HashMap<String, Objecht>();	  
		  //map.put("datas", "123");
		   //map.put("cosmeticList", (List<CosmeticVO>)mapper.cosmeticList(vo));
		   //map.put("cosmeticList", mapper.cosmeticList(vo));
		   
		   ArrayList<CosmeticVO> result =  mapper.cosmeticList(user_id);
		   //System.out.println(result.get(1));
		   
		  // return null;
		   
		   SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		   SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		   JSONObject jsonMain=new JSONObject();
		   JSONArray arrays = new JSONArray();
		   try {
		   for(CosmeticVO vo : result) {
			   int i=0;
			   
				Date exp = sdfYMDHms.parse(vo.getExp_date());
				Date using = sdfYMDHms.parse(vo.getDiscard_date());
				//System.out.println("date1 :" +date + ", date2 : " +date2);
				if(exp.compareTo(using)<0) {
					System.out.println("date1가 더 옛날"+ exp);
					vo.setDiscard_date(vo.getExp_date());
				}else {
					System.out.println("date2가 더 옛날" + using);
				}
			  // if (vo.getExp_date())
			   JSONObject row = new JSONObject();
			   System.out.println(vo.getDiscard_date());
			   row.put("req_seq", vo.getReq_seq());
			   row.put("cos_name", vo.getCos_name());
			   row.put("cos_type", vo.getCos_type());
			   row.put("open_yn", vo.getOpen_yn());
			   row.put("discard_date", vo.getDiscard_date());
			
			   //row.put("req_bar",vo.getReg_seq());
			  // row.put("exp_date", vo.getExp_date());
			  // row.put("using_date", vo.getUsing_date());
			  // row.put("open_date", vo.getOpen_date());
			   row.put("user_id", vo.getUser_id());
			   row.put("cos_file",vo.getCos_file());
			   
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

	   //화장품리스트 전부가져오기
//	   @GetMapping("/cosmeticlist.do")
//	  // @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
//	   public JSONObject list(@RequestParam String id) {
//		   System.out.println("test1 : " + id);
//		   
////		   System.out.println(mapper.cosmeticList().toString());
//		   return null;
//		   
//	   }
	   
	   
	   
	  //화장품 리스트 개봉O만 가져오기
	   @RequestMapping("/cosmeticlistopen.do")
	   public @ResponseBody JSONObject list1(String user_id) {

		   System.out.println(user_id);
		   ArrayList<CosmeticVO> result1 =  mapper.coslistOpen(user_id);
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
	   public @ResponseBody JSONObject list2(String user_id) {
		  System.out.println("close user_id : " +user_id);
		   ArrayList<CosmeticVO> result2 =  mapper.coslistClose(user_id);
		   SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		   SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		   JSONObject jsonMain=new JSONObject();
		   JSONArray arrays = new JSONArray();
		   try {
		   for(CosmeticVO vo : result2) {
			   int i=0;
			   
				Date exp = sdfYMDHms.parse(vo.getExp_date());
				Date using = sdfYMDHms.parse(vo.getDiscard_date());
				
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
	   
	   
	   
	   
	   //리스트 삭제하기
	   //user_id, req_seq받아서 ㄱㄱ
		   @RequestMapping("/btnDelete.do")
		   public @ResponseBody JSONObject btnDelete(ServletRequest request){
			   System.out.println("delete Test: "+ request.getParameter("req_seq"));
			   String req_seq=request.getParameter("req_seq");
			   CosmeticVO vo = new CosmeticVO();
			   vo.setReq_seq(req_seq);
			   int result = mapper.btnDeleteApp(vo);			   
			   System.out.println(result);
			   JSONObject vo1=new JSONObject();
			   vo1.put("list", result);
			   String url="";
			   
			   if (result > 0) {
				   System.out.println("delete success");
				   return vo1;
			   }else {
				   System.out.println("delete fail");
				   return null;
			   }
			   
		   }
		   
		   
		   //리스트 개봉여부수정하기
		   //user_id, req_seq받아서 ㄱㄱ
			   @RequestMapping("/btnOpen.do")
			   public @ResponseBody JSONObject btnOpen(ServletRequest request){
				   System.out.println("수정되니? : "+ request.getParameter("req_seq"));
				   String req_seq=request.getParameter("req_seq");
				   CosmeticVO vo = new CosmeticVO();
				   vo.setReq_seq(req_seq);
				   int result = mapper.btnOpenApp(vo);			   
				   System.out.println(result);
				   JSONObject vo1=new JSONObject();
				   vo1.put("list", result);
				   String url="";
				   
				   if (result > 0) {
					   System.out.println("수정 success");
					   return vo1;
				   }else {
					   System.out.println("수정 fail");
					   return null;
				   }
				   
			   }
		   
		   
	   
	   
			   // 여기는 1:1 문의하기위한 값을 데이터베이스에 저장하기 위한 값
			   @RequestMapping("/incuiryInsert.do")
			   public String incuiry(csVO cs, Model model){
			      // ResponseBody를 사용하는 이유는 안드로이드에서는 서버이동이 일어나지 않기 때문에 일어난다.
			      System.out.println(cs.getQ_subject());
			      System.out.println(cs.getQ_content());
			      System.out.println(cs.getUser_id());
			      
			      System.out.println("요청들어옴");
			      
			      int result = mapper.incuiryInsert(cs);
			      System.out.println(result);
			      String url = "";
			      model.addAttribute("vo1", cs);
			      
			      
			      return "redirect:/";
			      
			   }
			   
			   // 문의사항 내역을 출력하기 위한 컨트롤러
			   @RequestMapping("/incuirylist.do")
			   public @ResponseBody JSONObject cslist(String user_id) {
			      System.out.println(user_id);
			      //String data_title = response
			      System.out.println("incuirylist.do 서버 요청 들어옴!");
	      
			         ArrayList<csVO> result = mapper.csList(user_id);
			       System.out.println(result);
			      
			       JSONObject jsonMain = new JSONObject();
			       JSONArray array = new JSONArray();
			       
			       SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
			       
			       try {
			          for (int i = 0; i < result.size(); i++) {
			             
			             JSONObject row = new JSONObject();
			             
			             // 작성 번호
			             row.put("q_seq", result.get(i).getQ_seq());
			             
			             // 작성자
			             row.put("user_id", result.get(i).getUser_id());
			             
			             // 작성날짜
			             row.put("q_date", result.get(i).getQ_date());
			             
			             // 작성 제목
			             row.put("q_subject", result.get(i).getQ_subject());
			             
			             // 작성 내용
			             row.put("q_content", result.get(i).getQ_content());
			             
			             // 첨부파일
			             row.put("q_file", result.get(i).getQ_file());
			             
			             array.add(i, row);
			          }
			          		          
			          jsonMain.put("cs", array);		          
			       } catch (Exception e) {
			          e.printStackTrace();
			       }		       
			       System.out.println("요청들어옴");
			       
			       return jsonMain;	      
			   }
	   
	   
	   
	   
	   

}
