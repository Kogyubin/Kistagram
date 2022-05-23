package kr.co.kitri.comment.vo;

import lombok.Data;

@Data
public class CommentProfileMemberVO {
	
	private String id;
	private String comment_content;
	private String comment_regdate;
	private int parent_comment;
	private String profile_name;
	private int post_no;
	
}
