package com.future.my.member.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.future.my.member.dao.IMemberDAO;
import com.future.my.member.vo.memberVO;

@Service
public class MemberService {
	@Autowired
	IMemberDAO dao;
	
	public void registMember(memberVO member) throws Exception {
			int result = dao.registMember(member);
			if(result ==0) {
				throw new Exception();
			}
			
			requestApi(member.getUserNm());
			
	}
	public void requestApi(String team_name) throws ParseException {
		
				String api_key = "RGAPI-434e8c55-a713-416b-9c4e-e7ed4f8b8f38";
		       String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+team_name+"?api_key="+api_key;
		        RestTemplate restTemplate = new RestTemplate();
		        
		        String response = restTemplate.getForObject(url, String.class);
		        JSONParser parser = new JSONParser();
		        JSONObject jsonObject = (JSONObject) parser.parse(response);
		        String id_code = (String) jsonObject.get("id");
		        
		        String url_two = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+id_code+"?api_key="+api_key;
		        String response2 = restTemplate.getForObject(url_two, String.class);
		        JSONArray jsonArray = (JSONArray) parser.parse(response2);
		        for(Object item : jsonArray) {
		        	JSONObject obj = (JSONObject) item;
		            	try {
		            		String queueType = (String) obj.get("queueType");
		            		if(queueType.equals("RANKED_SOLO_5x5")) {
			            		String tier = (String) obj.get("tier");
			            		String rank = (String) obj.get("rank");
			            		Long userWins = (Long) obj.get("wins");
			            		Long userlosses= (Long) obj.get("losses");
			            		String userTier= (tier+' '+rank);
			            		memberVO vo = new memberVO();
			            		vo.setUserTier(userTier);
			            		vo.setUserWins( userWins.toString());
			            		vo.setUserLosses( userlosses.toString());
			            		vo.setUserNm(team_name);
			            		dao.requestApi(vo);
		            		}
		            	}catch(Exception e) {
		            		e.printStackTrace();
		            	}
		        }
	}
	
	public memberVO loginMember(memberVO member) {
		memberVO result =dao.loginMember(member);
		if(result ==null) {
			return null;	
		}
		
		return result;
	}
	
	public memberVO lobbyMember(memberVO member) {
		memberVO result =dao.lobbyMember(member);
		if(result ==null) {
			return null;	
		}
		return result;

	}
	public List<memberVO> getMemberList(memberVO member){
		List<memberVO> result = dao.getMemberList(member);
		System.out.println(result);
		System.out.println("result");
		return result;
	}
	
}
