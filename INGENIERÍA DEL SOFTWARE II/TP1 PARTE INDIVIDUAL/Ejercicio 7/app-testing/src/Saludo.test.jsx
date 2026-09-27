import React from 'react';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import '@testing-library/jest-dom';
import Saludo from './Saludo';

describe('Pruebas sobre el componente <Saludo />', () => {

  test('muestra un mensaje de error si el usuario envía el campo vacío', async () => {
    // 1. RTL monta el componente en el DOM virtual
    render(<Saludo />);

    // 2. RTL localiza el botón por su rol accesible y texto
    const boton = screen.getByRole('button', { name: /saludar/i });

    // 3. Simulamos el clic directo del usuario sin llenar el input
    await userEvent.click(boton);

    // 4. Jest valida que la alerta de error apareció en pantalla
    const mensajeError = screen.getByRole('alert');
    expect(mensajeError).toBeInTheDocument();
    expect(mensajeError).toHaveTextContent('El nombre es obligatorio');
  });

  test('muestra el saludo personalizado cuando se ingresa un nombre válido', async () => {
    render(<Saludo />);

    // Localizamos los elementos por su etiqueta asociada y rol
    const input = screen.getByLabelText(/tu nombre:/i);
    const boton = screen.getByRole('button', { name: /saludar/i });

    // Simulamos la escritura y el clic posterior
    await userEvent.type(input, 'Carlos');
    await userEvent.click(boton);

    // Jest comprueba que el texto final se renderizó
    expect(screen.getByText('¡Hola, Carlos!')).toBeInTheDocument();

    // Verificamos que la alerta de error NO exista en el documento
    expect(screen.queryByRole('alert')).not.toBeInTheDocument();
  });

});