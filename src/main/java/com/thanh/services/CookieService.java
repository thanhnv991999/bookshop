package com.thanh.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Base64;


@Service
public class CookieService {

    public Cookie create(String name ,String value ,int days,HttpServletResponse response){
        String encodeValue = Base64.getEncoder().encodeToString(value.getBytes());
        Cookie cookie = new Cookie(name,encodeValue);
        cookie.setMaxAge(days*24*60*60);
        cookie.setPath("/");
        response.addCookie(cookie);
        return cookie;
    }

    public Cookie read(String name, HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie:cookies){
            if(cookie.getName().equalsIgnoreCase(name)){
            String decodeValue=new String(Base64.getDecoder().decode(cookie.getValue()));
            cookie.setValue(decodeValue);
            return cookie;
            }
        }
        return null;
    }
    public void delete(String name,HttpServletResponse response){
        this.create(name,"",0,response);
    }

}
