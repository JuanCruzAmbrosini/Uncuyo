// Esta función se llama antes de enviar el formulario
function validarFormulario() {
    
    // 1. Obtener el valor del campo email
    var email = document.getElementById("email").value;

    // 2. Validar formato de e-mail
    
    // i. Al menos 7 caracteres
    if (email.length < 7) {
        alert("El e-mail debe tener al menos 7 caracteres.");
        return false; // Detiene el envío del formulario
    }
    
    // Tener una @ (no al principio ni al final)
    if (email.indexOf('@') <= 0 || email.indexOf('@') === email.length - 1) {
        alert("El e-mail debe contener un '@' en una posición válida.");
        return false;
    }
    
    // Tener un punto (no al principio ni al final)
    if (email.indexOf('.') <= 0 || email.indexOf('.') === email.length - 1) {
        alert("El e-mail debe contener un '.' en una posición válida.");
        return false;
    }
    
    // No tener caracteres especiales (usando una expresión regular)
    var caracteresEspeciales = /[\!#\$%\^&\*()+\=\[\]{};':"\\|,<>\/?]+/;
    if (caracteresEspeciales.test(email)) {
        alert("El e-mail no debe contener caracteres especiales.");
        return false;
    }

    // Verificar que se seleccionó una opción
    var opciones = document.getElementsByName("equipo");
    var seleccionado = false;
    for (var i = 0; i < opciones.length; i++) {
        if (opciones[i].checked) {
            seleccionado = true;
            break;
        }
    }
    
    if (!seleccionado) {
        alert("Debe seleccionar una opción para votar.");
        return false;
    }

    // Si todo está bien, permite el envío
    return true; 
}