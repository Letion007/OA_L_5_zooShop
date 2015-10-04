package com.letion.entity;

import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.Column;
import javax.persistence.Entity;
import java.io.Serializable;

@Entity
@Table(name = "animal")
public class Animal implements Serializable {

    @Id
    @GeneratedValue
    private int id;
    @Column (name = "name")
    private String name;
    @Column (name = "age")
    private int age;
    @Column (name = "price")
    private int price;
    @Column (name = "day_norma_food")
    private int dayNormaFood;

    public Animal() {

    }
    public Animal(String name, int age, int price, int dayNormaFood) {
        this.name = name;
        this.age = age;
        this.price = price;
        this.dayNormaFood = dayNormaFood;
    }
    public Animal(int id, String name, int age, int price, int dayNormaFood) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.price = price;
        this.dayNormaFood = dayNormaFood;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDayNormaFood() {
        return dayNormaFood;
    }

    public void setDayNormaFood(int dayNormaFood) {
        this.dayNormaFood = dayNormaFood;
    }
    public String toString () {
        String result;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append( "{");
        stringBuilder.append( "\"id\": \"" + getId() + "\", ");
        stringBuilder.append( "\"name\": \"" + getName() + "\", ");
        stringBuilder.append( "\"age\": \"" + getAge() + "\", ");
        stringBuilder.append("\"price\": \"" + getPrice() + "\",");
        stringBuilder.append("\"dayNormaFood\": \"" + getDayNormaFood() + "\"");
        stringBuilder.append( "}");
        result = stringBuilder.toString();
        return result;
    }
}
