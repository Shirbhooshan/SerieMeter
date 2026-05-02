package com.seriemeter.model;

/*One object = one row from the seriemeter "media" table.
 * media table columns:
 *   media_id, title, director, release_date,
 *   description, media_profile, category_id, genre_id
 */
public class MediaModel {

    private int    mediaId;      // media_id  — primary key
    private String title;        
    private String director;     
    private String releaseDate;  
    private String description;  
    private String mediaProfile; // media poster
    private String totalTime;    
    private int    categoryId;   // category_id FK category table (1=Movie, 2=Series)
    private int    genreId;      

    // Default constructor 
    public MediaModel() {}

    // Getters and Setters
   
    public int getMediaId() { return mediaId; }
    public void setMediaId(int mediaId) { this.mediaId = mediaId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public String getReleaseDate() { return releaseDate; }
    public void setReleaseDate(String releaseDate) { this.releaseDate = releaseDate; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getMediaProfile() { return mediaProfile; }
    public void setMediaProfile(String mediaProfile) { this.mediaProfile = mediaProfile; }

    public String getTotalTime() { return totalTime; }
    public void setTotalTime(String totalTime) { this.totalTime = totalTime; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public int getGenreId() { return genreId; }
    public void setGenreId(int genreId) { this.genreId = genreId; }
}