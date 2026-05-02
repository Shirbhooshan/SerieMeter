<<<<<<< HEAD
package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.seriemeter.model.MediaModel;
import com.seriemeter.utils.DBconfig;

public class MediaDAO {

    public int saveMedia(MediaModel media) {
        int result = 0;

        String sql = "INSERT INTO media (title, director, release_date, total_time, description, media_profile, category_id, genre_id) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, media.getTitle());
            ps.setString(2, media.getDirector());

            // Convert "yyyy-MM-dd" string from HTML date input to SQL Timestamp
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date parsed = sdf.parse(media.getReleaseDate());
            ps.setTimestamp(3, new Timestamp(parsed.getTime()));

            ps.setString(4, media.getTotalTime());
            ps.setString(5, media.getDescription());
            ps.setString(6, media.getMediaProfile());
            ps.setInt(7, media.getCategoryId());
            ps.setInt(8, media.getGenreId());

            result = ps.executeUpdate();
            System.out.println("MediaDAO: rows inserted = " + result);

        } catch (Exception e) {
            System.out.println("MediaDAO ERROR: " + e.getMessage());
            e.printStackTrace();
        }

        return result;
    }
}
=======
<<<<<<< HEAD
=======
package com.seriemeter.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.seriemeter.model.MediaModel;
import com.seriemeter.utils.DBconfig;

public class MediaDAO {

    private static final String INSERT_MEDIA_SQL = "INSERT INTO media " +
        "(title, director, release_date, total_time, description, media_profile, category_id, genre_id) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

    public int saveMedia(MediaModel media) {
        int result = 0;

        try (Connection connection = DBconfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MEDIA_SQL)) {
            
            preparedStatement.setString(1, media.getTitle());
            preparedStatement.setString(2, media.getDirector());

            // Handling the datetime conversion
            if (media.getReleaseDate() != null && !media.getReleaseDate().isEmpty()) {
                // HTML date input returns "yyyy-MM-dd", datetime needs a timestamp
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date parsedDate = dateFormat.parse(media.getReleaseDate());
                preparedStatement.setTimestamp(3, new Timestamp(parsedDate.getTime()));
            } else {
                preparedStatement.setNull(3, java.sql.Types.TIMESTAMP);
            }

            preparedStatement.setString(4, media.getTotalTime());
            preparedStatement.setString(5, media.getDescription());
            preparedStatement.setString(6, media.getMediaProfile());
            preparedStatement.setInt(7, media.getCategoryId());
            preparedStatement.setInt(8, media.getGenreId());

            result = preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
>>>>>>> refs/remotes/origin/Shuvam
>>>>>>> branch 'Shirbhooshan' of https://github.com/Shirbhooshan/SerieMeter.git
