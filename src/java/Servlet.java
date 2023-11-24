import Clases.Objeto;
import Clases.Controller;
import Clases.ConexionBaseDeDatos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Servlet"})
public class Servlet extends HttpServlet {
    Objeto objeto;
    Controller registroObjeto;
    Objeto[] ObjetosRegistrados;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter respuesta = response.getWriter()) {
            objeto = new Objeto(
                Integer.parseInt(request.getParameter("uno")),
                request.getParameter("dos"),
                request.getParameter("tres"),
                request.getParameter("cuatro"),
                Integer.parseInt(request.getParameter("cinco"))
            );

            if (registroObjeto == null) {
                registroObjeto = new Controller();
            }

            registroObjeto.guardarObjeto(objeto);

            if (registroObjeto.ObtenerObjeto(objeto)) {
                respuesta.println(1);
            } else {
                respuesta.println(0);
            }
            ObjetosRegistrados = registroObjeto.getObjeto();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
