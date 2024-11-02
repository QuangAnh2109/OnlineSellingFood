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
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.logging.Logger;

public class ImgFile {
    private static final Logger logger = Logger.getLogger(ImgFile.class.getName());
    // Thư mục lưu file
    private static final String IMG_FOLDER = "G:/Project/SwpImgDriver/Img/";
    private static final String FOLDER = "G:/Project/SwpImgDriver/";

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
            String[] fileNameFull = fileName.split("\\.");
            try {
                String fileNameLast = Encrypt.toHexString(Encrypt.getSHA(fileNameFull[0]+name+ LocalDateTime.now()))+"."+fileNameFull[fileNameFull.length-1];
                String filePath = IMG_FOLDER + fileNameLast;
                Path path = Paths.get(filePath);
                if (!Files.exists(path)) {
                    try (FileOutputStream fos = new FileOutputStream(filePath)) {
                        fos.write(imageBytes);
                        logger.info("New file saved at: " + filePath);

                        try{
                            Thread.sleep(1000);
                        }catch(InterruptedException e){

                        }
                        autoCommit(5000);
                        return new ImgDAO().addImg(new Img(fileNameLast));
                    }
                }
            } catch (NoSuchAlgorithmException e) {
                logger.info(e.getMessage());
            }
        }
        return null;
    }

    public static boolean deleteImg(String filePath){
        try {
            Files.delete(Paths.get(IMG_FOLDER+filePath));
            autoCommit(0);
            return true;
        } catch (IOException e) {
            logger.info("Can not delete file at path: " + filePath);
            return false;
        }
    }

    public static boolean autoCommit(int waitTime){
        Runtime runtime = Runtime.getRuntime();
        try {
            runtime.exec("cmd /c start "+FOLDER+"commit-push.bat");
            Thread.sleep(waitTime);
            return true;
        } catch(IOException | InterruptedException e) {
            logger.info(e.getMessage());
        }
        return false;
    }
}