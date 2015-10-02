package com.letion.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class StorageRepositories {

    private AnimalRepository animalRepository;

    public StorageRepositories() {
        SessionFactory sessionFactory;

        try {
            // Create the SessionFactory from hibernate.cfg.xml
            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }

        this.animalRepository = new AnimalRepository(sessionFactory);
    }

    public AnimalRepository getAnimalRepository() {
        return animalRepository;
    }
}