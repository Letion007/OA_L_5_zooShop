package com.letion.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.letion.entity.Animal;


import java.util.List;

public class AnimalRepository {

    private final SessionFactory sessionFactory;

//    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("one");
//    EntityManager entityManager = entityManagerFactory.createEntityManager();

    public AnimalRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(Animal item){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(item);
        session.getTransaction().commit();
    }

    public void update(Animal item){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.update(item);
        session.getTransaction().commit();
    }

    public void delete(Animal item){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.delete(item);
        session.getTransaction().commit();
    }

    public List<Animal> findAll(){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        List<Animal> result = (List<Animal>) session.createQuery("from Animal").list();
        session.getTransaction().commit();
        return result;
    }
}