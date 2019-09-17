package test.dto;

import java.time.LocalDateTime;

public class PostDto {
	
	private int postNum;
	private String id, name, description, imgSrc;
	private LocalDateTime regdate;
	private int likeCount;
	
	public PostDto() {}
	
	PostDto(String id, String name, String description, String imgSrc, LocalDateTime regdate, int likeCount) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.imgSrc = imgSrc;
		this.regdate = regdate;
		this.likeCount = likeCount;
	}
	
	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	
	
	
}
