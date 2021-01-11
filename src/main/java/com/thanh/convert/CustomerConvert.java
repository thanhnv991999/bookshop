package com.thanh.convert;


import com.thanh.entity.Customer;

import java.util.Optional;

public class CustomerConvert {
    public static Customer customerConvert(Optional<Customer> optional){
        Customer customer = new Customer();
        customer.setId(optional.get().getId());
        customer.setUserName(optional.get().getUserName());
        customer.setPassWord(optional.get().getPassWord());
        customer.setFullName(optional.get().getFullName());
        customer.setEmail(optional.get().getEmail());
        customer.setActivated(optional.get().getActivated());
        customer.setRole(optional.get().getRole());
        return customer;
    }
}
