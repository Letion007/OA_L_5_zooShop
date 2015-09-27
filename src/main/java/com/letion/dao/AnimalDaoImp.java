package com.letion.dao;

import com.letion.entity.Animal;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnimalDaoImp  implements AnimalDao{
    public  static final String JDBC_URL = "jdbc:mysql://127.0.01:3306/zooshop?user=neonet&password=matrix";
    private static java.sql.PreparedStatement  stmt;
    static ResultSet rs = null;

    @Override
    public  Animal getAnimalById(int id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Animal result = new Animal();
        try (Connection conn = DriverManager.getConnection(JDBC_URL)){

            String sqlQuery = "SELECT * FROM animal  WHERE id=?";
            stmt = conn.prepareStatement(sqlQuery);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                result.setId(rs.getInt("id"));
                result.setName(rs.getString("name"));
                result.setAge(rs.getInt("age"));
                result.setPrice(rs.getInt("price"));
                result.setDayNormaFood(rs.getInt("day_norma_food"));
            }
        }
        return result;
    }

    @Override
    public List<Animal> getAllAnimals() throws IOException, ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        List<Animal> listAnimal = new ArrayList<>();
        Animal result = new Animal();
        try (Connection conn = DriverManager.getConnection(JDBC_URL)){
            String sqlQuery = "SELECT * FROM animal";
            stmt = conn.prepareStatement(sqlQuery);
            rs = stmt.executeQuery();
            while (rs.next()) {
                result.setId(rs.getInt("id"));
                result.setName(rs.getString("name"));
                result.setAge(rs.getInt("age"));
                result.setPrice(rs.getInt("price"));
                result.setDayNormaFood(rs.getInt("day_norma_food"));
                listAnimal.add(result);
                result = new Animal();;
            }
        }
        return listAnimal;
    }

    @Override
    public void addAnimal(Animal animal) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(JDBC_URL)){
            String sqlQuery = "INSERT INTO animal (name, age, price, day_norma_food) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery);
            preparedStatement.setString(1, animal.getName());
            preparedStatement.setInt(2, animal.getAge());
            preparedStatement.setInt(3, animal.getPrice());
            preparedStatement.setInt(4, animal.getDayNormaFood());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void updateAnimal (Animal animal) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(JDBC_URL)){
            String sqlQuery = "UPDATE  animal SET name=?, age=?, price=?, day_norma_food=? WHERE id=?";
            PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery);
            preparedStatement.setString(1, animal.getName());
            preparedStatement.setInt(2, animal.getAge());
            preparedStatement.setInt(3, animal.getPrice());
            preparedStatement.setInt(4, animal.getDayNormaFood());
            preparedStatement.setInt(5, animal.getId());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void deleteAnimalById(int id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(JDBC_URL)){
            String sqlQuery = "DELETE FROM animal WHERE id=?";
            PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }
}
