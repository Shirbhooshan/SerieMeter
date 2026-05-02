package com.seriemeter.service;

import java.util.List;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;

public class MediaService {

    private MediaDAO mediaDAO = new MediaDAO();

    public boolean publishMedia(MediaModel media) {
        if (media.getTitle() == null || media.getTitle().trim().isEmpty()) {
            return false;
        }
        int result = mediaDAO.saveMedia(media);
        return result > 0;
    }

    public List<MediaModel> getAllMedia() {
        return mediaDAO.getAllMedia();
    }

    public boolean deleteMedia(int mediaId) {
        return mediaDAO.deleteMedia(mediaId);
    }
}