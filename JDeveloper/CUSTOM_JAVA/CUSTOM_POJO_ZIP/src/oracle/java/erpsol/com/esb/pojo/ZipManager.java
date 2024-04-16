package oracle.java.erpsol.com.esb.pojo;

import com.erpsol.xmlns.core.esb.custom.zipManager.v1.AttachmentsDocument;
import com.erpsol.xmlns.core.esb.custom.zipManager.v1.AttachmentsDocument.Attachments;
import com.erpsol.xmlns.core.esb.custom.zipManager.v1.AttachmentsDocument.Attachments.Attachment;
import com.erpsol.xmlns.core.esb.custom.zipManager.v1.AttachmentsDocument.Attachments.Errors;
import com.erpsol.xmlns.core.esb.custom.zipManager.v1.AttachmentsDocument.Attachments.Errors.AttachmentError;

import com.github.junrar.Archive;
import com.github.junrar.exception.RarException;
import com.github.junrar.rarfile.FileHeader;

import com.github.junrar.volume.FileVolume;
import com.github.junrar.volume.FileVolumeManager;
import com.github.junrar.volume.InputStreamVolumeManager;
import com.github.junrar.volume.VolumeManager;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.nio.charset.Charset;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.xmlbeans.XmlException;

//esta clase se encarga de descomprimir uno o mas  de .zip o .rar
//o
//comprimir uno o mas documentos
public class ZipManager {
    //esta metodo descomprime uno o mas archivos zip o rar
    public String UnZipFiles(String listZips) {
        AttachmentsDocument pojoZipMRequest;
        //lista principals
        List<Attachment> listAttachments = new ArrayList<Attachment>();

        AttachmentsDocument pojoZipMResponse = AttachmentsDocument.Factory.newInstance();
        pojoZipMResponse.setAttachments(Attachments.Factory.newInstance());
        Attachments attachmentsResponse = pojoZipMResponse.getAttachments();
        pojoZipMResponse.getAttachments().setErrors(Errors.Factory.newInstance());
        Errors errors = attachmentsResponse.getErrors();

        try {
            pojoZipMRequest = AttachmentsDocument.Factory.parse(listZips);
            listAttachments.addAll(Arrays.asList(pojoZipMRequest.getAttachments()
                                                 .getAttachmentArray())); //lo volvemos una lista

            //clasificamos los que son rar, zip y todos los demas
            for (Attachment attachment : listAttachments) {
                String name = attachment.getFileName();
                if (name.toUpperCase().endsWith("ZIP")) {
                    UnZip(attachment, attachmentsResponse);
                } else if (name.toUpperCase().endsWith("RAR")) {
                    UnRar(attachment, attachmentsResponse);
                }
                //archivos que no se cdescomprimen
                else {
                    Attachment zipAttachment = attachmentsResponse.addNewAttachment();
                    zipAttachment.setFileName(attachment.getFileName());
                    zipAttachment.setAttachmentContent(attachment.getAttachmentContent());
                    zipAttachment.setAttachmentType(attachment.getAttachmentType());
                }
            }


        } catch (XmlException  e) {
            errors.addNewAttachmentError().setStatus("Error Format");
            errors.addNewAttachmentError().setFileName("All Files");
            errors.addNewAttachmentError().setDetails(e.getError().getMessage());
            return pojoZipMResponse.xmlText();
        } //objetos de entrada

        return pojoZipMResponse.xmlText();
    }

    //esta funcion recibe un uno o mas de archivos y crea un zip
    public String Zip(String arrayDocs) {
        String ZipString = "";
        AttachmentsDocument pojoZipMRequest;
        //lista principal
        List<Attachment> listAttachments = new ArrayList<Attachment>();
        AttachmentsDocument pojoZipMResponse = AttachmentsDocument.Factory.newInstance();
        try {
            pojoZipMRequest = AttachmentsDocument.Factory.parse(arrayDocs); //objetos de entrada
            listAttachments.addAll(Arrays.asList(pojoZipMRequest.getAttachments()
                                                 .getAttachmentArray())); //lo volvemos una lista

            //genera zip apartir de arreglo

            byte[] docBinary = null;
            ByteArrayOutputStream ZipBos = new ByteArrayOutputStream();
            ZipOutputStream zip = new ZipOutputStream(ZipBos);

            for (Attachment attachment : listAttachments) {
                ZipEntry zipEntryPDF = new ZipEntry(attachment.getFileName());
                zipEntryPDF.setSize(attachment.getAttachmentContent().length);
                zip.putNextEntry(zipEntryPDF);
                zip.write(attachment.getAttachmentContent());
            }

            zip.close();
            docBinary = ZipBos.toByteArray();
            ZipBos.close();


            pojoZipMResponse.setAttachments(Attachments.Factory.newInstance());
            Attachment zipAttachment = pojoZipMResponse.getAttachments().addNewAttachment();
            zipAttachment.setFileName("File.zip");
            zipAttachment.setAttachmentContent(docBinary);
            zipAttachment.setAttachmentType("application/octet-stream");


            ZipString = pojoZipMResponse.xmlText();
        } catch (XmlException | IOException e) {

        }


        return ZipString;
    }

