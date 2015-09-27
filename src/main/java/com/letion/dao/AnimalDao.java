package com.letion.dao;

import com.letion.entity.Animal;
import com.letion.entity.Book;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface AnimalDao {

    public  Animal getAnimalById(int id) throws ClassNotFoundException, SQLException;
    public List<Animal> getAllAnimals() throws IOException, ClassNotFoundException, SQLException;
    public void addAnimal(Animal animal) throws ClassNotFoundException, SQLException;
    public void updateAnimal(Animal animal) throws ClassNotFoundException, SQLException;
    public void deleteAnimalById(int id) throws ClassNotFoundException, SQLException;
}
