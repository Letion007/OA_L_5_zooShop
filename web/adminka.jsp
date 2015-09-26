
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Adminka</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="js/jquery.js"></script>
    <script language="JavaScript" type="text/javascript">

      $(document).ready(function(){
                selectAllAnimals();
        }

      )

      var xMLHttpRequest = new XMLHttpRequest();
      function selectAllAnimals() {
        xMLHttpRequest.open("Get", "/adminka?type=selectAll", true);
        xMLHttpRequest.onreadystatechange = processSelect;
        xMLHttpRequest.send(null);
      }



//      function addNewBook() {
//        xMLHttpRequest.open("Get", "/library?typeSelect=addNewBook&name=" + document.getElementById("newName").value +
//                "&author=" + document.getElementById("newAuthor").value + "&isbn=" + document.getElementById("newIsbn").value , true);
//        xMLHttpRequest.onreadystatechange = processOperation;
//        xMLHttpRequest.send(null);
//      }
//
//      function deleteBookByIsbn() {
//        xMLHttpRequest.open("Get", "/library?typeSelect=deleteBook&isbn=" + document.getElementById("deleteIsbn").value, true);
//        xMLHttpRequest.onreadystatechange = processOperation;
//        xMLHttpRequest.send(null);
//      }
      function processSelect() {

        if(xMLHttpRequest.readyState == 4 && xMLHttpRequest.status == 200) {
          var JSONObject = eval('(' + xMLHttpRequest.responseText + ')');
          var table = document.getElementById("resultSearch");
          table.setAttribute("class", "table table-striped");
          table.innerHTML = "";
          var headrow = table.insertRow(0);
          var headcell_1 = headrow.insertCell(0);
          var headcell_2 = headrow.insertCell(1);
          var headcell_3 = headrow.insertCell(2);
          var headcell_4 = headrow.insertCell(3);
          var headcell_5 = headrow.insertCell(4);
          var headcell_6 = headrow.insertCell(5);
          var headcell_7 = headrow.insertCell(6);
          headcell_1.innerHTML = "id"
          headcell_2.innerHTML = "Name";
          headcell_3.innerHTML = "Age";
          headcell_4.innerHTML = "price";
          headcell_5.innerHTML = "dayNormaFood";
          headcell_6.innerHTML = "Update";
          headcell_7.innerHTML = "Delete";
          var animal = JSONObject.animal.listAnimals;
          var i = 0;
          while (i < animal.length) {
            row = table.insertRow(i+1);
            cell_1 = row.insertCell(0);
            cell_1.innerHTML = animal[i].id;
            cell_2 = row.insertCell(1);
            cell_2.innerHTML = animal[i].name;
            cell_3 = row.insertCell(2);
            cell_3.innerHTML = animal[i].age;
            cell_4 = row.insertCell(3);
            cell_4.innerHTML = animal[i].price;
            cell_5 = row.insertCell(4);
            cell_5.innerHTML = animal[i].dayNormaFood;
            cell_6 = row.insertCell(5);
            cell_6.innerHTML = "<a onclick='insertDataForUpdate(" + animal[i].id + ")'  class='btn btn-success'>Select</a>";
            cell_7 = row.insertCell(6);
            cell_7.innerHTML = "<button type='button'>Deletes</button>";
            i++;
          }
        }
      }
      function insertDataForUpdate(id) {
        xMLHttpRequest.open("Get", "/adminka?type=select&id=" + id, true);
        xMLHttpRequest.onreadystatechange = insertDataForUpdateProcess;
        xMLHttpRequest.send(null);
      }
      function insertDataForUpdateProcess () {
        if(xMLHttpRequest.readyState == 4 && xMLHttpRequest.status == 200) {
         var JSONObject = eval('(' + xMLHttpRequest.responseText + ')');
         $("#id").val(JSONObject.animal.id);
         $("#name").val(JSONObject.animal.name);
         $("#age").val(JSONObject.animal.age);
         $("#price").val(JSONObject.animal.price);
         $("#dayNormaFood").val(JSONObject.animal.dayNormaFood);
        }
      }

      function createNewAnimal() {
//        var msg   = generateJSONdataCreateNew();


        $.ajax({
          type: 'POST',
          url: 'adminka',
          dataType: 'json',
          data: generateJSONdataCreateNew(),
//          data: {'name':'age', 'age':3, 'price':44, 'dayNormaFood': '5','type':'createNew',} ,
          success: function(data) {
            alert("ok"  + data);
          },
          error:  function(xhr, str){
            alert('Возникла ошибка: ' + xhr.responseCode);
          }
        });
      }

      function generateJSONdataCreateNew() {
        var event = {
          name: 'fasraras',
          age: 2,
          price: 2,
          dayNormaFood: 2,
          type: 'createNew'
        };
        var data = JSON.stringify(event);





//        var data = "{ ";
//        data += "\"name\": \"" + $("#newName").val() + "\", ";
//        data += "\"age\": \"" + $("#newAge").val() + "\", ";
//        data += "\"price\": \"" + $("#newPrice").val() + "\", ";
//        data += "\"dayNormaFood\": \"" + $("#newDayNormaFood").val() + "\", ";
//        data += "\"type\": \"createNew\"";
//        data += " }";
//        alert("data JSON - " + data);


        return data;
      }

      function createNewAnimalProcess () {
        if(xMLHttpRequest.readyState == 4 && xMLHttpRequest.status == 200) {
          var JSONObject = eval('(' + xMLHttpRequest.responseText + ')');
          alert ("успешно добавлен");

        }
      }





    </script>
  </head>
  <body>

    <div class="container">
      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-lg-12">
          <h1 class="page-header">
             e-shop "ZOO"
          </h1>
        </div>

        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4><i class="fa fa-fw fa-check"></i>Update</h4>
            </div>
            <div class="panel-body">
              <form  action="adminka" method="post" id="updateAnimal">
                id:<br>
                <input type="text" id="id"><br>
                name:<br>
                <input type="text" id="name"><br>
                age:<br>
                <input type="text" id="age"><br>
                price:<br>
                <input type="text" id="price"><br>
                dayNormaDay:<br>
                <input type="text" id="dayNormaFood"><br>
                <input type="hidden" name="type" value="updateAnimal"><br>

              </form>
              <a onclick="insertDataForUpdate(1);"  class="btn btn-success">UPDATE</a>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4><i class="fa fa-fw fa-check"></i>Create New Animal</h4>
            </div>
            <div class="panel-body">
              <form  onsubmit="createNewAnimal(); return false;" method="post" id="newAnimal">
                name:<br>
                <input type="text" id="newName" name="newName"><br>
                age:<br>
                <input type="text" id="newAge" name="newAge"><br>
                price:<br>
                <input type="text" id="newPrice" name="newPrice"><br>
                dayNormaFood:<br>
                <input type="text" id="newDayNormaFood" name="newDayNormaFood"><br>
                <input type="hidden"  name="type" value="createNew"><br>

                <%--<button onclick="createNewAnimal();">CREATE</button>--%>
                <a onclick="createNewAnimal(); return false;"  class="btn btn-success">CREATE</a>
              </form>
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
          <%--<div class="col-md-4">--%>
            <%--<a class="btn btn-lg btn-success btn-block" onclick="clearTutorialsTable();">CLEAR</a>--%>
          <%--</div>--%>
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
