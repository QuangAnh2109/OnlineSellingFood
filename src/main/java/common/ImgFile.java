package common;

import dal.ImgDAO;
import jakarta.servlet.http.Part;
import model.Img;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Logger;

public class ImgFile {
    private static final Logger logger = Logger.getLogger(ImgFile.class.getName());
    // Thư mục lưu file
    private static final String IMG_FOLDER = "G:/Project/SwpImgDriver/Img";

    private static String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return null;
    }

    public static Integer importImg(Part filePart, String name) throws IOException {
        String fileName = getFileName(filePart);
        if (fileName != null && !fileName.isEmpty()) {
            InputStream fileContent = filePart.getInputStream();
            byte[] imageBytes = fileContent.readAllBytes();
            File uploadDir = new File(IMG_FOLDER);
            if (!uploadDir.exists()) {
                boolean dirCreated = uploadDir.mkdir();
                logger.info("Img folder created: " + dirCreated);
            }

            String filePath = IMG_FOLDER + "/" + name+fileName;
            Path path = Paths.get(filePath);
            if (!Files.exists(path)) {
                try (FileOutputStream fos = new FileOutputStream(filePath)) {
                    fos.write(imageBytes);
                    logger.info("New file saved at: " + filePath);
                    autoCommit();
                    return new ImgDAO().addImg(new Img(name+fileName));
                }
            }
        }
        return null;
    }

    public static boolean deleteImg(String filePath){
        try {
            Files.delete(Paths.get(filePath));
            autoCommit();
            return true;
        } catch (IOException e) {
            logger.info("Can not delete file at path: " + filePath);
            return false;
        }
    }

    public static boolean autoCommit(){
        try{
            Process p = Runtime.getRuntime().exec("G:/commit-push.bat");
            p.waitFor();
            return true;
        }catch( IOException | InterruptedException ex){
            logger.info(ex.getClass()+": "+ex.getMessage());
            return false;
        }
    }
}
