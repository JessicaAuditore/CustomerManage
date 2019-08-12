package com.soul.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "visit")
@Data
public class Visit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Basic
    @Column(name = "address")
    private String address;

    @Basic
    @Column(name = "aim")
    private String aim;

    @Basic
    @Column(name = "result")
    private String result;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Customer.class)
    @JoinColumn(name = "customer")
    private Customer customer;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Linkman.class)
    @JoinColumn(name = "linkman")
    private Linkman linkman;
}
