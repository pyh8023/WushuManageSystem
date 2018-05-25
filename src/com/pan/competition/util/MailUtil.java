package com.pan.competition.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.pan.competition.config.Constant;
import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil implements Runnable {
    private String email;// 收件人邮箱
    private String code;// 激活码
 
    public MailUtil(String email, String code) {
        this.email = email;
        this.code = code;
    }
 
    public void run() {
        // 1.创建连接对象javax.mail.Session
        // 2.创建邮件对象 javax.mail.Message
        // 3.发送一封激活邮件
        Properties properties = System.getProperties();// 获取系统属性
 
        properties.setProperty("mail.smtp.host", Constant.EMAIL_HOST);// 设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");// 打开认证
 
        try {
            //QQ邮箱需要下面这段代码，163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);
 
 
            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(Constant.SEND_EMAIL, Constant.EMAIL_CODE); // 发件人邮箱账号、授权码
                }
            });
 
            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress(Constant.SEND_EMAIL));
            // 2.2设置接收人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3设置邮件主题
            message.setSubject("账号激活");
            // 2.4设置邮件内容
            String content = "<html><head></head><body><p>您正在进行武术赛事成绩处理系统的激活,激活请点击以下链接</p><h3><a href='http://localhost:8080/WushuManageSystem/servlet/ActiveServlet?code="
                    + code + "'>激活</a></h3></body></html>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.发送邮件
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
