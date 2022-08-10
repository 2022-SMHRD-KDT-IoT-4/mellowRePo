package com.mellow.web;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mellow.domain.CosmeticVO;
import com.mellow.domain.cosmeticinfoVO;
import com.mellow.mapper.mellowMapper;

@Controller
public class WebRestController {

	public static String btnOp = "";

	@Autowired // self service
	mellowMapper mapper;

	// 바코드에 맞는 화장품명 출력 (ajax)
	@RequestMapping(value = "/barcode.do", produces = "application/json; charset=utf8")
	public @ResponseBody cosmeticinfoVO module(String barcode, Model model) {

		cosmeticinfoVO vo = mapper.barcodeRead(barcode);
		model.addAttribute("bar_cos", vo);
		System.out.println("불러온 화장품명" + vo.getCos_name());

		return vo;
	}

	@RequestMapping(value = "/coslistAll.do", produces = "application/json; charset=utf8")
	public @ResponseBody ArrayList<CosmeticVO> cosmeticAll(String user_id) {
		ArrayList<CosmeticVO> result = mapper.cosmeticList(user_id);
		SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		try {
			System.out.println(result.get(0).getExp_date());
			for (int i = 0; i < result.size(); i++) {

				Date exp = sdfYMDHms.parse(result.get(i).getExp_date());
				Date using = sdfYMDHms.parse(result.get(i).getExp_date());
				if(exp.compareTo(using)<0) {
					System.out.println("date1가 더 옛날"+ exp);
					result.get(i).setDiscard_date(result.get(i).getExp_date());
				}else {
					System.out.println("date2가 더 옛날" + using);
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// 개봉 리스트
	@RequestMapping(value = "/coslistOpen.do", produces = "application/json; charset=utf8")
	public @ResponseBody ArrayList<CosmeticVO> cosmeticOpen(String user_id) {
		ArrayList<CosmeticVO> result = mapper.coslistOpen(user_id);
		SimpleDateFormat sdfYMDHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		try {
			System.out.println(result.get(0).getExp_date());
			for (int i = 0; i < result.size(); i++) {

				Date exp = sdfYMDHms.parse(result.get(i).getExp_date());
				Date using = sdfYMDHms.parse(result.get(i).getExp_date());
				if(exp.compareTo(using)<0) {
					System.out.println("date1가 더 옛날"+ exp);
					result.get(i).setDiscard_date(result.get(i).getExp_date());
				}else {
					System.out.println("date2가 더 옛날" + using);
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "/coslistClose.do", produces = "application/json; charset=utf8")
	public @ResponseBody ArrayList<CosmeticVO> cosmeticClose(String user_id) {
		ArrayList<CosmeticVO> result = mapper.coslistClose(user_id);
		
		return result;
	}

	// 냉장고 온도조절, LED ON/OFF 제어
	@RequestMapping("/sensor.do")
	public @ResponseBody JSONObject tempOption(String temp) {
		System.out.println(temp);
		System.out.println(btnOp);
		JSONObject obj = new JSONObject();
		obj.put("btn", "1");
		obj.put("temp", "22");
		//return btnOp;
		return obj;

	}
	
	@RequestMapping("/tmpsensor.do")
	public @ResponseBody String tempOption1(String data) {
		System.out.println(data);
		return "0";

	}

	@RequestMapping("/btn.do")
	public @ResponseBody void tempBtn(String btnoption) {
		btnOp = btnoption;

	}

	@RequestMapping("/barmodule.do")
	public @ResponseBody String barModule(String data) {
		System.out.println(data);

		return "0";
	}

}
