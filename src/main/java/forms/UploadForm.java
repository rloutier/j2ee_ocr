package forms;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class UploadForm {
    public static final int BUFFER_SIZE = 10240;
    public static final String UPLOADS_PATH = "C:\\Users\\t070713\\Documents\\upload\\";
    
    String fileName;
    String fileDescription ;

    public void handleUpload(HttpServletRequest request) throws ServletException, IOException {
        this.fileDescription = request.getParameter("file-description");

        Part part = request.getPart("file-upload");
        String fileName = getFileName(part);

        if (fileName != null && !fileName.isEmpty()) {
            writeFile(part, fileName, UPLOADS_PATH);
            this.fileName = fileName;
        }
    }

    private static void writeFile( Part part, String fileName, String path ) throws IOException {
        BufferedInputStream input = null;
        BufferedOutputStream output = null;
        try {
            input = new BufferedInputStream(part.getInputStream(), BUFFER_SIZE);
            output = new BufferedOutputStream(new FileOutputStream(new File(path + fileName)), BUFFER_SIZE);

            byte[] buffer = new byte[BUFFER_SIZE];
            int NbBytesRead;
            while ((NbBytesRead = input.read(buffer)) > 0) {
                output.write(buffer, 0, NbBytesRead);
            }
        } finally {
            try {
                output.close();
            } catch (IOException ignore) {
            }
            try {
                input.close();
            } catch (IOException ignore) {
            }
        }
    }

    private static String getFileName( Part part ) {
        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( contentDisposition.trim().startsWith( "filename" ) ) {
                return contentDisposition
                    .substring( contentDisposition.indexOf( '=' ) + 1 )
                    .trim()
                    .replace( "\"", "" );
            }
        }
        return null;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileDescription() {
        return fileDescription;
    }

    public void setFileDescription(String fileDescription) {
        this.fileDescription = fileDescription;
    }   
}
