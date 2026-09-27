package com.colegio.mvc.service.impl;

import com.colegio.mvc.service.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * Implementacion del envio de correo (requisito: "al registrarse un docente
 * en el sistema se debe enviar un correo de bienvenida a su correo personal").
 * Usa JavaMailSender, autoconfigurado por Spring Boot a partir de las
 * propiedades spring.mail.* de application.properties.
 *
 * Si las credenciales SMTP no son validas o no hay conexion, captura la excepcion
 * y loguea una advertencia para evitar interrumpir el registro del docente.
 */
@Service
public class EmailServiceImpl implements EmailService {

    private static final Logger log = LoggerFactory.getLogger(EmailServiceImpl.class);

    private final JavaMailSender mailSender;

    public EmailServiceImpl(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Override
    public void enviarCorreoBienvenida(String destinatario, String nombreCompleto) {
        SimpleMailMessage mensaje = new SimpleMailMessage();
        mensaje.setTo(destinatario);
        mensaje.setSubject("Bienvenido/a al sistema del colegio");
        mensaje.setText("Hola " + nombreCompleto + ",\n\n"
                + "Tu cuenta de docente fue creada exitosamente. "
                + "Ya podes ingresar al sistema con tu correo (" + destinatario + ") y la contrasena que elegiste.\n\n"
                + "Saludos,\nSistema de Gestion Escolar");
        try {
            mailSender.send(mensaje);
            log.info("Correo de bienvenida enviado exitosamente a {}", destinatario);
        } catch (MailException ex) {
            log.warn("No se pudo enviar el correo de bienvenida a {} (verifique las credenciales SMTP en application.properties): {}",
                    destinatario, ex.getMessage());
        } catch (Exception ex) {
            log.error("Error inesperado al intentar enviar el correo a {}: {}", destinatario, ex.getMessage(), ex);
        }
    }
}
