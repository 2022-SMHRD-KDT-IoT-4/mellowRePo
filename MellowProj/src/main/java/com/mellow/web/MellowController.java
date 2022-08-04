package com.mellow.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

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

import com.mellow.domain.UserVO;
import com.mellow.domain.cosmeticinfoVO;
import com.mellow.mapper.mellowMapper;
import com.mysql.cj.Session;

// POJO임을 명시하는 어노테이션
@Controller
public class MellowController {
	public static String btnOp = "";

	@Autowired // self service
	mellowMapper mapper;

	@RequestMapping("/main.do")
	public void main() {

	}

	@RequestMapping("/login.do")
	public String login(UserVO vo, Model model) {

		UserVO result = mapper.userLogin(vo);

		if (result != null) {
			System.out.println("login success!");
			model.addAttribute("vo", vo);
			return "../../tables";
		} else {
			System.out.println("login error!");
			return "../../login";
		}
	}

	@RequestMapping("/cosmetic.do")
	public void cosmeticInfo() {
		moduleDAO dao = new moduleDAO();
		cosmeticinfoVO[] vo = dao.cosmeticInfo();
		for (int i = 0; i < vo.length; i++) {
			System.out.println(i);
			System.out.println(vo[i]);
		}
	}

	// 라즈베리파이에서 바코드 모듈 값 받아오기
	@RequestMapping("/module.do")
	public void module(String insertbtn) {

		try (Socket client = new Socket()) {

			InetSocketAddress ipep = new InetSocketAddress("172.30.1.52", 5100);
			client.connect(ipep);
			try (OutputStream sender = client.getOutputStream(); InputStream receiver = client.getInputStream();) {
				String msg = "";
				if (insertbtn.equals("insert")) {
					// 전송할 메시지를 작성한다.
					msg = "1";
				} else if (insertbtn.equals("2")) {
					System.out.println("2 jsp");
					msg = "2";
				}
				// string을 byte배열 형식으로 변환한다.
				byte[] data = msg.getBytes();
				// ByteBuffer를 통해 데이터 길이를 byte형식으로 변환한다.
				ByteBuffer b = ByteBuffer.allocate(4);
				// byte포멧은 little 엔디언이다.
				b.order(ByteOrder.LITTLE_ENDIAN);
				b.putInt(data.length);
				// 데이터 길이 전송
				sender.write(b.array(), 0, 4);
				// 데이터 전송
				sender.write(data);
				data = new byte[4];
				// 데이터 길이를 받는다.
				receiver.read(data, 0, 4);
				// ByteBuffer를 통해 little 엔디언 형식으로 데이터 길이를 구한다.
				ByteBuffer ba = ByteBuffer.wrap(data);
				ba.order(ByteOrder.LITTLE_ENDIAN);
				int length = ba.getInt();
				// 데이터를 받을 버퍼를 선언한다.
				data = new byte[length];
				// 데이터를 받는다.
				receiver.read(data, 0, length);
				// byte형식의 데이터를 string형식으로 변환한다.
				msg = new String(data, "UTF-8");
				// 콘솔에 출력한다.
				System.out.println(msg);
			}
		} catch (

		Throwable e) {

			e.printStackTrace();
		}
	}

	// 냉장고 온도조절, LED ON/OFF 제어
	@RequestMapping("/sensor.do")
	public @ResponseBody String tempOption(String temp) {
		System.out.println(btnOp);
		return btnOp;

	}
	
	@RequestMapping("/btn.do")
	public @ResponseBody void tempBtn(String btnoption) {
		btnOp = btnoption;

	}
	
	
}