package com.future.my.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.parser.ParseException;

import com.future.my.member.vo.memberVO;

@Mapper
public interface IMemberDAO {
	public int registMember(memberVO member);
	public memberVO loginMember(memberVO member);
	public memberVO lobbyMember(memberVO member);
	public List<memberVO> getMemberList(memberVO member);
	public void requestApi(memberVO member);

}
