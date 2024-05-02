package org.fullstack4.springmvc.common;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

@Log4j2
public class FileUtil {
    public static String createFile(MultipartFile file) {
        String uploadFolder = null;
        try {
            uploadFolder = "D:\\java4\\BEC\\src\\main\\webapp\\resources\\uploads\\img\\member";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        String orgFile = file.getOriginalFilename(); //원래 파일의 이름
        long size = file.getSize();
        String fileExt = orgFile.substring(orgFile.lastIndexOf("."), orgFile.length()); // 확장자명
        //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

        log.info("============================");
        log.info("uploadFolder : " + uploadFolder);
        log.info("fileRealName : " + orgFile);
        log.info("size : " + size);
        log.info("fileExt : " + fileExt);


        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        log.info("uuid : " + uuid);
        log.info("uuids : " + uuids);
        log.info("newName : " + newName);

        String saveFileName = newName + fileExt;

        File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

        try {
            file.transferTo(saveFile);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return saveFileName;
    }

    public static void deleteFile(String saveFileName) {
        try{
            String uploadFolder = "D:\\java4\\BEC\\src\\main\\webapp\\resources\\uploads\\img\\member";

            File file = new File(uploadFolder + "\\" + saveFileName);
            file.delete();


        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static String dataCreateFile(MultipartFile file) {
        String uploadFolder = "D:\\java4\\BEC\\src\\main\\webapp\\resources\\uploads\\data";
        String saveFileName = "";
        if(file != null  ||  file.getOriginalFilename() != null ||  !file.getOriginalFilename().isEmpty()) {
            String orgFile = file.getOriginalFilename(); //원래 파일의 이름
            long size = file.getSize();
            String fileExt = orgFile.substring(orgFile.lastIndexOf("."), orgFile.length()); // 확장자명
            //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

            log.info("============================");
            log.info("uploadFolder : " + uploadFolder);
            log.info("fileRealName : " + orgFile);
            log.info("size : " + size);
            log.info("fileExt : " + fileExt);


            //새로운 파일명 생성
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];

            log.info("uuid : " + uuid);
            log.info("uuids : " + uuids);
            log.info("newName : " + newName);

            saveFileName = newName + fileExt;

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

            try {
                file.transferTo(saveFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }


        return saveFileName;
    }

    public static void dataDeleteFile(String saveFileName) {
        try{
            String uploadFolder = "D:\\java4\\BEC\\src\\main\\webapp\\resources\\uploads\\data";

            File file = new File(uploadFolder + "\\" + saveFileName);
            file.delete();


        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
