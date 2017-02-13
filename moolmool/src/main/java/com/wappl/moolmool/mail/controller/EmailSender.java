package com.wappl.moolmool.mail.controller;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.wappl.moolmool.mail.vo.MailVO;

@Component
public class EmailSender  {
     
    @Autowired
    protected JavaMailSender  mailSender;
 
    public void SendEmail(MailVO vo) throws Exception {
         
        MimeMessage msg = mailSender.createMimeMessage();
        System.out.println(msg);
        msg.setSubject(vo.getSubject());
        msg.setText(vo.getContent());
        msg.setRecipient(RecipientType.TO , new InternetAddress(vo.getReciver()));
         
        mailSender.send(msg); 
    }
}
