
function limpiarTabla() {

  var tabla = document.getElementById('tabla1');
  var totalFilas = tabla.rows.length;
  for (var i = totalFilas - 1; i > 0; i--) {
    tabla.deleteRow(i);
  }
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

  // Reload the page after the timer (2500 milliseconds) finishes
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
