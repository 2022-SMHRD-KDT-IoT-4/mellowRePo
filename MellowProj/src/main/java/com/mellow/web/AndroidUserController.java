package com.mellow.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mellow.domain.UserVO;
import com.mellow.mapper.mellowMapper;

public class AndroidUserController {
	
	SqlSession sqlsession;
	
	/*안드로이드 통신관련*/
	@RequestMapping("/vision")
	@ResponseBody
	public Map<String, String> androidTestWithRequestAndResponse(HttpServletRequest request){

	        ArrayList<UserVO> vo = new ArrayList<UserVO>();
	        Map<String, String> result = new HashMap<String, String>();
	        String nowTime = getCurrentTime("YYYY,M,d");
	        String pnum = "",birthdate = "",gender = "";
	      
	        mellowMapper dao = sqlsession.getMapper(mellowMapper.class);
	       
	        
	        for(int i=0;i<vo.size();i++) {
	        	pnum += vo.get(i).getUser_pnum()+"\t";
	        	birthdate += vo.get(i).getUser_birthdate()+"\t";
	        	gender += vo.get(i).getUser_gender()+"\t";
	        }

	        result.put("pnum", pnum);
	        result.put("birthdate", birthdate);
	        result.put("gender",gender);

	        return result;
	}

	private String getCurrentTime(String timeFormat) {
	         // TODO Auto-generated method stub
	         return new SimpleDateFormat(timeFormat).format(System.currentTimeMillis());
	}

}
