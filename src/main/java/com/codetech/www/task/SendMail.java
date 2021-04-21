package com.codetech.www.task;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.codetech.www.domain.MailVO;

@Component
public class SendMail {
	private static final Logger logger = LoggerFactory.getLogger(SendMail.class);

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Value("${sendFile}")
	private String sendfile;

	public void sendMail(MailVO vo) {
		MimeMessagePreparator mp = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 두번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미입니다.
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());

				// 1.문자로만 전송하는 경우
				// 두번째 인자는 html을 사용하겠다는 뜻입니다.
				// helper.setText(vo.getContent(), true);

				// 2. 이미지를 내장해서 보내는 경우
				// cid(content id)
				String content = "<img src='cid:Home'> " + vo.getContent();
				helper.setText(content, true);

				FileSystemResource file = new FileSystemResource(new File(sendfile));
				// addInline 메서드의 첫번째 메서드에는 cid(content id)를 지정합니다.
				helper.addInline("Home", file);

				// 3.파일을 첨부해서 보내는 경우
				// 첫번째 인자 : 첨부될 파일의 이름입니다.
				// 두번째 인자 : 첨부 파일
				helper.addAttachment("딸기.jpg", file);
			}
		};

		mailSender.send(mp); // 메일 전송
		logger.info("메일 전송했습니다");

	}
}
