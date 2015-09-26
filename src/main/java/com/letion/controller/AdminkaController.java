package com.letion.controller;

import com.letion.dao.AnimalDao;
import com.letion.dao.AnimalDaoImp;
import com.letion.dao.BookDaoImp;
import com.letion.entity.Animal;
import com.letion.entity.Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

@WebServlet(name = "AdminkaController", urlPatterns = "/adminka")
public class AdminkaController extends HttpServlet {
    public static final String PARAM_ID = "id";
    public static final String ATTR_MODEL_TO_VIEW = "product";
    public static final String PAGE_OK = "/product.jsp";
    public static final String PAGE_ERROR = "/error.jsp";
    private AnimalDao animalDao = new AnimalDaoImp();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        response.setContentType("text/html");
        if (type!=null && type != "") {
            try {
                doSelect(type, request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);

        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String type = request.getParameter("type");
        System.out.println("type = " + type);
        response.setContentType("text/html");
        if (type!=null && type != "") {
            try {
                doSelect(type, request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);

        }
    }

    protected void doSelect (String type, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {
        if (type.equals("select")) {
            String idStr = request.getParameter(PARAM_ID);
            Integer id = new Integer(idStr);
            if(id > 0 && id != null) {
                response.getWriter().write(generateJSONDataOneAnimal(animalDao.getAnimalById(id)));
            }
        }
        if (type.equals("selectAll")) {
            response.getWriter().write(generateJSONDataFromListAnimals(animalDao.getAllAnimals()));
        }
        if (type.equals("createNew")) {
            String name = request.getParameter("name");

            Integer age = new Integer(request.getParameter("age"));
            Integer price = new Integer(request.getParameter("price"));
            Integer dayNormaFood = new Integer(request.getParameter("dayNormaFood"));
            System.out.println("name" + name);
            if (name != "") {
                boolean rs = animalDao.addAnimal(name, age, price, dayNormaFood);
//            response.getWriter().write(generateJSONOperation(animalDao.addAnimal(name, age, price, dayNormaFood)));
            }
        }
//        if (typeSelect.equals("byIsbn")) {
//            String isbn = request.getParameter("isbn");
//            response.getWriter().write(generateJSONDataFromListBooks(animalDao.getBook(isbn)));
//        }
//        if (typeSelect.equals("addNewBook")) {
//            String name = request.getParameter("name");
//            String author = request.getParameter("author");
//            String isbn = request.getParameter("isbn");
//            if (name != "" && author != "" && isbn != "") {
//                response.getWriter().write(generateJSONOperation(animalDao.addBook(name, author, isbn)));
//            }
//        }
//        if (typeSelect.equals("deleteBook")) {
//            String isbn = request.getParameter("isbn");
//            if (isbn != "") {
//                response.getWriter().write(generateJSONOperation(library.deleteBookByIsbn(isbn)));
//            }
//        }
    }

    public String generateJSONDataOneAnimal (Animal animals) {
        String result = "";
        result += "{\"animal\":";
        result += animals.toString();
        result += "}";
        return result;
    }
    public String generateJSONDataFromListAnimals (List<Animal> animals) {
        String result = "";
        result += "{\"animal\":{";
        result += "\"listAnimals\":[";
        Iterator<Animal> iterator = animals.iterator();
        while (iterator.hasNext()) {
            Animal animal = iterator.next();
            result += animal.toString() + ", ";
        }
        result += "]}}";
        return result;
    }
    public String generateJSONOperation (boolean resultOperation) {
        String result = "";
        result += "{\"books\":{";
        result += "\"name\":\"resultOperation = " + resultOperation + "\"";
        result += "}}";
        return result;
    }
}
