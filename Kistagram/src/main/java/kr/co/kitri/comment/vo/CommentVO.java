package kr.co.kitri.comment.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int comment_no;
	private int post_no;
	private String id;
	private String comment_content;
	private Date comment_regdate;
}
