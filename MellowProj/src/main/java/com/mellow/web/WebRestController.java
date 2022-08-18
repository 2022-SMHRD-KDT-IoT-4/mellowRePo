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
import com.mellow.domain.weatherVO;
import com.mellow.mapper.mellowMapper;

@Controller
public class WebRestController {

	public static String btnOp = "1";
	public static String temp = "";
	public static int cnt = 0;
	public static float sum = 0;
	int sunData=0;
	
	@Autowired // self service
	mellowMapper mapper;

	SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");

	// 바코드에 맞는 화장품명 출력 (ajax)
	@RequestMapping(value = "/barcode.do", produces = "application/json; charset=utf8")
	public @ResponseBody cosmeticinfoVO module(String barcode, Model model) {
		System.out.println(barcode);
		cosmeticinfoVO vo = mapper.barcodeRead(barcode);
		model.addAttribute("bar_cos", vo);
		System.out.println("불러온 화장품명" + vo.getCos_name());

		return vo;
	}

	@RequestMapping(value = "/coslistAll.do", produces = "application/json; charset=utf8")
	public @ResponseBody ArrayList<CosmeticVO> cosmeticAll(String user_id) {
		String a = "";
		System.out.println("전체리스트 조회");
		ArrayList<CosmeticVO> result = mapper.cosmeticList(user_id);

		try {
			System.out.println(result.get(0).getExp_date());
			for (int i = 0; i < result.size(); i++) {

				Date exp = sdfYMD.parse(result.get(i).getExp_date());
				Date using = sdfYMD.parse(result.get(i).getDiscard_date());
				if (exp.compareTo(using) < 0) {
					// System.out.println("date1가 더 옛날"+ exp);

					result.get(i).setDiscard_date(sdfYMD.format(exp));
				} else {
					// System.out.println("date2가 더 옛날" + using);
					result.get(i).setDiscard_date(sdfYMD.format(using));
				}
				
				result.get(i).setListType("1");
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(result);
		return result;
	}

	// 개봉 리스트
	@RequestMapping(value = "/coslistOpen.do", produces = "application/json; charset=utf8")
	public @ResponseBody ArrayList<CosmeticVO> cosmeticOpen(String user_id) {
		ArrayList<CosmeticVO> result = mapper.coslistOpen(user_id);
		System.out.println();
		System.out.println();
		try {
			System.out.println(result.get(0).getExp_date());
			for (int i = 0; i < result.size(); i++) {

				Date exp = sdfYMD.parse(result.get(i).getExp_date());
				Date using = sdfYMD.parse(result.get(i).getDiscard_date());
				if (exp.compareTo(using) < 0) {
					// System.out.println("date1가 더 옛날"+ exp);
					result.get(i).setDiscard_date(sdfYMD.format(exp));
				} else {
					result.get(i).setDiscard_date(sdfYMD.format(using));
				}
				// System.out.println("순서대로 : " +result.get(i).getDiscard_date());
				result.get(i).setListType("3");
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
		for (int i = 0; i < result.size(); i++) {
			result.get(i).setDiscard_date(result.get(i).getDiscard_date());
			result.get(i).setListType("2");
		}
		return result;
	}
	

	@RequestMapping("/weatherInfo.do")
	   public @ResponseBody CosmeticVO sunInfo(String user_id) {
	      String cos_effect = "";
	      String yesterday = "2022081800";
	      String today = "20220817";
	      
	      moduleDAO dao = new moduleDAO();
	      CosmeticVO cosVO = new CosmeticVO();
	   
	      sunData = dao.sunAPI(yesterday);
	      weatherVO vo =dao.weatherAPI(today);
	      vo.setSunData(sunData);
	      System.out.println("====================================");
	      System.out.println("자외선 :"+vo.getSunData());
	      System.out.println("최고온도 :"+vo.getTmx());
	      System.out.println("강수확률 :"+vo.getRainPerc());
	      
	      cosVO.setUser_id(user_id);
	      if(vo.getSunData()>6) {
	         cosVO.setCos_effect("자외선차단");
	      }else if(vo.getRainPerc()>=70.0) {
	         // 파우더 제품 추천
	         cosVO.setCos_effect("파우더");
	      }else if(vo.getTmx()>28) {
	         // 쿨링마스크 제품
	         cosVO.setCos_effect("수분진정");
	      }else {
	         // 크림 추천
	         cosVO.setCos_effect("수분");
	      }
	      ArrayList<CosmeticVO> cos_list = mapper.cosRecommend(cosVO);
	      CosmeticVO cosmetic =cos_list.get(0);
	      System.out.println(cosmetic);
	      return cosmetic;
	   }

	// 냉장고 온도조절, LED ON/OFF 제어
	@RequestMapping("/sensor.do")
	public @ResponseBody JSONObject tempOption(String data) {
		System.out.println("보낼온도값 : " + temp);
		System.out.println(btnOp);
		JSONObject obj = new JSONObject();
		obj.put("btn", btnOp);
		obj.put("temp", temp);
		// return btnOp;
		return obj;

	}

	@RequestMapping("/tmpsensor.do")
	public @ResponseBody void tempOption1(String data) {
		System.out.println("받은 데이터 " + data);
		sum = sum + Float.parseFloat(data);
		cnt++;
		if (cnt == 5) {
			temp = Float.toString(sum / cnt);
			cnt = 0;
			sum = 0;
		}

	}

	@RequestMapping("/btn.do")
	public @ResponseBody void tempBtn(String btnoption) {
		System.out.println(btnoption);
		System.out.println("들어오는신호");
		btnOp = btnoption;
		
	}

	@RequestMapping("/barmodule.do")
	public @ResponseBody String barModule(String data) {
		System.out.println(data);

		return "0";
	}

}
