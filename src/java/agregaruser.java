import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/agregaruser")
public class agregaruser extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String db_url = "jdbc:mysql://localhost:3306/weathertb";
    private static final String db_user = "root";
    private static final String db_password = "R00t1234/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        String nombre_wn = request.getParameter("namewn");
        String A_materno_wn = request.getParameter("apmawn");
        String A_paterno_wn = request.getParameter("appawn");
        String ubica_wn = request.getParameter("ubicawn");
        String email_wn = request.getParameter("email");
        Boolean valido_wn = Boolean.valueOf(request.getParameter("value"));
        String password_wn = request.getParameter("password");
        String tipo_wn = request.getParameter("pago");

        try {

            Connection connection = DriverManager.getConnection(db_url, db_user, db_password);
            String sql = "INSERT INTO user (idUser, nombre_wn, A_materno_wn, A_paterno_wn, ubica_wn, email_wn, password_wn, valido_wn, tipo_wn) VALUE (?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, 2);
            statement.setString(2, nombre_wn);
            statement.setString(3, A_materno_wn);
            statement.setString(4, A_paterno_wn);
            statement.setString(5, ubica_wn);
            statement.setString(6, email_wn);
            statement.setString(7, password_wn);
            statement.setBoolean(8, valido_wn);
            statement.setString(9, tipo_wn);
            statement.executeUpdate();
            connection.close();

            response.sendRedirect("WeatherNeza.html");
        } catch (SQLException e) {

            e.printStackTrace();
           

            response.sendRedirect("WeatherNeza.html");
        }

    }

}

/*
 * import java.io.BufferedReader;
 * import java.io.IOException;
 * import java.io.InputStreamReader;
 * import java.net.HttpURLConnection;
 * import java.net.URL;
 * 
 * 
 * import org.json.JSONException;
 * import org.json.JSONObject;
 * 
 * public class ConsultarClima {
 * 
 * public static void main(String[] args) throws JSONException {
 * Reemplaza con tu clave api
 * 
 * String apiKey = "48900a52d7be799f349efc80fac25e87";
 * String ciudad = "MX";
 * String ubica = "3530589";
 * String apiUrl = "http://api.openweathermap.org/data/2.5/onecall?id=" + ubica
 * + "&APPID="
 * + apiKey
 * + "&units=metric&lang=es";
 * 
 * try {
 * 
 * Response response = client.newCall(request).execute();
 * URL url = new URL(apiUrl);
 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
 * conn.setRequestMethod("GET");
 * 
 * if (conn.getResponseCode() != 200) {
 * throw new RuntimeException("Error al realizar la solicitud: Código HTTP: " +
 * conn.getResponseCode());
 * }
 * 
 * BufferedReader br = new BufferedReader(new
 * InputStreamReader(conn.getInputStream()));
 * StringBuilder response = new StringBuilder();
 * String inputLine;
 * 
 * while ((inputLine = br.readLine()) != null) {
 * response.append(inputLine);
 * }
 * br.close();
 * 
 * Gson gson = new Gson();
 * JsonObject jsonObject = gson.fromJson(response.toString(), JsonObject.class);
 * String weatherData = response.toString();
 * JSONObject jsonObject = new JSONObject(response.toString());
 * double temperatura = jsonObject.getJSONObject("main").getDouble("temp");
 * String weatherDescription =
 * jsonObject.getJSONArray("weather").getJSONObject(0).getString("description");
 * 
 * JSONArray("weather").getAsJsonObject(0).getString("description");
 * 
 * String description = jsonObject.get("description").getAsString();
 * 
 * System.out.println(weatherData);
 * System.out.println(weatherDescription);
 * System.out.println(temperatura);
 * 
 * if (response.isSuccessful()) {
 * 
 * String jsonData = response.body().string();
 * JSONObject jsonObject = new JSONObject(jsonData);
 * 
 * String descripcion =
 * jsonObject.getJSONArray("weather").getJSONObject(0).getString("description");
 * double temperatura = jsonObject.getJSONObject("main").getDouble("temp");
 * long tiempoUnix = jsonObject.getLong("dt");
 * // convertir tiempo unix a object date
 * 
 * Date tiempo = new Date(tiempoUnix * 1000);
 * 
 * // Formatear la fecha y hora
 * SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
 * String fechaHora = dateFormat.format(tiempo);
 * 
 * 
 * descripcion, temperatura - 273.15);
 * System.out.println("Hora y fecha del pronóstico actual: " + fechaHora);
 * 
 * } else {
 * System.out.println("No se pudo obtener el pronóstico del clima.");
 * 
 * }
 * 
 * } catch (Exception e) {
 * 
 * e.printStackTrace();
 * 
 * displayWeatherInHTML(temperatura, weatherDescription);
 */
/*
 * } catch (IOException e) {
 * e.printStackTrace();
 * } catch (JSONException e) {
 * e.printStackTrace();
 * }
 * }
 * 
 * public String mostrar(String mostrar) {
 * String html = mostrar;
 * return html;
 * }
 * 
 * private static String displayWeatherInHTML(Double temperatura, String
 * weatherDescription) {
 * 
 * String html = "<h1 id=simulatedData>" + " temp " + temperatura +
 * " description " + weatherDescription
 * + "</h1>";
 * // System.out.println(html);
 * return html;
 * }
 * }
 */
