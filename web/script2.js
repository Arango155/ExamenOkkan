
function limpiarTabla() {

 var tableBody = document.getElementById("bodyTable");
 tableBody.style.display = "none";
  }


function mostrarDatos (){
  
 var tableBody = document.getElementById("bodyTable");
 tableBody.style.display = "table-row-group";
}

function eliminarTodo (){
      Swal.fire({
    title: "¿Quieres eliminar todos los datos?",
    text: "Esta accion no se podra revertir",
    showDenyButton: true,
    confirmButtonText: "Eliminar",
    denyButtonText: "Cancelar"
  }).then((result) => {
    if (result.isConfirmed) {
      var deleteUrl = 'deleteall.jsp';
      setTimeout(function () {
        window.location.href = deleteUrl;
      }, 1000);
      mostrarEliminarTodo();
    } else if (result.isDenied) {
      Swal.fire("Ningún registro ha sido eliminado!");
    }
  });
}





function enviarFormulario(event) {
  event.preventDefault();
  const XHR = new XMLHttpRequest();
  const formData = new FormData(document.getElementById('form'));

XHR.addEventListener('load', function(event) {
  if (XHR.status === 200) {
    console.log('response => ' + XHR.response);


    // Comprueba la respuesta del sistema
    try {
      const responseData = JSON.parse(XHR.response);
       

      if (responseData === 1) {
        mostrarMensaje();
      
      } else if (responseData === 0) {
       
        mostrarError();
      }
      
      else if (responseData === null) {
       
        mostrarIndicacion();
      }
      
      else if (responseData === "") {
       
        mostrarIndicacion();
      }
    } catch (error) {
      
      console.error('Error parsing JSON response:', error);
      // Handle the case where parsing fails
    }
  } else {
    mostrarIndicacion();
  
  }
});


  XHR.addEventListener('error', function(event) {
    console.error('Request failed');
    alert('Oops! Something went wrong.');
  });

  // Set up the request
  XHR.open('POST', 'Servlet', true);
  XHR.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

  // Send the form data as a URL-encoded string
  XHR.send(new URLSearchParams(formData).toString());
}

// Previene que sea enviado el formulario
document.getElementById('form').addEventListener('submit', enviarFormulario);



function mostrarMensaje() {
  Swal.fire({
    position: 'center',
    icon: 'success',
    title: 'Tu formulario ha sido enviado',
    showConfirmButton: false,
    timer: 2500,
  });

  // Recarga la pagina
  setTimeout(function () {
    location.reload();
  }, 1500);
}

function mostrarError(){
  Swal.fire({
  position: 'center',
  icon: "error",
  title: "Oops... Algo salio mal",
  showConfirmButton: false,
    timer: 1500,
});
}

function mostrarIndicacion(){
    Swal.fire({
  title: "Esta funcionando el servlet?",
  text: "Ha habido un error de sistema",
  icon: "question",
  showConfirmButton: false,
  timer: 1500,
});
}

function eliminar(codigo_libro) {
  Swal.fire({
    title: "¿Quieres eliminar este registro?",
    showDenyButton: true,
    confirmButtonText: "Eliminar",
    denyButtonText: "Cancelar"
  }).then((result) => {
    if (result.isConfirmed) {
      var deleteUrl = 'delete.jsp?id=' + codigo_libro;
      setTimeout(function () {
        window.location.href = deleteUrl;
      }, 1000);
      mostrarEliminar();
    } else if (result.isDenied) {
      Swal.fire("Ningún registro ha sido eliminado!");
    }
  });
}

function mostrarEliminar() {
  Swal.fire({
    position: 'center',
    icon: 'success',
    title: 'Registro eliminado!',
    showConfirmButton: false,
  });

  // Mostrar los datos
  document.querySelector("#bodyTable tbody").style.display = "table-row-group";
}

function mostrarEliminarTodo() {
  Swal.fire({
    position: 'center',
    icon: 'success',
    title: 'Registros eliminados!',
    showConfirmButton: false,
  });

}