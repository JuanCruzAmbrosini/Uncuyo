<?php
$mensaje_servidor = "";
$votos = [];

// Cargar los votos actuales para mostrarlos
if (file_exists('votos.json')) {
    $votos_json = file_get_contents('votos.json');
    $votos = json_decode($votos_json, true);
} else {
    // Inicializar si el archivo no existe
    $votos = [
        "boca" => 0, 
        "river" => 0, 
        "independiente" => 0, 
        "racing" => 0, 
        "sanlorenzo" => 0, 
        "otro" => 0
    ];
}

// Procesar el voto si el formulario fue enviado (método POST)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Obtener los datos del formulario (POST)
    $email = $_POST['email'];
    $opcion_votada = $_POST['equipo'];
    
    // 2. Verificar si el email ya votó
    $emails_registrados = file_get_contents('emails.txt');
    if (strpos($emails_registrados, $email) !== false) {
        // 3. Si ya votó, mostrar mensaje
        $mensaje_servidor = "Usted ya votó. No puede votar dos veces.";
    } else {
        // Si no votó, registrar el email y el voto
        // Registrar email
        $file_emails = fopen("emails.txt", "a");
        fwrite($file_emails, $email . "\n");
        fclose($file_emails);
        
        // Contabilizar voto
        if (isset($votos[$opcion_votada])) {
            $votos[$opcion_votada]++;
        }
        
        // Guardar el array de votos actualizado en el archivo
        file_put_contents('votos.json', json_encode($votos));
        
        $mensaje_servidor = "¡Gracias por su voto!";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Encuesta de Fútbol</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <style>
        /* Estilo simple para alinear las imágenes de los escudos */
        form img {
            width: 25px; /* Tamaño del escudo */
            vertical-align: middle; /* Alinea la imagen con el texto */
            margin-left: 8px; /* Separación del texto */
        }
    </style>
</head>
<body>

    <img src="https://www.uncuyo.edu.ar/assets/imgs/marca-uncuyo.svg" alt="Logo UNCuyo" width="200">

    <h1>Elija su equipo favorito</h1>
    
    <form name="votacion" action="index.php" method="POST" onsubmit="return validarFormulario();">
        
        <label for="email">Ingrese su e-mail:</label>
        <input type="text" id="email" name="email">
        <br><br>

        <input type="radio" id="boca" name="equipo" value="boca">
        <label for="boca">
            Boca Juniors
            <img src="https://upload.wikimedia.org/wikipedia/commons/c/c9/Boca_escudo.png" alt="Escudo Boca">
        </label>
        <br>
        
        <input type="radio" id="river" name="equipo" value="river">
        <label for="river">
            River Plate
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Logo_River_Plate.png/500px-Logo_River_Plate.png" alt="Escudo River">
        </label>
        <br>
        
        <input type="radio" id="independiente" name="equipo" value="independiente">
        <label for="independiente">
            Independiente
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Escudo_del_Club_Atl%C3%A9tico_Independiente.svg/1945px-Escudo_del_Club_Atl%C3%A9tico_Independiente.svg.png" alt="Escudo Independiente">
        </label>
        <br>
        
        <input type="radio" id="racing" name="equipo" value="racing">
        <label for="racing">
            Racing Club
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Escudo_de_Racing_Club_%282014%29.svg/1686px-Escudo_de_Racing_Club_%282014%29.svg.png" alt="Escudo Racing">
        </label>
        <br>

        <input type="radio" id="sanlorenzo" name="equipo" value="sanlorenzo">
        <label for="sanlorenzo">
            San Lorenzo
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.png/1057px-Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.png" alt="Escudo San Lorenzo">
        </label>
        <br>
        
        <input type="radio" id="otro" name="equipo" value="otro">
        <label for="otro">Otro</label>
        <br><br>

        <input type="submit" value="Enviar">
    </form>

    <hr>
    
    <h2>Resultados de la Encuesta</h2>
    
    <h3 style="color: blue;"><?php echo $mensaje_servidor; ?></h3>
    
<p>Boca Juniors: <span id="votos-boca"><?php echo $votos['boca']; ?></span> votos</p>
<p>River Plate: <span id="votos-river"><?php echo $votos['river']; ?></span> votos</p>
<p>Independiente: <span id="votos-independiente"><?php echo $votos['independiente']; ?></span> votos</p>
<p>Racing Club: <span id="votos-racing"><?php echo $votos['racing']; ?></span> votos</p>
<p>San Lorenzo: <span id="votos-sanlorenzo"><?php echo $votos['sanlorenzo']; ?></span> votos</p>
<p>Otro: <span id="votos-otro"><?php echo $votos['otro']; ?></span> votos</p>

<h3 style="color: green;" id="mensaje-cliente"></h3>
    

    <script src="validador.js"></script>
</body>
</html>