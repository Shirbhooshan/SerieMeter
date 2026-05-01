package com.seriemeter.model;

public class Movie {
	//Attributes for the adminContent
	private String title;
	private String director;
	private String releaseDate;
	private String category;
	private String totalTime;
	private String synopsis;
	private String genre;
	
//Constructor
	public Movie(String title, String director, String releaseDate, String category, String totalTime, String synopsis, String genre)
	{
		this.title = title;
		this.director = director;
		this.releaseDate = releaseDate;
		this.category = category;
		this.totalTime = totalTime;
		this.synopsis = synopsis;
		this.genre = genre;
	}
	
	//Getter and setter method
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
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}
	
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
}

	
