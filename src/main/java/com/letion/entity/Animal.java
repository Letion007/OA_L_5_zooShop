package com.letion.entity;

public class Animal {

    private int id;
    private String name;
    private int age;
    private int price;
    private int dayNormaFood;

    public Animal() {
        this.name = name;
        this.age = age;
        this.price = price;
        this.dayNormaFood = dayNormaFood;
    }
    public Animal(String name, int age, int price, int dayNormaFood) {
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
