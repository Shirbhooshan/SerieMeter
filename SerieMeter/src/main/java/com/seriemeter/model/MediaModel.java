package com.seriemeter.model;

<<<<<<< HEAD
/* One object of this class = one row from the "media" table.
 * media table columns:
 *   media_id, title, director, release_date,
 *   description, media_profile, category_id, genre_id
 */

public class MediaModel {

	private int mediaId; // media_id — primary key
	private String title; // title
	private String director; // director
	private String releaseDate; // release_date (String so JSP can display it easily)
	private String description; // description (the synopsis text)
	private String mediaProfile; // media_profile (poster image filename)
	private int categoryId; // category_id (FK = category table: 1=Movie, 2=Series)
	private int genreId; // genre_id (FK = genre table)

	// Default constructor
	public MediaModel() {
	}

// Getters and Setters
// JSP uses these via EL: ${media.title} calls getTitle()
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
=======
import java.io.Serializable;

/**
 * MediaModel represents the media table in the database.
 * It holds the details for movies and series.
 */
public class MediaModel implements Serializable {
    private static final long serialVersionUID = 1L;

    private int mediaId;
    private String title;
    private String director;
    private String releaseDate; // Stored as String for ease with HTML5 date inputs
    private String totalTime;
    private String description;
    private String mediaProfile; // Stores the path/filename of the uploaded image
    private int categoryId;
    private int genreId;

    // Default Constructor
    public MediaModel() {
    }

    // Parameterized Constructor
    public MediaModel(int mediaId, String title, String director, String releaseDate, 
                      String totalTime, String description, String mediaProfile, 
                      int categoryId, int genreId) {
        this.mediaId = mediaId;
        this.title = title;
        this.director = director;
        this.releaseDate = releaseDate;
        this.totalTime = totalTime;
        this.description = description;
        this.mediaProfile = mediaProfile;
        this.categoryId = categoryId;
        this.genreId = genreId;
    }

    // Getters and Setters
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
>>>>>>> refs/remotes/origin/Shuvam
}