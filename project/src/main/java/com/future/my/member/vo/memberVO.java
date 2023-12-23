package com.future.my.member.vo;

public class memberVO {

	
	private String userId;
	private String userPw;
	private String userNm;
	private String userTier;
	private String userWins;
	private String userLosses;
	

	public memberVO() {
	
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserNm() {
		return userNm;
	}


	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}


	public String getUserTier() {
		return userTier;
	}


	public void setUserTier(String userTier) {
		this.userTier = userTier;
	}


	public String getUserWins() {
		return userWins;
	}


	public void setUserWins(String userWins) {
		this.userWins = userWins;
	}


	public String getUserLosses() {
		return userLosses;
	}


	public void setUserLosses(String userLosses) {
		this.userLosses = userLosses;
	}


	public memberVO(String userId, String userPw, String userNm, String userTier, String userWins, String userLosses) {
		this.userId = userId;
		this.userPw = userPw;
		this.userNm = userNm;
		this.userTier = userTier;
		this.userWins = userWins;
		this.userLosses = userLosses;
	}


	@Override
	public String toString() {
		return "memberVO [userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm + ", userTier=" + userTier
				+ ", userWins=" + userWins + ", userLosses=" + userLosses + "]";
	}
	
	
//	private String userId;
//	private String userPw;
//	private String userNm;
//	
//	public memberVO() {
//		
//	}
//	
//	public String getUserId() {
//		return userId;
//	}
//	public void setUserId(String userId) {
//		this.userId = userId;
//	}
//	public String getUserPw() {
//		return userPw;
//	}
//	public void setUserPw(String userPw) {
//		this.userPw = userPw;
//	}
//	public String getUserNm() {
//		return userNm;
//	}
//	public void setUserNm(String userNm) {
//		this.userNm = userNm;
//	}
//	@Override
//	public String toString() {
//		return "memberVO [userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm + "]";
//	}
//	public memberVO(String userId, String userPw, String userNm) {
//		this.userId = userId;
//		this.userPw = userPw;
//		this.userNm = userNm;
//	}
//
//	
	
}