package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.seriemeter.model.Movie;

public class MovieDAO {
	//Database Credentials
	private String jdbcURL = "jdbc:mysql://localhost:3306/admin_content";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	private static final String INSERT_MOVIE_SQL = "INSERT INTO movies" +
	        "  (title, director, release_date, category, total_time, synopsis, genre) VALUES " +
	        " (?, ?, ?, ?, ?, ?, ?);";
	
	//Connection to the mysql
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
		catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	//Insert Movie Method
	public boolean insertMovie(Movie movie) {
		boolean rowInserted = false;
		// Using try-with-resources to automatically close the connection
		
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MOVIE_SQL)){
					
					//Prevent SQL injection by using Prepared Statements
					preparedStatement.setString(1, movie.getTitle());
					preparedStatement.setString(2, movie.getDirector());
					preparedStatement.setDate(3, java.sql.Date.valueOf(movie.getReleaseDate()));
					preparedStatement.setString(4, movie.getCategory());
					preparedStatement.setString(5, movie.getTotalTime());
					preparedStatement.setString(6, movie.getSynopsis());
					preparedStatement.setString(7, movie.getGenre());
					
					rowInserted = preparedStatement.executeUpdate() > 0;
				}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return rowInserted;
	}
}