    //metodo que descomprime archivos rar
    public void UnRar(Attachment attachment, Attachments attachmentsResponse) {

        try {
            InputStream stream = new ByteArrayInputStream(attachment.getAttachmentContent());
            // Archive a = new Archive(new File("resources\\resources.rar"));
            Archive a = new Archive(stream);

            if (!a.isPasswordProtected()) {
                List<FileHeader> listHeader = a.getFileHeaders();

                for (FileHeader header : listHeader) {
                    if (!header.isDirectory()) {
                        Attachment zipAttachment = attachmentsResponse.addNewAttachment();
                        zipAttachment.setFileName(header.getFileName());
                        zipAttachment.setAttachmentContent(IOUtils.toByteArray(a.getInputStream(header)));
                        zipAttachment.setAttachmentType("application/octet-stream");

                    }
                    //Error de zip con directorios
                    else {
                        //los omitimos
                        // System.out.println("Rar file contains directories: "+header.getFileName());

                        /*
                        AttachmentError error = attachmentsResponse.getErrors().addNewAttachmentError();
                        error.setStatus("Error Rar");
                        error.setFileName(attachment.getFileName());
                        error.setDetails("Rar file contains directories");
*/
                    }
                    a.nextFileHeader();
                }

            }
            //Error de zip con contrasenia
            else {
                AttachmentError error = attachmentsResponse.getErrors().addNewAttachmentError();
                error.setStatus("Error Rar");
                error.setFileName(attachment.getFileName());
                error.setDetails("Rar file contains password");

            }
        } catch (Exception e) {
            AttachmentError error = attachmentsResponse.getErrors().addNewAttachmentError();
            error.setStatus(e.toString());
            error.setFileName(attachment.getFileName());
            error.setDetails(e.getMessage());
        }

    }

    //esta funcion recibe un zip y retorna arreglo de documentos
    public void UnZip(Attachment attachment, Attachments attachmentsResponse) {
        Charset CP866 = Charset.forName("CP866");
        byte[] buffer = new byte[2048];

        try {

            InputStream stream = new ByteArrayInputStream(attachment.getAttachmentContent());
           // ZipInputStream zis = new ZipInputStream(stream);
            ZipInputStream zis = new ZipInputStream(stream,CP866);

            // ZipInputStream zis = new ZipInputStream(new FileInputStream("resources\\resources.zip"));

            // ze;
            ZipEntry ze = zis.getNextEntry();

            while (ze != null) {
                if (!ze.isDirectory()) {
                    ByteArrayOutputStream ZipBos = new ByteArrayOutputStream();
                    String nombreArchivo = ze.getName();
                    int len;
                    while ((len = zis.read(buffer)) > 0) {
                        ZipBos.write(buffer, 0, len);
                    }


                    Attachment zipAttachment = attachmentsResponse.addNewAttachment();
                    zipAttachment.setFileName(nombreArchivo);
                    zipAttachment.setAttachmentContent(ZipBos.toByteArray());

                    zipAttachment.setAttachmentType("application/octet-stream");

                }
                //cuando es un directorio
                else {
                    
                }
                ze = zis.getNextEntry();
            }
            zis.closeEntry();
            zis.close();

        } catch (Exception e) {
            AttachmentError error = attachmentsResponse.getErrors().addNewAttachmentError();
            error.setStatus(e.toString());
            error.setFileName(attachment.getFileName());
            error.setDetails(e.getMessage());
        }
    }

}
