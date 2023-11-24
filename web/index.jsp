
<%@page import="Clases.ConexionBaseDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
          <head>
        <title>CRUD online</title>  
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3211/3211296.png"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>       
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 
                <link href="styles.css" rel="stylesheet" type="text/css"/>
       
              
          </head>
          
  
        <body>

        <header>
        <div class="user-wrapper">
            <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" width="40px" height="40px" alt="">
        
        </div>            
        </header>


                      <%
                              ConexionBaseDeDatos conn = new ConexionBaseDeDatos();
                              Statement smt;
                              ResultSet rs;
                              smt = conn.conectar().createStatement();
                              rs = smt.executeQuery("SELECT * FROM libro "
                                      + "INNER JOIN tipo_pasta "
                                      + "ON libro.tipo_pasta_id = tipo_pasta.id");
                    %>

   
                    <div class="container">
   <form class="form-register"   method="POST"  id="form" name="form"  >
              
        <h1>Registro</h1>

            <div class="form-group">
                <label for="exampleInputName">Codigo</label>
                <input class="form-control" type="text"  name="uno"  >
            </div>
            <div class="form-group">
                <label for="exampleInputName">Nombre </label>
                <input class="form-control" type="text"  name="dos"  >
            </div>
        
        <div class="form-group">
                <label for="exampleInputName">Fecha</label>
                <input class="form-control" type="text"  name="tres"  >
            </div>
        
         <div class="form-group">
                <label for="exampleInputName">Autor</label>
                <input class="form-control" type="text"  name="cuatro"  >
            </div>
        
          
          <select class="form-control" name="cinco">
                <option value="1">BLANDA</option>
                <option value="2">GRUESA</option>
          </select><br>
              <button type="submit" onclick="enviarFormulario()" class="btn btn-primary bi bi-send"> Enviar formulario</button>
        </form>   
                    
                    
                    <div class="tabla">
                        
                        <h1>Tabla 📊</h1>
                        
                        
                         <form class="d-flex" role="search">
                                       <input  class="btn btn-primary" type="submit" value="Mostrar datos">
                                        </form>
                                       
                        <br>
                                        
                     <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Autor</th>
                            <th scope="col">Pasta</th>
                            <th scope="col">Acciones</th>
                          </tr>
                          <% while (rs.next()) { %>
                          <tr>
                            <td><%= rs.getString("codigo_libro") %></td>
                            <td><%= rs.getString("nombre") %></td>
                            <td><%= rs.getString("fecha_lanzamiento") %></td>
                            <td><%= rs.getString("autor") %></td>
                            <td><%= rs.getString("descripcion") %></td>
                            <td>
                              <a href="edit.jsp?id=<%= rs.getInt("codigo_libro") %>" class="btn btn-outline-light">✏️</a>
                              <a onclick="eliminar()" class="btn btn-light">🗑️</a>
                            </td>
                            
                        <script>
                            
                            function eliminar (){
                                Swal.fire({
  title: "Quieres eliminar este registro?",
  showDenyButton: true,
  confirmButtonText: "Eliminar",
  denyButtonText: `Cancelar`
}).then((result) => {

if (result.isConfirmed) {

  var codigo_libro = '<%= rs.getInt("codigo_libro") %>';

  var deleteUrl = 'delete.jsp?id=' + codigo_libro;


  
    setTimeout(function () {
    window.location.href = deleteUrl;
  }, 1000);

  mostrarEliminar();
  
  
} else if (result.isDenied) {
  Swal.fire("Ningun registro ha sido eliminado!");
}
});
                                
                            }
                            
 function mostrarEliminar(){
 
   Swal.fire({
    position: 'center',
    icon: 'success',
    title: 'Registro eliminado!',
    showConfirmButton: false,
 
  });

 
 
 }
                            
                        </script>
                          </tr>
                          <% } %>
                        </thead>
                        <tbody id="bodyTable">
                        </tbody>
                      </table>
                        
                        
                    </div>

  
        <script src="script2.js" type="text/javascript"></script>     
        </body>
</div>
</html>