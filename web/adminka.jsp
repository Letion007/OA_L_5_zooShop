
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Adminka</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="js/jquery.js"></script>
    <script language="JavaScript" type="text/javascript">

      $(document).ready(function(){
                selectAllAnimals();
        }
      )

      function selectAllAnimals() {

            $.ajax({
              type: 'GET',
              url: 'api/admin',
              dataType: 'json',
              contentType: 'application/json; charset=utf-8',
              success: function (data) {
                drawTable(data);
              }
            });

            function drawTable(data) {
              $("#resultSearch").html("");
              var tblHeader = "<tr>";
              for (var k in data[0]) tblHeader += "<th>" + k + "</th>";
              tblHeader += "<th>UPDATE</th>";
              tblHeader += "<th>DELETE</th>";
              tblHeader += "</tr>";
              $("#resultSearch").append(tblHeader);
              for (var i = 0; i < data.length; i++) {
                drawRow(data[i]);
              }
            }

            function drawRow(rowData) {
              var row = $("<tr />")
              $("#resultSearch").append(row);
              row.append($("<td>" + rowData.id + "</td>"));
              row.append($("<td>" + rowData.name + "</td>"));
              row.append($("<td>" + rowData.age + "</td>"));
              row.append($("<td>" + rowData.price + "</td>"));
              row.append($("<td>" + rowData.dayNormaFood + "</td>"));
              row.append($("<td><a onclick='insertToFormForUpdate(" + rowData.id + "); return false;'  class='btn btn-success'>Select</a></td>"));
              row.append($("<td><button onclick='deleteAnimalbyId(" + rowData.id + "); return false;'  class='btn btn-warning'>DELETE</button></td>"));
            }
      }

      function createNewAnimal() {
        name = $('input[name="newName"]').val();
        age = $('input[name="newAge"]').val();
        price = $('input[name="newPrice"]').val();
        dayNormaFood = $('input[name="newDayNormaFood"]').val();
        if(name == "" || age == "" || price == "" || dayNormaFood == "") { alert ("input all field"); return;}
        var data = generateJSONdataCreateNew();
        $.ajax({
          type: 'POST',
          url: 'api/admin',
          data: data,
          dataType: 'json',
          contentType:'application/json; charset=utf-8',
          success: function(data) {

          }
        });
        selectAllAnimals();
      }

      function updateAnimal() {
        id = $('input[id="id"]').val();
        name = $('input[name="name"]').val();
        age = $('input[name="age"]').val();
        price = $('input[name="price"]').val();
        dayNormaFood = $('input[name="dayNormaFood"]').val();
        if(name == "") { alert ("NAME is empty. Press 'Select'  in Table"); return;}
        var data = generateJSONDataUpdate();
        $.ajax({
          type: 'PUT',
          url: 'api/admin',
          data: data,
          dataType: 'json',
          contentType:'application/json; charset=utf-8',
          success: function(data) {
//
          }
        });
        selectAllAnimals();
      }

      function insertToFormForUpdate(id) {

        var data = generateJSONdataCreateNew();
        $.ajax({
          type: 'GET',
          url: 'api/admin/' + id,
          data: data,
          dataType: 'json',
          contentType:'application/json; charset=utf-8',
          success: function(data) {
            $("#id").val(data.id);
            $("#name").val(data.name);
            $("#age").val(data.age);
            $("#price").val(data.price);
            $("#dayNormaFood").val(data.dayNormaFood);
          }
        });
        selectAllAnimals();
      }


      function deleteAnimalbyId(id) {
        $.ajax({
          type: "DELETE",
          url: "api/admin/"+id,
          success: function(value){
          }
        });
        selectAllAnimals();
      }

      function generateJSONdataCreateNew() {
        var name = $('input[name="newName"]').val();
        var age = $('input[name="newAge"]').val();
        var price = $('input[name="newPrice"]').val();
        var dayNormaFood = $('input[name="newDayNormaFood"]').val();
        var animal = {
          name: name,
          age: age,
          price: price,
          dayNormaFood: dayNormaFood
        };
        var data = JSON.stringify(animal);
        return data;
      }

      function generateJSONDataUpdate() {
        var id = $('input[name="id"]').val();
        var name = $('input[name="name"]').val();
        var age = $('input[name="age"]').val();
        var price = $('input[name="price"]').val();
        var dayNormaFood = $('input[name="dayNormaFood"]').val();
        var animal = {
          id: id,
          name: name,
          age: age,
          price: price,
          dayNormaFood: dayNormaFood
        };
        var data = JSON.stringify(animal);
        return data;
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
                <input type="text" id="id" name="id"><br>
                name:<br>
                <input type="text" id="name" name="name"><br>
                age:<br>
                <input type="text" id="age" name="age"><br>
                price:<br>
                <input type="text" id="price" name="price"><br>
                dayNormaDay:<br>
                <input type="text" id="dayNormaFood" name="dayNormaFood"><br>
              </form>
              <a  onclick="updateAnimal(); return false;"  class="btn btn-success">UPDATE</a>
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
            <table id="resultSearch" class="table table-striped"></table>
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
