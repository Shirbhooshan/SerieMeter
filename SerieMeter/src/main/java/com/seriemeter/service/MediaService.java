package com.seriemeter.service;

import com.seriemeter.dao.MediaDAO;
import java.util.List;
import com.seriemeter.model.MediaModel;

import java.util.List;

public class MediaService {
    
    // Instantiate the DAO to interact with the database
    private MediaDAO mediaDAO = new MediaDAO();

    /**
     * Business logic for publishing new media.
     * @param media The media object populated from the controller.
     * @return true if saved successfully, false otherwise.
     */
    public boolean publishMedia(MediaModel media) {
        // Business Logic Example: Basic validation
        if (media.getTitle() == null || media.getTitle().trim().isEmpty()) {
            return false;
        }

        // Logic: Convert result to boolean for the controller
        int result = mediaDAO.saveMedia(media);
        return result > 0;
    }
<<<<<<< HEAD
=======
    
    // You can add more methods here later, like:
    // public List<MediaModel> getAllMedia() { ... }
    // public boolean deleteMedia(int id) { ... }
    
>>>>>>> refs/remotes/origin/avin
    public List<MediaModel> getAllMedia() {
        return mediaDAO.getAllMedia();
    }

    public boolean deleteMedia(int mediaId) {
        return mediaDAO.deleteMedia(mediaId);
    }
}