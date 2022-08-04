package com.mellow.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.mellow.domain.cosmeticinfoVO;

public class moduleDAO {
	public String barcode = "";
	public String cos_name = ""; // 제품명
	public String cos_type = ""; // 종류
	public String using_date = ""; // 사용가능기간
	public String brand_name = ""; // 브랜드명
	public String cos_dosage = ""; // 용법.용량
	public String cos_effect = ""; // 효능효과
	public String cos_spf = ""; // 자외선(SPF)
	public String cos_pa = ""; // 자외선(PA)
	public String cos_file = ""; // 사진 파일

	public cosmeticinfoVO[] cosmeticInfo() {

		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1471000/FtnltCosmRptPrdlstInfoService/getRptPrdlstInq"); /* URL */
		try {

			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=eisE4f27WDQbN5JeRH1D4Tg7GKArWogUFp34pdQDmftqYB3C7IdPC2ksOPypr73uCa5CyD/RvoshQV2qoUpheA=="); /*
																													 * Service
																													 * Key
																													 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
					+ URLEncoder.encode("json", "UTF-8")); /* 응답데이터 형식(xml/json) default : xml */
			urlBuilder.append(
					"&" + URLEncoder.encode("item_seq", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 품목일련번호 */
			urlBuilder.append("&" + URLEncoder.encode("item_name", "UTF-8") + "="
					+ URLEncoder.encode("케어존닥터솔루션노르데나우워터크리미선", "UTF-8")); /* 품목명 */
			urlBuilder.append("&" + URLEncoder.encode("cosmetic_report_seq", "UTF-8") + "="
					+ URLEncoder.encode("", "UTF-8")); /* 화장품보고일련번호 */
			URL url;

			url = new URL(urlBuilder.toString());

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			String result = "";
			while ((line = rd.readLine()) != null) {
				sb.append(line);
				result = result.concat(line);
			}

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONObject body = (JSONObject) obj.get("body");
			// System.out.println(body);
			// JSONObject item = (JSONObject)body.get("items");

			// list 아래가 배열형태로
			JSONArray parse_listArr = (JSONArray) body.get("items");

			String miseType = "";
			cosmeticinfoVO[] ar = new cosmeticinfoVO[parse_listArr.size()];

			// 객체형태로
			// {"returnType":"json","clearDate":"—",…….},…
			for (int i = 0; i < parse_listArr.size(); i++) {

				JSONObject cos_list = (JSONObject) parse_listArr.get(i);

				cosmeticinfoVO vo = new cosmeticinfoVO(barcode, cos_name, cos_type, using_date, brand_name, cos_dosage,
						cos_effect, cos_spf, cos_pa);
				// ar[i]=vo;
				if (cos_list.get("ITEM_NAME") != null) {
					cos_name = cos_list.get("ITEM_NAME").toString();
				}
				if (cos_list.get("ENTP_NAME") != null) {
					brand_name = cos_list.get("ENTP_NAME").toString();
				}
				if (cos_list.get("USAGE_DOSAGE") != null) {
					cos_dosage = cos_list.get("USAGE_DOSAGE").toString();
				}
				if (cos_list.get("EFFECT_YN1") != null | cos_list.get("EFFECT_YN2") != null
						| cos_list.get("EFFECT_YN3") != null | cos_list.get("WATER_PROOFING_FLAG") != null) {
					if (cos_list.get("EFFECT_YN1").toString().equals("Y")) {
						System.out.println("jj");
						cos_effect.concat("미백 ");
					}
					if (cos_list.get("EFFECT_YN2").toString().equals("Y")) {
						cos_effect.concat("주름개선 ");
					}
					if (cos_list.get("EFFECT_YN3").toString().equals("Y")) {
						cos_effect.concat("자외선 ");
					}
					if (cos_list.get("WATER_PROOFING_FLAG") != null) {
						cos_effect.concat("워터프루프 ");
					}

				}
				if (cos_list.get("PA") != null) {
					cos_pa = cos_list.get("PA").toString();
				}
				if (cos_list.get("SPF") != null) {
					cos_spf = cos_list.get("SPF").toString();
				}

				vo.setCos_name(cos_name);
				vo.setBrand_name(brand_name);
				vo.setCos_dosage(cos_dosage);
				vo.setCos_effect(cos_effect);
				vo.setCos_pa(cos_pa);
				vo.setCos_spf(cos_spf);
				System.out.println("DAO2 :" + vo);
				// vo.setSPF(cos_list.get("SPF").toString());
				ar[i] = vo;

				vo.setCos_name("");
				vo.setBrand_name("");
				vo.setCos_dosage("");
				vo.setCos_effect("");
				vo.setCos_pa("");
				vo.setCos_spf("");

				System.out.println(ar[i]);

			}
			rd.close();
			conn.disconnect();
			return ar;
			// System.out.println(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	
	// 유통기한 꺼내오기
	public cosmeticinfoVO[] cosmeticInfo2() {
	
	return null; 
	}
}
