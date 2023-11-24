package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Controller {
    Objeto[] tabla;
    int indiceArray;
    private ConexionBaseDeDatos conectorBD;
    private Connection conexion;
    private PreparedStatement statement = null;
    private ResultSet result = null;

    public Controller() {
        this.tabla = new Objeto[100];
        this.indiceArray = 0;
    }

    public void guardarObjeto(Objeto objeto) {
        this.tabla[this.indiceArray] = objeto;
        this.indiceArray = this.indiceArray + 1;
        // procedimiento para almacenar en la Base de Datos
    }

    public Objeto[] getObjeto() {
        return this.tabla;
    }

    public void abrirConexion() {
        conectorBD = new ConexionBaseDeDatos();
        conexion = conectorBD.conectar();
    }

    public boolean ObtenerObjeto(Objeto objeto) {
        String sql = "INSERT INTO final_progra.libro(codigo_libro,nombre,fecha_lanzamiento,autor,tipo_pasta_id) ";
        sql += " VALUES( ?,?,?,?,?)";
        try {
            abrirConexion();
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, objeto.getUno());
            statement.setString(2, objeto.getDos());
            statement.setString(3, objeto.getTres());
            statement.setString(4, objeto.getCuatro());
            statement.setInt(5, objeto.getCinco());
            int resultado = statement.executeUpdate();
            if (resultado > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            String error = e.getMessage();
            return false;
        }
    }
}
