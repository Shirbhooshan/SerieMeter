package com.seriemeter.utils;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/* class for handling poster image uploads.
 */
public class Fileuploadutil {

    /*
     * getFileExtension() extracts the file extension from a filename.
     */
    public static String getFileExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) {
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }

    /* isImage() hecks if the uploaded file is actually an image.
     */
    public static boolean isImage(Part part) {
        String contentType = part.getContentType();
        return contentType != null && contentType.startsWith("image/");
    }

    /*saveFile() saves the uploaded file to the specified folder on disk.
     * it creates the folder if it doesn't exist yet.
     * and overwrites the file if one with the same name already exists.
     * part      — the uploaded file from the form
     * uploadDir — full path to the folder to save in
     * fileName  — what to name the saved file e.g. "interstellar.jpg"
     */
    public static void saveFile(Part part, String uploadDir, String fileName) throws IOException {

        // Converts the folder path string to a Path object
        Path uploadPath = Paths.get(uploadDir);

        // Creates the folder if it doesn't already exist
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Builds the full file path: folder + filename
        Path filePath = uploadPath.resolve(fileName);

        // Readsfrom the uploaded file and write it to disk
        // try-with-resources closes the stream automatically
        try (InputStream inputStream = part.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
    }
}