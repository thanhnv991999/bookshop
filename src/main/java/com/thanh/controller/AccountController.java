package com.thanh.controller;

import com.thanh.DTO.CustomerDTO;
import com.thanh.bean.MailInfo;
import com.thanh.convert.CustomerConvert;
import com.thanh.entity.Customer;
import com.thanh.entity.Role;
import com.thanh.services.CookieService;
import com.thanh.services.CustomerImpl;
import com.thanh.services.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
public class AccountController {
    @Autowired
    CustomerImpl customer;
    @Autowired
    HttpSession session;
    @Autowired
    CookieService cookie;
    @Autowired
    MailService mail;
    @Autowired
    HttpServletRequest request;
    @GetMapping("/account/login")
    public String login(HttpServletRequest request, Model model){
        Cookie readCookieU =cookie.read("userId",request);
        Cookie readCookieP =cookie.read("password",request);
        if(readCookieU!=null){
            String readCookieUser = readCookieU.getValue();
            String readCookiePass = readCookieP.getValue();
            model.addAttribute("readCookieUser",readCookieUser);
            model.addAttribute("readCookiePass",readCookiePass);
        }
        return "/account/login";
    }

    @PostMapping("/account/login")
    public String login(Model model,
                        @RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam(value = "remember",defaultValue ="false") boolean remember,
                        HttpServletResponse response){
        Customer customerId = customer.findByUserPass(username,password);
        if(customerId==null){
            model.addAttribute("errol","Đăng nhập thất bại!");
        }else if(!customerId.getActivated()){
            model.addAttribute("mess","Tài Khoản chưa được kích hoạt!");
        }else {
            session.setAttribute("user",customerId);
            //ghi nhớ tài khoản
            if(remember==true){
                cookie.create("userId",customerId.getUserName(),30,response);
                cookie.create("password",customerId.getPassWord(),30,response);
            }
            else {
                cookie.delete("userId",response);
                cookie.delete("password",response);
            }
            return "/home/layout";
        }
        return "/account/login";
    }

    @RequestMapping("/account/logout")
    public String logout(Model model){
        session.removeAttribute("user");
        return "redirect:/home/index";
    }

    @GetMapping("/account/register")
    public String register(Model model){
        Customer customerDTO = new Customer();
        model.addAttribute("form",customerDTO);
        return "/account/register";
    }

    @GetMapping("/account/active/{id}")
    public String register(Model model,@PathVariable("id") int id){
        Optional<Customer> activeCustomer= customer.findById(id);
        activeCustomer.get().setActivated(true);
        Customer cus=CustomerConvert.customerConvert(activeCustomer);
        customer.update(cus);
        return "redirect:/account/login";
    }

    @PostMapping("/account/register")
    public String register(Model model,@ModelAttribute("form") Customer customerDTO) throws MessagingException {
        Role role = new Role();
        role.setRole_ID(2);
        customerDTO.setActivated(false);
        customerDTO.setRole(role);
        customer.create(customerDTO);
        model.addAttribute("mess","Success");
        String from="bookshop@shopbook.com";
        String to = customerDTO.getEmail();
        String subject="REGISTER ACCOUNT";
        Customer customerActive=customer.findByUserPass(customerDTO.getUserName(),customerDTO.getPassWord());
        //
        String url=request.getRequestURL().toString().replace("register","active/"+customerActive.getId());
        String body="click để đăng kí <a href='"+url+"'>Xác nhận</a> ";
        MailInfo mailInfo = new MailInfo(from,to,subject,body);
        mail.send(mailInfo);
        return "/account/register";
    }

    @GetMapping("/account/forget")
    public String forget(){
        return "/account/forget";
    }
    @PostMapping("/account/forget")
    public String forget(Model model,@RequestParam("username") String username,
                        @RequestParam("email") String email) throws MessagingException {
        Customer cus=customer.findByUsername(username);
        if(cus==null){
            model.addAttribute("mess","Username không tồn tại");
        }
        else if(!cus.getEmail().equals(email)){
            model.addAttribute("mess","Sai địa chỉ mail");
        }
        else {
            String from="bookshop@shopbook.com";
            String to = cus.getEmail();
            String subject="Quên mật khẩu";
            String body=" Thông tin mật khẩu : "+cus.getPassWord()+" ";
            MailInfo mailInfo = new MailInfo(from,to,subject,body);
            mail.send(mailInfo);
            model.addAttribute("mess","Gửi thành công .Kiểm tra hộp thư");
        }

        return "/account/login";
    }

    @GetMapping("/account/edit")
    public String edit(Model model){
        Customer cus= (Customer) session.getAttribute("user");
        model.addAttribute("form",cus);
        return "/account/edit";

    }

    @PostMapping("/account/edit")
    public String edit(@ModelAttribute("form") Customer cus,Model model){
        customer.update(cus);
        session.setAttribute("user",cus);
        model.addAttribute("mess","Cập nhật thành công");
        return "/account/edit";
    }

    @GetMapping("/account/change")
    public String change(Model model){
        Customer cus = (Customer) session.getAttribute("user");
        CustomerDTO CusDTO = new CustomerDTO();
        model.addAttribute("CusDTO",CusDTO);
        model.addAttribute("user",cus);
        return "/account/change";
    }
    @PostMapping("/account/change")
    public String change(@ModelAttribute("CusDTO") CustomerDTO customerDTO, Model model){
        Optional<Customer> cus = customer.findById(customerDTO.getId());
        Customer cusConver=CustomerConvert.customerConvert(cus);
        if(cusConver.getPassWord().equals(customerDTO.getPassOld())){
            cusConver.setPassWord(customerDTO.getPassNew());
            customer.create(cusConver);
            model.addAttribute("mess","Đổi mật khẩu thành công");
        }else {
            model.addAttribute("errol","Sai mật khẩu!");
        }
        return "/account/change";
    }
}
