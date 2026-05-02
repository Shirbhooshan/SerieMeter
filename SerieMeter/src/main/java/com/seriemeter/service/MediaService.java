package com.seriemeter.service;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;

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
    
    // You can add more methods here later, like:
    // public List<MediaModel> getAllMedia() { ... }
    // public boolean deleteMedia(int id) { ... }
}