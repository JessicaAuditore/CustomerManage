package com.soul.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "customer")
@Data
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Basic
    @Column(name = "representative")
    private String representative;

    @Basic
    @Column(name = "name")
    private String name;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Dict.class)
    @JoinColumn(name = "dict")
    private Dict dict;

    @Basic
    @Column(name = "address")
    private String address;

    @Basic
    @Column(name = "telephone")
    private String telephone;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Source.class)
    @JoinColumn(name = "source")
    private Source source;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Linkman.class)
    @JoinColumn(name = "linkman")
    private Linkman linkman;
}
