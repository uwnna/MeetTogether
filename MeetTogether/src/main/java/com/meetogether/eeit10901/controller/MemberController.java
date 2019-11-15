package com.meetogether.eeit10901.controller;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10927.model.Member;
import com.meetogether.eeit10936.pairs.model.VipStatus;

@Controller

public class MemberController {
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	MemberService service;

	@Autowired
	public void setService(MemberService service) {
		this.service = service;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getMemberLoginForm(Model model) {
		Member member = new Member();
		model.addAttribute("memberBean", member);
		return "index";
	}

	@RequestMapping("/members")
	public String list(Model model) {
		List<MemberBean> list = service.selectALL();
		model.addAttribute("members", list);
		return "eeit10901/getMember";
	}
	
	@RequestMapping("/getmember")
	public String getMemberById(Model model, HttpServletRequest req)	{
		Integer userId = (Integer) req.getSession().getAttribute("userId");
		model.addAttribute("member", service.getMemberById(userId));
		model.addAttribute("vipBean", new VipStatus());
		return "eeit10901/getMember";
	}

	

//	@RequestMapping(value="/register",method=RequestMethod.POST)
//	public String addRegister (@ModelAttribute("memberBean") MemberBean mm) {
////		Date test = mm.getMemberBirth();
//		 service.add(mm);
//		return "index";
//	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getaddRegister(Model model) {
		MemberBean mm = new MemberBean();
		model.addAttribute("memberBean", mm);
		return "eeit10901/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addRegister(@ModelAttribute("memberBean") MemberBean member, 
			BindingResult result, Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("errorMsg", errorMsg);
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		String captcha = (String) request.getSession().getAttribute("captcha");
		System.out.println("captcha register: " + captcha);
		System.out.println("captcha add: " + member.getmChecksum());
		boolean captCheck = false;
		captCheck = member.getmChecksum().equals(captcha);
		boolean accCheck = service.mEmailExist(member);
		if(accCheck) {
			errorMsg.put("accError", "此帳號已存在");
		}
//		if (captCheck == false) {
//			errorMsg.put("captError", "驗證碼錯誤");
//		}
		int memberId = 0;
		if (accCheck == false && captCheck == true) {
			memberId = service.add(member);
			request.getSession().setAttribute("userEmail", member.getMemberEmail());
			request.getSession().setAttribute("userPwd", member.getMemberPassword());
		} 
		MultipartFile picture = member.getMemberImage();
		String originalFilename = picture.getOriginalFilename();
		member.setFileName(originalFilename);
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		if (!errorMsg.isEmpty()) {
			return "/eeit10901/register";
		}
		
		final String Email = "109meettogether@gmail.com";// your Gmail
		final String EmailPwd = "eeit109*";// your password
		String host = "smtp.gmail.com";
		int port = 587;

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Email, EmailPwd);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(Email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getMemberEmail()));
			message.setSubject("MeetTogether驗證信");//主旨
			message.setText("請點選連結以開通帳號:"
					+ "http://localhost:8080/MeetTogether/updateVerifyMailSucess?id="+member.getMemberId());//訊息

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, Email, EmailPwd);

			Transport.send(message);
//			transport.close();
			System.out.println("寄送email結束.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		return "redirect:registerSuccess";
	}

	@RequestMapping("/registerSuccess")
	public String registerSuccess(Model model) {
		model.addAttribute("vipBean", new VipStatus());
		return "eeit10901/registerSuccess";
	}

	
	@RequestMapping(value ="/updateVerifyMailSucess" ,method=RequestMethod.GET)
	public String updateVerifyMailSucess(@RequestParam(value="id") Integer memberId, Model model) {
		service.updeatVerifyMail(memberId);
		model.addAttribute("vipBean", new VipStatus());
		return "eeit10901/verifyMailSuccess";
	}
	
	@RequestMapping("/interestPersonalInfo")
	public String InsertInterestPersonalInfo(Model model) {
		model.addAttribute("vipBean", new VipStatus());
		return "redirect:interestPersonalInfo";

	}
	
	
	 
	
}
