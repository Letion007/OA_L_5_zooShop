package com.letion.dao;

import com.letion.entity.Animal;
import com.letion.entity.Book;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface AnimalDao {

    public  Animal getAnimalById(int id) throws ClassNotFoundException, SQLException;
    public Animal getAnimalByName(String name);
    public List<Animal> getAllAnimals() throws IOException, ClassNotFoundException, SQLException;
    public boolean addAnimal(String name, int age, int price, int dayNormaFood) throws ClassNotFoundException, SQLException;
    public boolean addAnimall(Animal animal) throws ClassNotFoundException, SQLException;
    public boolean updateAnimal(Animal animal) throws ClassNotFoundException, SQLException;
    public boolean deleteAnimalById(int id) throws ClassNotFoundException, SQLException;
}
