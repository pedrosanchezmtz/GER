package mx.com.estrellaroja.cloud.utilities;


import java.util.Base64;
import mx.com.estrellaroja.cloud.utilities.impl.SOAUtilitiesImpl;
import mx.com.estrellaroja.cloud.utilities.impl.types.AttachmentType;
import mx.com.estrellaroja.cloud.utilities.impl.types.DecompressFileRqType;
import mx.com.estrellaroja.cloud.utilities.impl.types.DecompressFileRsType;


public class TestDescoprimir {
    public TestDescoprimir() {
        super();
    }

    public static void main(String[] args) {

    
        SOAUtilitiesImpl testDescoprimir = new SOAUtilitiesImpl();
        DecompressFileRqType decompressFileRq = new DecompressFileRqType();
        DecompressFileRsType decompressFileRs = new DecompressFileRsType();
        AttachmentType zipAttachment = new AttachmentType();
        
        System.out.println("-----------Prueba RAR5 con error");
        zipAttachment.setFileName("Documentos.rar");
        zipAttachment.setAttachmentContent(Base64.getDecoder()
                                .decode("UEsDBBQAAAAIACJbZ1G1GgAxgAEAAAQGAAAKAAAAemlwMS0yLnhzZK2UTU/CMBjH7yZ+h6Z3V1BjjNkgKnISPeDBaykPo8nWjvYpAz+93eRlyMsQ6WHZun9/z9s/DduzNCFTMFZqFdFm0KAElNBDqeKIOhxd3dN26/IitGIMKSderWxEx4jZA2N5ngf5TaBNzK4bjSb77L32S52HJJCCwq42aQdG3CUY0YnjiRxJGFLCEY0cOIQNgVMVCXITA77xFGzGBayClikEYDKrk0DolAltgIEdMOEs+u8vmfW44jEYNm0y6rMnfoWLjIjyxIg+InIxLjbsUlGqPDBLYPYxz6CyXf6yMHG+N7/3D8IpISmfvQvhjC3qG2inhr661vLkNmsN3Z/LMStc9Xgrq4LoG+yfEbVepGLKzhvhWSssy/8JMuAW7m6fpOJmfp5QXZlA4Y0/lRGywy0N2WKO9SN+MUabDetsiI8b3SFLHYhdtddud9U3+ARzbc2gjxydPdFIW7QOIJeJ/ZdlzmOTBavGLJva/cZZa2qmfao7d4J3waoAf6i8qf3rN1BLAwQUAAAACAAiW2dRtRoAMYABAAAEBgAACgAAAHppcDEtMS54c2StlE1PwjAYx+8mfoemd1dQY4zZICpyEj3gwWspD6PJ1o72KQM/vd3kZcjLEOlh2bp/f8/bPw3bszQhUzBWahXRZtCgBJTQQ6niiDocXd3TduvyIrRiDCknXq1sRMeI2QNjeZ4H+U2gTcyuG40m++y99kudhySQgsKuNmkHRtwlGNGJ44kcSRhSwhGNHDiEDYFTFQlyEwO+8RRsxgWsgpYpBGAyq5NA6JQJbYCBHTDhLPrvL5n1uOIxGDZtMuqzJ36Fi4yI8sSIPiJyMS427FJRqjwwS2D2Mc+gsl3+sjBxvje/9w/CKSEpn70L4Ywt6htop4a+utby5DZrDd2fyzErXPV4K6uC6BvsnxG1XqRiys4b4VkrLMv/CTLgFu5un6TiZn6eUF2ZQOGNP5URssMtDdlijvUjfjFGmw3rbIiPG90hSx2IXbXXbnfVN/gEc23NoI8cnT3RSFu0DiCXif2XZc5jkwWrxiyb2v3GWWtqpn2qO3eCd8GqAH+ovKn96zdQSwECHwAUAAAACAAiW2dRtRoAMYABAAAEBgAACgAkAAAAAAABACAAAAAAAAAAemlwMS0yLnhzZAoAIAAAAAAAAQAYABD8LO4qtdYBLO42Azi11gHt3jYDOLXWAVBLAQIfABQAAAAIACJbZ1G1GgAxgAEAAAQGAAAKACQAAAAAAAEAIAAAAKgBAAB6aXAxLTEueHNkCgAgAAAAAAABABgAEPws7iq11gFTCS0GOLXWAVMJLQY4tdYBUEsFBgAAAAACAAIAuAAAAFADAAAAAA=="));
        zipAttachment.setAttachmentType("application/octet-stream");
        decompressFileRq.getAttachments().add(zipAttachment);
        /*
        System.out.println("-----------Prueba ZIP sin error");

        zipAttachment.setFileName("Documentos.zip");
        zipAttachment.setAttachmentContent(Base64.getDecoder()
                                .decode("UEsDBBQAAAAIACJbZ1G1GgAxgAEAAAQGAAAKAAAAemlwMi0yLnhzZK2UTU/CMBjH7yZ+h6Z3V1BjjNkgKnISPeDBaykPo8nWjvYpAz+93eRlyMsQ6WHZun9/z9s/DduzNCFTMFZqFdFm0KAElNBDqeKIOhxd3dN26/IitGIMKSderWxEx4jZA2N5ngf5TaBNzK4bjSb77L32S52HJJCCwq42aQdG3CUY0YnjiRxJGFLCEY0cOIQNgVMVCXITA77xFGzGBayClikEYDKrk0DolAltgIEdMOEs+u8vmfW44jEYNm0y6rMnfoWLjIjyxIg+InIxLjbsUlGqPDBLYPYxz6CyXf6yMHG+N7/3D8IpISmfvQvhjC3qG2inhr661vLkNmsN3Z/LMStc9Xgrq4LoG+yfEbVepGLKzhvhWSssy/8JMuAW7m6fpOJmfp5QXZlA4Y0/lRGywy0N2WKO9SN+MUabDetsiI8b3SFLHYhdtddud9U3+ARzbc2gjxydPdFIW7QOIJeJ/ZdlzmOTBavGLJva/cZZa2qmfao7d4J3waoAf6i8qf3rN1BLAwQUAAAACAAiW2dRtRoAMYABAAAEBgAACgAAAHppcDItMS54c2StlE1PwjAYx+8mfoemd1dQY4zZICpyEj3gwWspD6PJ1o72KQM/vd3kZcjLEOlh2bp/f8/bPw3bszQhUzBWahXRZtCgBJTQQ6niiDocXd3TduvyIrRiDCknXq1sRMeI2QNjeZ4H+U2gTcyuG40m++y99kudhySQgsKuNmkHRtwlGNGJ44kcSRhSwhGNHDiEDYFTFQlyEwO+8RRsxgWsgpYpBGAyq5NA6JQJbYCBHTDhLPrvL5n1uOIxGDZtMuqzJ36Fi4yI8sSIPiJyMS427FJRqjwwS2D2Mc+gsl3+sjBxvje/9w/CKSEpn70L4Ywt6htop4a+utby5DZrDd2fyzErXPV4K6uC6BvsnxG1XqRiys4b4VkrLMv/CTLgFu5un6TiZn6eUF2ZQOGNP5URssMtDdlijvUjfjFGmw3rbIiPG90hSx2IXbXXbnfVN/gEc23NoI8cnT3RSFu0DiCXif2XZc5jkwWrxiyb2v3GWWtqpn2qO3eCd8GqAH+ovKn96zdQSwECHwAUAAAACAAiW2dRtRoAMYABAAAEBgAACgAkAAAAAAABACAAAAAAAAAAemlwMi0yLnhzZAoAIAAAAAAAAQAYABD8LO4qtdYBtSjFOzi11gG1KMU7OLXWAVBLAQIfABQAAAAIACJbZ1G1GgAxgAEAAAQGAAAKACQAAAAAAAEAIAAAAKgBAAB6aXAyLTEueHNkCgAgAAAAAAABABgAEPws7iq11gHlnsU7OLXWAeWexTs4tdYBUEsFBgAAAAACAAIAuAAAAFADAAAAAA=="));
        zipAttachment.setAttachmentType("application/octet-stream");
        decompressFileRq.getAttachments().add(zipAttachment);
        
        System.out.println("-----------Prueba RAR sin error-----------");
        zipAttachment.setFileName("Documentos.rar");
        zipAttachment.setAttachmentContent(Base64.getDecoder()
                                .decode("UmFyIRoHAM+QcwAADQAAAAAAAAC8E3QggC8ALAAAACwAAAACvVk2sgQ4K1YdMA8AIAAAAEluZiAtIGNvcGlhLnR4dEFyY2hpdm8gZGUgZ2VuZXJhY2lvbiBhdXRvbWF0aWNhIGRlIGNhcnBldGFzllB0IIAnACwAAAAsAAAAAr1ZNrIEOCtWHTAHACAAAABJbmYudHh0QXJjaGl2byBkZSBnZW5lcmFjaW9uIGF1dG9tYXRpY2EgZGUgY2FycGV0YXNsJnQgkC4AiAAAAI4AAAACQI3mm/1hilgdMwkAIAAAAHJ1ZnVzLmluaQDwa3t2CVVUyP4RM9C6HdA0GRX63BcSOCghcFEuaEfhYWskL+Ft344HCyIRcTpD3fHNSdxd6dyc5o+1iUexk6SCXKzvx4Vswwr8in0E8dDAcKTnNU+Lm3ocO0uq8x8+wtHlUDSyvzwpd7PxXE97P7cihWkezXKYsthpNoGHOCLUE7ces5pqNIpwoCJYoMQ9ewBABwA="));
        zipAttachment.setAttachmentType("application/octet-stream");
        decompressFileRq.getAttachments().add(zipAttachment);
        */
        decompressFileRs=testDescoprimir.DecompressFile(decompressFileRq);
        
                
        for (AttachmentType attachment : decompressFileRs.getReturn() ){
            System.out.println("nombre : " +attachment.getFileName());
            System.out.println("tipo : " +attachment.getAttachmentType());
            System.out.println("bytes : " +attachment.getAttachmentContent());
            
        }
        for (mx.com.estrellaroja.cloud.utilities.impl.types.ErrorType error : decompressFileRs.getErrors().getError() ){
            System.out.println("getBusinessProcess : " +error.getBusinessProcess());
            System.out.println("getBusinessProcess : " +error.getDescription());
            System.out.println("getBusinessProcess : " +error.getErrorCode());
            System.out.println("getBusinessProcess : " +error.getFailedService());
            System.out.println("getBusinessProcess : " +error.getShortDescription());

            
        }
       
    }
}
