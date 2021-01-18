package com.thanh.services;

import com.thanh.entity.Customer;
import com.thanh.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

public class CustomerDetailService implements UserDetailsService {
    @Autowired
    CustomerImpl customerImpl;
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Customer customer = customerImpl.findByUsername(s);
        Role role =customer.getRole();
        List<GrantedAuthority> grantedAuthorities=new ArrayList<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole_Name()));

        return new org.springframework.security.core.userdetails.User(customer.getUserName(),
                customer.getPassWord(),grantedAuthorities);
    }
}
