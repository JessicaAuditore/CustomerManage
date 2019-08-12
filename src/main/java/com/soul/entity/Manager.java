package com.soul.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "manager")
@Data
public class Manager {

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
    @Column(name = "realname")
    private String realname;

    @Basic
    @Column(name = "address")
    private String address;

    @Basic
    @Column(name = "level")
    private String level;
}
