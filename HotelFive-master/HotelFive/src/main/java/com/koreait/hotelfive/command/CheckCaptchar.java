package com.koreait.hotelfive.command;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;

public class CheckCaptchar implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model)  {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 3. 사용자가 입력한 값 
		// 네이버 캡차 API 예제 - 키발급
		String clientId = "3jYuNCn7qtcZxPJySBE9"; //애플리케이션 클라이언트 아이디값";
		String clientSecret = "3Op_7NL8OP"; //애플리케이션 클라이언트 시크릿값";
		
		try {
			
		// 사용자가 입력한 값과 발급 받은 키 값을 준비
		request.setCharacterEncoding("utf-8");
		String input_key = request.getParameter("input_key");
		HttpSession session = request.getSession();
		
		String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
		String key = (String) session.getAttribute("KEY"); // 캡차 키 발급시 받은 키값
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value=" + input_key;

		 URL url = new URL(apiURL);
		 HttpURLConnection conn = (HttpURLConnection)url.openConnection();
         conn.setRequestMethod("GET");
         conn.setRequestProperty("X-Naver-Client-Id", clientId);
         conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		
         int responseCode = conn.getResponseCode();
         String strResult=null;
         if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
            strResult = readBody(conn.getInputStream());
         } else { // 에러 발생
             strResult = readBody(conn.getErrorStream());
         }
         //{"result":false,"errorMessage":"Invalid key.","errorCode":"CT001"}
         //System.out.println(result);
         JSONParser parser = new JSONParser();
         JSONObject obj = (JSONObject) parser.parse(strResult);
         
         //model.addAttribute("result", obj.get("result"));
         //request.setAttribute("result", obj.get("result"));
         model.addAttribute("obj", obj);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
         
	}
	
	 private static String readBody(InputStream body){
		 InputStreamReader streamReader = new InputStreamReader(body);

		 try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			 StringBuilder responseBody = new StringBuilder();

			 String line;
			 	while ((line = lineReader.readLine()) != null) {
			 			responseBody.append(line);
			 			}
	            return responseBody.toString();
		 	} catch (IOException e) {
		 		throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }

	
	
}
