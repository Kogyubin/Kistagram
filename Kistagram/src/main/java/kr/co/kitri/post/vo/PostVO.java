package kr.co.kitri.post.vo;

import java.util.Date;

public class PostVO {
	private int post_no;
	private String id;
	private String content;
	private Date regdate;
	private String img_no;
	private int likes;
	private String del_flag;

	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getImg_no() {
		return img_no;
	}
	public void setImg_no(String img_no) {
		this.img_no = img_no;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getDel_flag() {
		return del_flag;
	}
	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

}
