package com.thanh.services;

import com.thanh.convert.CustomerConvert;
import com.thanh.entity.Customer;
import com.thanh.repository.CustomerRepository;
import com.thanh.services.Interface.CustomerIF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerImpl implements CustomerIF {
    @Autowired
    CustomerRepository customerRepository;

    @Override
    public List<Customer> lists() {
        return (List<Customer>) customerRepository.findAll();
    }

    @Override
    public Optional<Customer> findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public void create(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public void delete(int id) {
        customerRepository.deleteById(id);
    }

    @Override
    public void update(Customer customer) {
        Optional<Customer> customerTo =customerRepository.findById(customer.getId());
        customerTo.get().setEmail(customer.getEmail());
        customerTo.get().setFullName(customer.getFullName());
        customerTo.get().setUserName(customer.getUserName());
        customerTo.get().setPassWord(customer.getPassWord());
        customerTo.get().setActivated(customer.getActivated());
        customerTo.get().setRole(customer.getRole());
        customerRepository.save(customer);
    }

    @Override
    public Customer findByUserPass(String user, String pass) {
        List<Customer> customers= (List<Customer>) customerRepository.findAll();
        for(Customer customer:customers){
            if(customer.getUserName().equals(user) && customer.getPassWord().equals(pass)){
                return customer;
            }
        }
        return null;
    }

    @Override
    public Customer findByUsername(String user) {
        List<Customer> customers= (List<Customer>) customerRepository.findAll();
        for(Customer customer:customers){
            if(customer.getUserName().equals(user)){
                return customer;
            }
        }
        return null;
    }


}
