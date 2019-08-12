package com.soul.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "linkman")
@Data
public class Linkman {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "password")
    private String password;

    @Basic
    @Column(name = "gender")
    private String gender;

    @Basic
    @Column(name = "address")
    private String address;

    @Basic
    @Column(name = "telephone")
    private String telephone;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "linkman", fetch = FetchType.LAZY, targetEntity = Customer.class)
    private transient Set<Customer> customerSet;
}
