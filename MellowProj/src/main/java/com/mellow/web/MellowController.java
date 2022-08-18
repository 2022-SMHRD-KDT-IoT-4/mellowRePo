package com.mellow.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mellow.domain.CosmeticVO;
import com.mellow.domain.UserVO;
import com.mellow.domain.cosmeticinfoVO;
import com.mellow.mapper.mellowMapper;
import com.mysql.cj.Session;

// POJO임을 명시하는 어노테이션
@Controller
public class MellowController {
	SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");

	@Autowired // self service
	mellowMapper mapper;

	@RequestMapping("/main.do")
	public void main() {

	}
	@RequestMapping("/")
	public String viewMain() {
		return "../../index";
	}

	@RequestMapping("/login.do")
	public String login(UserVO vo, Model model, HttpSession session) {

		UserVO result = mapper.userLogin(vo);

		if (result != null) {
			System.out.println("login success!");
			System.out.println(vo);
			String userId = vo.getUser_id();
			session.setAttribute("userInfo", vo);
			return "../../index";
		} else {
			System.out.println("login error!");
			return "../../login2";
		}
	}

	// 화장품 api담아오기
	@RequestMapping("/cosmetic.do")
	public String cosmeticInfo(HttpSession session,String cos_name) {
		UserVO user = (UserVO) session.getAttribute("userInfo");

		moduleDAO dao = new moduleDAO();
		cosmeticinfoVO vo = dao.cosmeticInfo(cos_name);
		System.out.println(user.getUser_id());
		vo.setUser_id(user.getUser_id());
		System.out.println(vo);
		if (vo.getCos_name() != null) {
			System.out.println("ar값 불러옴");
			int row = mapper.cosInfoUpdate(vo);
			if(row>0) {
				System.out.println("화장품 상세정보 업데이트 성공");
			}else {
				System.out.println("화장품 상세정보 업데이트 실패");
			}
		}else {
			System.out.println("화장품 상세정보 없음");
		}

		return "../../index";
	}

	// 바코드 인식 후 내용 넣고 등록
	@RequestMapping("/regist.do")
	public String registCos(CosmeticVO vo) {

		if (vo.getOpen_yn().equals("Y")) {
			String current = sdfYMD.format(System.currentTimeMillis());
			System.out.println(current);
			vo.setOpen_date(current);
		} else {
			vo.setOpen_date(vo.getExp_date());
		}

		System.out.println("등록정보입력");
		System.out.println(vo.getCos_name());
		System.out.println(vo.getBarcode());
		System.out.println(vo.getCos_type());
		System.out.println(vo.getExp_date());
		System.out.println(vo.getOpen_yn());
		System.out.println(vo.getOpen_date());
		System.out.println(vo.getUser_id());
		int row = mapper.registCos(vo);

		if (row > 0) {
			System.out.println("등록성공");

		} else {
			System.out.println("등록실패");
		}
		return "redirect:/cosmetic.do?cos_name="+vo.getCos_name();
	}
	
	@RequestMapping("/cosDelete.do")
	public @ResponseBody void cosDelete(String user_id, String req_seq) {
		System.out.println("삭제할 상품의 사용자 : " + user_id);
		System.out.println("삭제할 상품의 일련번호 : " + req_seq);
		
		CosmeticVO vo = new CosmeticVO();
		vo.setUser_id(user_id);
		vo.setReq_seq(req_seq);
		int row = mapper.btnDelete(vo);
		
		if(row>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		
		
	}
	
	@RequestMapping("/cosInfo.do")
	public @ResponseBody cosmeticinfoVO cosInfo(String cos_name) {
		System.out.println("화장품 상세정보 조회");
		
		cosmeticinfoVO vo = mapper.cosInfo(cos_name);
		System.out.println(vo);
		return vo;
	}

}