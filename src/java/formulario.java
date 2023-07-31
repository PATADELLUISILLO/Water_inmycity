import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class formulario {

    /*
     * private final String base = "weathertb";
     * private final String user = "root";
     * private final String password = "R00t1234/";
     * private final String url = "jdbc:mysql://localhost:3306/"+ base;
     * 
     * 
     * public Connection getConexion(){
     * 
     * class.forName(com.mysql)
     * }
     */

    public static void main(String[] args) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {

            String dbURL = "jdbc:mysql://localhost:3306/weathertb";
            String user = "root";
            String password = "R00t1234/";

            connection = DriverManager.getConnection(dbURL, user, password);

            statement = connection.createStatement();

            String sql = "SELECT * FROM user";

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {

                int id = resultSet.getInt("idUser");
                String nombre = resultSet.getString("nombre_wn");

                System.out.println("ID: " + id + ", nombre: " + nombre);

            }

            connection.close();
        } catch (SQLException e) {

            System.err.println("Error al cargar el controlador JDBC");
            e.printStackTrace();
        } finally {

            try {

                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {

                    statement.close();
                }
                if (connection != null) {

                    connection.close();
                }
            } catch (SQLException e) {

                e.printStackTrace();
            }

        }

    }

}
