package com.thanh.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Role {
    @Id
    private int role_ID;
    private String role_Name;

    @OneToMany(mappedBy = "role")
    private List<Customer> customers;

    public int getRole_ID() {
        return role_ID;
    }

    public void setRole_ID(int role_ID) {
        this.role_ID = role_ID;
    }

    public String getRole_Name() {
        return role_Name;
    }

    public void setRole_Name(String role_Name) {
        this.role_Name = role_Name;
    }

    public List<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }
}
