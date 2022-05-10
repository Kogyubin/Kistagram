package kr.co.kitri.post.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
	private int post_no;
	private String id;
	private String content;
	private Date regdate;
	private int likes;
	private String del_flag;
	
}
