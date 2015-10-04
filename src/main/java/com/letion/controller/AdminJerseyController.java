package com.letion.controller;


import com.letion.dao.AnimalRepository;
import com.letion.dao.StorageRepositories;
import com.letion.entity.Animal;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@Path("/admin")
public class AdminJerseyController {

    private AnimalRepository animalRepo = new StorageRepositories().getAnimalRepository();


    @GET
    @Produces("application/json")
    public Response getAll () throws SQLException, IOException, ClassNotFoundException {
        List<Animal> animals = animalRepo.findAll();
        return Response.ok(animals, MediaType.APPLICATION_JSON_TYPE).build();
    }
//    @GET
//    @Path("/{id}")
//    @Produces("application/json")
//    public Response getAnimalById (@PathParam("id") String idStr) throws SQLException, IOException, ClassNotFoundException {
//        Integer id = new Integer(idStr);
//        Animal animal = animalRepo.getAnimalRepository().getAnimalById(id);
//        return Response.ok(animal, MediaType.APPLICATION_JSON_TYPE).build();
//    }
    @POST
    @Consumes("application/json")
    @Produces("application/json")
    public Response add(Animal animal) throws SQLException, ClassNotFoundException {
        animalRepo.create(animal);
        return Response.ok("{'result':'good add'}").build();
    }
    @PUT
    @Consumes("application/json")
    @Produces("application/json")
    public Response update(Animal animal) throws SQLException, ClassNotFoundException {
        animalRepo.update(animal);
        return Response.ok("{'result':'good update'}").build();
    }
//    @DELETE
//    @Path("{id}")
//    @Produces("application/json")
//    public Response delete(@PathParam("id") String idStr) throws SQLException, ClassNotFoundException {
//        Integer id = new Integer(idStr);
//        animalRepo.getAnimalRepository().delete(id);
//        return Response.ok("{'result':'good delete'}").build();
//    }
}
