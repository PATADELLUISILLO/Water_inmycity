<%-- 
    Document   : WeatherNeza
    Created on : 30 jul 2023, 18:28:43
    Author     : Gabriel
--%>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="panntillaCss.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    
        
        
    </head>
<body class="main-layout">

    <div  > 
        <header >
        <!--<a class="card2" href="/HTML/WeatherCity.html" style="display: flex; color: #000;"><i class="bi bi-align-start" style="font-size: 30;"></i> <p style="padding: left 6px; padding-top: 15px ; font-size: 10px;">Regresar</p></a>-->  
          <a class="card2" href="diasclimas.html" style="display: flex; color: #000;"> <i class="bi bi-calendar-week" style="font-size: 30px;" ></i><p style="padding-left: 6px; padding-top: 15px; font-size: 15px;"> Jueves , 6, 2023</p></a>
          <a class="card2" href="Form" style="display: flex; color: #000;"><i class="bi bi-geo-alt" style="font-size: 30px;"></i> <p style="padding: left 6px; padding-top: 15px ; font-size: 15px;">Nezahualcóyotl, Edo Mex</p></a>



<!-- Button trigger modal -->
<button type="button" class="btn btn-primary rounded-circle" data-bs-toggle="modal" data-bs-target="#exampleModal">
    <a class="card2" > <i class="bi bi-person-circle" style="display: flex; color: #000;" style="font-size: 45px;"></i> </a>
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" >
       <!--<div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div> -->
        <div class="modal-body"  >
          
            <div class="wrapper" style="text-justify:newspaper;"  >
                <div class="card-switch" >
                    <label class="switch" >
                       <input type="checkbox" class="toggle">
                       
                       <span class="slider"></span>
                       <span class="card-side"></span>
                       <div class="flip-card__inner">
                        <br>
                          <div class="flip-card__front">
                             <div class="title">Iniciar Sesion</div>
                             <form class="flip-card__form" action="IniciarSesion.html">
                                <input class="flip-card__input form-control" minlength="2" max1length="60" name="user" placeholder="user" type="text" required>
                                <input class="flip-card__input form-control" minlength="2" max1length="60" name="password" placeholder="Password" type="password" required>
                                <button class="flip-card__btn">Iniciar</button>
                             </form>
                          </div>
                          <div class="flip-card__back">
                             <div class="title">Registrate</div>
                             <form id="registroForm" class="flip-card__form" action="agregaruser" method="POST">
                                <input class="flip-card__input form-control" minlength="2" max1length="60" id="namewn" name="namewn"  placeholder="Nombre" type="text" required>
                                <input class="flip-card__input form-control" minlength="2" max1length="60" id="apmawn" name="apmawn"  placeholder="Apellido Materno" type="text" required>
                                <input class="flip-card__input form-control" minlength="2" max1length="60" id="appawn" name="appawn"  placeholder="Apellido Paterno" type="text" required>
                                <input class="flip-card__input  form-control" minlength="10" max1length="100" id="ubicawn" name="ubicawn" placeholder="Ubicacion" type="text" required>
                                <input class="flip-card__input form-control"  minlength="12" max1length="120" id="email" name="email" placeholder="Email" type="email" required>  
                                <input class="flip-card__input form-control" minlength="8" max1length="30" id="password" name="password" placeholder="Password" type="password" required>
                                <input class="flip-card__input form-control visually-hidden" minlength="8" readonly max1length="30" id="pago" name="pago" type="text" value="free" required>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="1" name="value"  id="value" required>
                                    <label class="form-check-label" for="value">
                                        Aceptas los <a href=""> terminos de prpivacidad</a>  </label>
                                  </div>
                                <input type="submit" value="Confir" class="flip-card__btn">
                             </form>

                          </div>
                       </div>
                    </label>
                </div>   
           </div>


        </div>

      </div>
    </div>
  </div>

        
</header>
<div style="text-align: center;"  class="card2">
    
    <h1>Buenos dias</h1>
    <div class="container1"  id="weather">
    </div>
        
                <script>
                    
                    const apiKey ='48900a52d7be799f349efc80fac25e87';
                    const ubica = '3530589';
                const apiUrl = `https://api.openweathermap.org/data/2.5/weather?id=${ubica}&APPID=${apiKey}&units=metric&lang=es`;
                                    
                    // Ejemplo sencillo utilizando Fetch API:
                    fetch(apiUrl)
                    .then(response => response.json())
                    .then(data => {   
                       
                            const weathericonapi = `https://openweathermap.org/img/wn/${data.weather[0].icon}.png`;
                            const weatherIconElemt = document.getElementById('weather-icono');
                            const weatherInfo = `
                            <div class="container">
                            <h3 style="font-size: 40px"> ${data.name}</h3>
                            <img class="img-fluid" src="${weathericonapi}" width="75" height="75" alt="Weather-icono">
                            <h4>${data.main.temp} °C</h5>
                            <h3>${data.weather[0].description}</h4>
                            </div>
                            <div class="wrapper4" >
                                
                                    <div class="text4"><h4><i class="bi bi-thermometer-half"></i>
                                    ${data.main.temp_min} °C / ${data.main.temp_max} °C</h4></div>
                                    <div class="text4"> <h3><i class="bi bi-moisture"></i>
                                        ${data.main.humidity}%</h3></div>
                                        <div class="text4"><h4><i class="bi bi-wind"></i>
                                            ${data.wind.speed} metros/seg , ${data.wind.deg}°</h4></div>
                                            <div class="text4"> <h4><i class="bi bi-speedometer"></i>
                                            ${data.main.pressure} hpa</h4></div>
                    
                            </div>

                            `;
                            
                            document.getElementById('weather').innerHTML = weatherInfo;
                     
                    })
                    .catch(error => {
                        console.error('Error al obtener los datos del clima:', error);
                        document.getElementById('weather').innerHTML ='Error al obtener datos del clima';
                    });

                
                
                window.onload = getweatherData();
                </script>
                    
                </di>
                <br>
                    <div id="weather-info" class="card2"></div>

          
      

    </div>
    </body>
     <footer>
        <br>
        <br>
        <br> 
        <div class="container2 " >
            <div class="row" >
                <img class="img"  src="/src/imagensky/sky-imagen.jpeg" alt="">
    
            <ul class="wrapper1 col">
            <li class="icon facebook">
                <span class="tooltip">Facebook</span>
                <span><i class="fab bi-facebook "></i></span>
            </li>
            <li class="icon twitter">
                <span class="tooltip"> twitter</span>
                <span> <i class="fab bi-twitter "></i></span>
            </li>
            <li class="icon instagram">
                <span class="tooltip">Instagram</span>
                <span> <i class="fab bi-instagram "></i></span>
            </li>
        </ul>
    
        <div class="">
            
            <h4 class="text3">@wheaterNeza  -  Todos los Derechos Reservados</h4>
        </div>
    </div>
    
    
    
    </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
  
</html>
