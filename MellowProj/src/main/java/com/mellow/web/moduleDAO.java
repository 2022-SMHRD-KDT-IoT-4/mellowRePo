package com.mellow.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.mellow.domain.cosmeticinfoVO;
import com.mellow.domain.weatherVO;

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

   public cosmeticinfoVO cosmeticInfo(String cos_name) {
      ArrayList<cosmeticinfoVO> ar = new ArrayList<cosmeticinfoVO>();
      cosmeticinfoVO vo = new cosmeticinfoVO();

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
               + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
         urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
               + URLEncoder.encode("json", "UTF-8")); /* 응답데이터 형식(xml/json) default : xml */
         urlBuilder.append(
               "&" + URLEncoder.encode("item_seq", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 품목일련번호 */
         urlBuilder.append("&" + URLEncoder.encode("item_name", "UTF-8") + "="
               + URLEncoder.encode(cos_name, "UTF-8")); /* 품목명 */
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
//tkffuwnj
         // 객체형태로
         // {"returnType":"json","clearDate":"—",…….},…
         if (parse_listArr != null) {
            JSONObject cos_list = (JSONObject) parse_listArr.get(0);

            if (cos_list.get("ITEM_NAME") != null) {
               cos_name = cos_list.get("ITEM_NAME").toString();
            } else {
               System.out.println("없어");
               cos_name = "X";
            }
            if (cos_list.get("ENTP_NAME") != null) {
               brand_name = cos_list.get("ENTP_NAME").toString();
            } else {
               brand_name = "X";
            }
            if (cos_list.get("USAGE_DOSAGE") != null) {
               cos_dosage = cos_list.get("USAGE_DOSAGE").toString();
            } else {
               cos_dosage = "X";
            }
            if (cos_list.get("EFFECT_YN1") != null) {
               if (cos_list.get("EFFECT_YN1").toString().equals("Y")) {
                  cos_effect.concat("미백 ");
               }
            }
            if (cos_list.get("EFFECT_YN2") != null) {
               if (cos_list.get("EFFECT_YN2").toString().equals("Y")) {
                  cos_effect.concat("주름 개선 ");
               }
            }
            if (cos_list.get("EFFECT_YN3") != null) {
               if (cos_list.get("EFFECT_YN3").toString().equals("Y")) {
                  cos_effect.concat("자외선 ");
               }
            }
            if (cos_list.get("EFFECT_YN4") != null) {
               if (cos_list.get("EFFECT_YN4").toString().equals("Y")) {
                  cos_effect.concat("주름개선");
               }
            }
            if (cos_effect == "") {
               cos_effect = "X";
            }
            if (cos_list.get("PA") != null) {
               cos_pa = cos_list.get("PA").toString();
            } else {
               cos_pa = "X";
            }
            if (cos_list.get("SPF") != null) {
               cos_spf = cos_list.get("SPF").toString();
            } else {
               cos_spf = "X";
            }
            vo.setCos_type("X");
            vo.setCos_name(cos_name);
            vo.setBrand_name(brand_name);
            vo.setCos_dosage(cos_dosage);
            vo.setCos_effect(cos_effect);
            vo.setCos_pa(cos_pa);
            vo.setCos_spf(cos_spf);
            vo.setCos_file("X");
            System.out.println("DAO2 :" + vo);
//               ar.add(vo);

//            }
         }
         rd.close();
         conn.disconnect();
      } catch (IOException e) {
         e.printStackTrace();
      } catch (ParseException e) {
         e.printStackTrace();
      }

      return vo;

   }

   public int sunAPI(String day) {
      int sunData = 0;
      try {
         StringBuilder urlBuilder = new StringBuilder(
               "http://apis.data.go.kr/1360000/LivingWthrIdxServiceV2/getUVIdxV2"); /* URL */

         urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
               + "=eisE4f27WDQbN5JeRH1D4Tg7GKArWogUFp34pdQDmftqYB3C7IdPC2ksOPypr73uCa5CyD%2FRvoshQV2qoUpheA%3D%3D");

         urlBuilder.append(
               "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
         urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
               + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 Default: 10 */
         urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
               + URLEncoder.encode("JSON", "UTF-8")); /* 요청자료형식(XML/JSON) Default: XML */
         urlBuilder.append("&" + URLEncoder.encode("areaNo", "UTF-8") + "="
               + URLEncoder.encode("2900000000", "UTF-8")); /* 서울지점 공백일때: 전체지점조회 */
         urlBuilder.append("&" + URLEncoder.encode("time", "UTF-8") + "="
               + URLEncoder.encode(day, "UTF-8")); /* 21년7월6일 18시 발표 */
         URL url = new URL(urlBuilder.toString());
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("GET");
         conn.setRequestProperty("Content-type", "application/json");
         System.out.println("Response code: " + conn.getResponseCode());
         BufferedReader rd;
         if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
         } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
         }
         StringBuilder sb = new StringBuilder();
         String line;
         while ((line = rd.readLine()) != null) {
            sb.append(line);
         }
         rd.close();
         conn.disconnect();
         System.out.println(sb.toString());
         JSONParser parser = new JSONParser();
         JSONObject obj = (JSONObject) parser.parse(sb.toString());
         JSONObject response = (JSONObject) obj.get("response");
         JSONObject body = (JSONObject) response.get("body");
         JSONObject items = (JSONObject) body.get("items");
         JSONArray parse_listArr = (JSONArray) items.get("item");
         JSONObject item = (JSONObject) parse_listArr.get(0);
         sunData=Integer.parseInt((String)item.get("tomorrow"));

      } catch (IOException | ParseException e) {
         e.printStackTrace();
      }

      if (sunData!=0) {
         return sunData;
      } else {
         return 0;
      }
   }
   
   
   public weatherVO weatherAPI(String day) {
      
      float rainPerc =0;
      float tmx =0;
      
      weatherVO vo = new weatherVO();
      try {
         StringBuilder urlBuilder = new StringBuilder(
               "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /* URL */

         urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
               + "=eisE4f27WDQbN5JeRH1D4Tg7GKArWogUFp34pdQDmftqYB3C7IdPC2ksOPypr73uCa5CyD%2FRvoshQV2qoUpheA%3D%3D");

          urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
              urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
              urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
              urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(day, "UTF-8")); /*‘21년 6월 28일 발표*/
              urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0500", "UTF-8")); /*06시 발표(정시단위) */
              urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("35", "UTF-8")); /*예보지점의 X 좌표값*/
              urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("127", "UTF-8")); /*예보지점의 Y 좌표값*/
         URL url = new URL(urlBuilder.toString());
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("GET");
         conn.setRequestProperty("Content-type", "application/json");
         System.out.println("Response code: " + conn.getResponseCode());
         BufferedReader rd;
         if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
         } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
         }
         StringBuilder sb = new StringBuilder();
         String line;
         while ((line = rd.readLine()) != null) {
            sb.append(line);
         }
         rd.close();
         conn.disconnect();
         JSONParser parser = new JSONParser();
         JSONObject obj = (JSONObject) parser.parse(sb.toString());
         JSONObject response = (JSONObject) obj.get("response");
         JSONObject body = (JSONObject) response.get("body");
         JSONObject items = (JSONObject) body.get("items");
         JSONArray parse_listArr = (JSONArray) items.get("item");
         
         if(parse_listArr!=null) {
            for (int i = 0; i < parse_listArr.size(); i++) {

               JSONObject weather_list = (JSONObject) parse_listArr.get(i);
               //System.out.println(weather_list);
               String category = (String)weather_list.get("category");
               String date = (String)weather_list.get("fcstDate"); 
               if(category.equals("TMX")&& date.equals(day)) {
                  tmx = Float.parseFloat((String)weather_list.get("fcstValue"));
                  //System.out.println("최고기온 : " + tmx);
               }
               if(category.equals("REH")&& date.equals(day)) {
                  rainPerc = Float.parseFloat((String)weather_list.get("fcstValue"));
                  //System.out.println("강수확률 : " + rainPerc);
               }
               
            }
            }
      
         
      } catch (IOException | ParseException e) {
         e.printStackTrace();
      }

      vo.setTmx(tmx);
      vo.setRainPerc(rainPerc);
      System.out.println(vo);
      return vo;
   }


}





