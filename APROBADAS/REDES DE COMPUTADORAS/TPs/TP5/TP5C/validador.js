// --- PARTE 1: LÓGICA DEL WEBSOCKET (NUEVO) ---

// 1. Conectarse al servidor Websocket de Python
// ⚠️ ¡IMPORTANTE! Asegúrate de que esta IP sea la de tu servidor Arch ('laika')
const socket = new WebSocket('ws://192.168.100.68:9001');

// 2. Crear el "oyente" que reacciona a los mensajes del servidor
socket.onmessage = function(event) {
    // event.data será el JSON que envía Python, ej: {"boca": 7, "river": 5, ...}
    const votos = JSON.parse(event.data);
    
    // 3. Actualiza el HTML de la página en tiempo real
    try {
        document.getElementById('votos-boca').innerText = votos.boca;
        document.getElementById('votos-river').innerText = votos.river;
        document.getElementById('votos-independiente').innerText = votos.independiente;
        document.getElementById('votos-racing').innerText = votos.racing;
        document.getElementById('votos-sanlorenzo').innerText = votos.sanlorenzo;
        document.getElementById('votos-otro').innerText = votos.otro;
    } catch (e) {
        console.error("Error al actualizar los IDs de votos:", e);
    }
};

// (Opcional) Manejadores para depuración
socket.onopen = function(e) {
    console.log("[open] ¡Conectado al servidor de votación!");
};

socket.onerror = function(error) {
    console.log(`[error] Error de WebSocket: ${error.message}`);
    // Esta alerta es útil si el servidor Python no está corriendo
    alert("No se pudo conectar al servidor de Websocket. ¿Iniciaste el script de Python?");
};

socket.onclose = function(event) {
    console.log("[close] Conexión cerrada limpiamente.");
};


// --- PARTE 2: LÓGICA DEL FORMULARIO (MODIFICADA) ---

// Esta función se llama antes de enviar el formulario
function validarFormulario() {
    
    // 1. Obtener el valor del campo email
    var email = document.getElementById("email").value;

    // 2. Validar formato de e-mail (Lógica original del TP5-B)
    
    // i. Al menos 7 caracteres
    if (email.length < 7) {
        alert("El e-mail debe tener al menos 7 caracteres.");
        return false;
    }
    
    // ii. Tener una @ (no al principio ni al final)
    if (email.indexOf('@') <= 0 || email.indexOf('@') === email.length - 1) {
        alert("El e-mail debe contener un '@' en una posición válida.");
        return false;
    }
    
    // iii. Tener un punto (no al principio ni al final)
    if (email.indexOf('.') <= 0 || email.indexOf('.') === email.length - 1) {
        alert("El e-mail debe contener un '.' en una posición válida.");
        return false;
    }
    
    // iv. No tener caracteres especiales
    var caracteresEspeciales = /[\!#\$%\^&\*()+\=\[\]{};':"\\|,<>\/?]+/;
    if (caracteresEspeciales.test(email)) {
        alert("El e-mail no debe contener caracteres especiales.");
        return false;
    }

    // 3. Verificar que se seleccionó una opción
    var opciones = document.getElementsByName("equipo");
    var opcionVotada = "";
    for (var i = 0; i < opciones.length; i++) {
        if (opciones[i].checked) {
            opcionVotada = opciones[i].value;
            break;
        }
    }
    
    if (opcionVotada === "") {
        alert("Debe seleccionar una opción para votar.");
        return false; // Detiene
    }

    // --- ¡CAMBIO CLAVE PARA TP5-C! ---
    
    // 4. CORRECCIÓN (Control de Race Condition):
    //    Verifica si el socket está listo (OPEN) antes de intentar enviar.
    //    WebSocket.OPEN es el valor numérico 1.
    if (socket.readyState !== WebSocket.OPEN) {
        alert("La conexión al servidor de votación aún no está lista. Por favor, espere un segundo e intente de nuevo.");
        // Devuelve false para prevenir el crash Y la recarga
        return false; 
    }
    
    // 5. Si todo está bien, NO enviamos el formulario (POST).
    //    Enviamos el voto por el Websocket:
    socket.send(opcionVotada);
    
    // 6. (Opcional) Limpia el formulario y muestra un mensaje de "gracias"
    document.getElementById("email").value = "";
    for (var i = 0; i < opciones.length; i++) {
        opciones[i].checked = false;
    }
    
    // Busca el <h3> que agregamos en el HTML para poner el mensaje
    var mensajeEl = document.getElementById('mensaje-cliente');
    if (mensajeEl) {
         mensajeEl.innerText = "¡Gracias por su voto!";
         // Borra el mensaje de PHP (si existiera)
         var mensajePHP = document.getElementById('mensaje-servidor-php');
         if (mensajePHP) mensajePHP.innerText = "";
    }

    // 7. Devuelve 'false' SIEMPRE para prevenir la recarga de la página
    return false; 
}