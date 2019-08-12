package com.soul.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "source")
@Data
public class Source {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Basic
    @Column(name = "name")
    private String name;
}
