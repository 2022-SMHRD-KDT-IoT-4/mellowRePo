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

	@RequestMapping("/login.do")
	public String login(UserVO vo, Model model, HttpSession session) {

		UserVO result = mapper.userLogin(vo);

		if (result != null) {
			System.out.println("login success!");
			System.out.println(vo);
			String userId = vo.getUser_id();
			session.setAttribute("userInfo", vo);
			return "../../cos_register";
		} else {
			System.out.println("login error!");
			return "../../login";
		}
	}

	// 화장품 api담아오기
	@RequestMapping("/cosmetic.do")
	public void cosmeticInfo() {
		moduleDAO dao = new moduleDAO();
		ArrayList<cosmeticinfoVO> ar = dao.cosmeticInfo();
		cosmeticinfoVO vo = new cosmeticinfoVO();
		if (!ar.isEmpty()) {
			System.out.println("ar값 불러옴");
			System.out.println(ar);
			// insert mapper
//			String barcode = ar.get(0).getBarcode();
//			String barcode = ar.get(0).getBarcode();
//			String barcode = ar.get(0).getBarcode();
//			String barcode = ar.get(0).getBarcode();
//			String barcode = ar.get(0).getBarcode();
//			String barcode = ar.get(0).getBarcode();
			if(ar.get(0).getBarcode()!=null) {
				vo.setBarcode(ar.get(0).getBarcode());
			}
			System.out.println();
			
		}

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
		return "../../cos_retrieve";
	}

	

}