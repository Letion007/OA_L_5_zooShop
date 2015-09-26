
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Book</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script language="JavaScript" type="text/javascript">

      var xMLHttpRequest = new XMLHttpRequest();



      function selectAllBooks() {
        xMLHttpRequest.open("Post", "/library?typeSelect=allbooks", true);
        xMLHttpRequest.onreadystatechange = processSelectBooks;
        xMLHttpRequest.send(null);
      }

      function selectBooksByAuthor() {
        xMLHttpRequest.open("Get", "/library?typeSelect=byAuthor&author=" + document.getElementById("author").value, true);
        xMLHttpRequest.onreadystatechange = processSelectBooks;
        xMLHttpRequest.send(null);
      }

      function selectBooksByIsbn() {
        xMLHttpRequest.open("Get", "/library?typeSelect=byIsbn&isbn=" + document.getElementById("isbn").value, true);
        xMLHttpRequest.onreadystatechange = processSelectBooks;
        xMLHttpRequest.send(null);
      }

      function addNewBook() {
        xMLHttpRequest.open("Get", "/library?typeSelect=addNewBook&name=" + document.getElementById("newName").value +
                "&author=" + document.getElementById("newAuthor").value + "&isbn=" + document.getElementById("newIsbn").value , true);
        xMLHttpRequest.onreadystatechange = processOperation;
        xMLHttpRequest.send(null);
      }

      function deleteBookByIsbn() {
        xMLHttpRequest.open("Get", "/library?typeSelect=deleteBook&isbn=" + document.getElementById("deleteIsbn").value, true);
        xMLHttpRequest.onreadystatechange = processOperation;
        xMLHttpRequest.send(null);
      }
      function processSelectBooks() {

        if(xMLHttpRequest.readyState == 4 && xMLHttpRequest.status == 200) {
          var JSONTopicObject = eval('(' + xMLHttpRequest.responseText + ')');
          var table = document.getElementById("resultSearch");
          table.setAttribute("class", "table table-striped");
          table.innerHTML = "";
          var headrow = table.insertRow(0);
          var headcell_1 = headrow.insertCell(0);
          var headcell_2 = headrow.insertCell(1);
          var headcell_3 = headrow.insertCell(2);
          headcell_1.style.backgroundColor = "lightblue";
          headcell_2.style.backgroundColor = "lightblue";
          headcell_3.style.backgroundColor = "lightblue";
          headcell_1.innerHTML = "Name Book"
          headcell_2.innerHTML = "Author";
          headcell_3.innerHTML = "ISBN";
          var book = JSONTopicObject.books.listBooks;
          var i = 0;
          while (i < book.length) {
            row = table.insertRow(i+1);
            cell_1 = row.insertCell(0);
            cell_1.innerHTML = book[i].name;
            cell_2 = row.insertCell(1);
            cell_2.innerHTML = book[i].author;
            cell_3 = row.insertCell(2);
            cell_3.innerHTML = book[i].isbn;
            i++;
          }
        }
      }

      function selectAuthors() {
        xMLHttpRequest.open("Get", "/library?typeSelect=byAuthor&author=" + document.getElementById("author").value, true);
        xMLHttpRequest.onreadystatechange = processSelectAuthor;
        xMLHttpRequest.send(null);
      }


      function processSelectAuthor() {
        if(xMLHttpRequest.readyState == 4 && xMLHttpRequest.status == 200) {
          var JSONTopicObject = eval('(' + xMLHttpRequest.responseText + ')');
          var table = document.getElementById("resultSearch");
          table.setAttribute("class", "table table-striped");
          table.innerHTML = "";
          var headrow = table.insertRow(0);
          var headcell_1 = headrow.insertCell(0);
          headcell_1.style.backgroundColor = "lightblue";
          headcell_1.innerHTML = "Author"
          var book = JSONTopicObject.books.listBooks;
          var i = 0;
          while (i < book.length) {
            row = table.insertRow(i+1);
            cell_1 = row.insertCell(0);
            cell_1.innerHTML = book[i].author;
            i++;
          }
        }
      }

      function processOperation() {
        if(xMLHttpRequest.readyState == 4 && xMLHttpRequest.status == 200) {
          var JSONTopicObject = eval('(' + xMLHttpRequest.responseText + ')');
          var table = document.getElementById("resultSearch");
          table.setAttribute("class", "table table-striped");
          table.innerHTML = "";
          var headrow = table.insertRow(0);
          var headcell_1 = headrow.insertCell(0);
          headcell_1.style.backgroundColor = "lightblue";
          headcell_1.innerHTML = "ResultOperation";
          row = table.insertRow(1);
          cell_1 = row.insertCell(0);
          cell_1.innerHTML = JSONTopicObject.books.name;

        }
      }


      function clearTutorialsTable() {
        var table = document.getElementById("resultSearch");
        table.innerHTML = "";
      }
    </script>
  </head>
  <body>

    <%--<input type="text" id="topicName" size="20">--%>
    <%--<button type="button" onclick="findTutorials();">Find Tutorials</button>--%>
    <%--<br><table id="tutorialsTable" style = "border:1px solid black"></table>--%>

    <div class="container">
      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-lg-12">
          <h1 class="page-header">
            JAVA EE. Home Task#3 - Library
          </h1>
        </div>
        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4><i class="fa fa-fw fa-check"></i> Select All Books</h4>
            </div>
            <div class="panel-body">
              <p>Here you can select All Books
              </p>
              <a onclick="selectAllBooks();"  class="btn btn-success">Select</a>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4><i class="fa fa-fw fa-check"></i> Select By Author</h4>
            </div>
            <div class="panel-body">
              <p>Input some Author(Martin, Mike Collins, L.Tolstoy ...)</p>
              <input type="text" id="author" size="20">
              <a onclick="selectBooksByAuthor();"  class="btn btn-success">Select</a>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4><i class="fa fa-fw fa-check"></i> Select Book By ISDN</h4>
            </div>
            <div class="panel-body">
              <p>Input some ISBN (9-1111-2222, 7-1113-4444, 9-8989-5555 ...)</p>
              <input type="text" id="isbn" size="20">
              <a onclick="selectBooksByIsbn();"  class="btn btn-success">Select</a>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4><i class="fa fa-fw fa-check"></i>Add new Book</h4>
            </div>
            <div class="panel-body">
              <p>Add new Book. Input data here:</p>
              Name:<br> <input type="text" id="newName" size="20"><br>
              Author:<br><input type="text" id="newAuthor" size="20"><br>
              ISBN:<br> <input type="text" id="newIsbn" size="20"><br>
              <a onclick="addNewBook();"  class="btn btn-success">Add</a>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4><i class="fa fa-fw fa-check"></i> Delete Book By ISDN</h4>
            </div>
            <div class="panel-body">
              <p>Delete Book by ISBN. Input ISBNhere:</p>
              <input type="text" id="deleteIsbn" size="20"><br>
              <a onclick="deleteBookByIsbn();"  class="btn btn-success">Delete</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Call to Action Section -->
      <div class="well">
        <div class="row">
          <div class="col-md-8">
            <table id="resultSearch" style = "border:1px solid black"></table>
          </div>
          <div class="col-md-4">
            <a class="btn btn-lg btn-success btn-block" onclick="clearTutorialsTable();">CLEAR</a>
          </div>
        </div>
      </div>

      <hr>

      <!-- Footer -->
      <footer>
        <div class="row">
          <div class="col-lg-12">
            <p>Copyright &copy; Letion</p>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.container -->

  </body>
</html>
