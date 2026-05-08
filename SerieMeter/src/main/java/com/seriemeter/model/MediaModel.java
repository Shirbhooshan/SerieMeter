package com.seriemeter.model;

public class MediaModel {
	private int mediaId;
	private String title;
	private String director;
	private String releaseDate;
	private String totalTime;
	private String description;
	private String mediaProfile;
	private int categoryId;
	private int genreId;
<<<<<<< HEAD
	private boolean isDeleted; // Soft delete flag — true means hidden from display
=======
	private String genreName;
>>>>>>> refs/remotes/origin/Shirbhooshan

	public MediaModel() {
	}

	public int getMediaId() {
		return mediaId;
	}

	public void setMediaId(int mediaId) {
		this.mediaId = mediaId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMediaProfile() {
		return mediaProfile;
	}

	public void setMediaProfile(String mediaProfile) {
		this.mediaProfile = mediaProfile;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}

<<<<<<< HEAD
	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
=======
	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String g) {
		this.genreName = g;
>>>>>>> refs/remotes/origin/Shirbhooshan
	}
}