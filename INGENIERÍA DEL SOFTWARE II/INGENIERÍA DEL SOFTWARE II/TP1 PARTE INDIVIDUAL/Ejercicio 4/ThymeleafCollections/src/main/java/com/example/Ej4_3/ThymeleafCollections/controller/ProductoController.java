package com.example.Ej4_3.ThymeleafCollections.controller;

import com.example.Ej4_3.ThymeleafCollections.model.Producto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductoController {

    @GetMapping("/productos")
    public String mostrarProductos(Model model) {

        List<Producto> productos = new ArrayList<>();

        productos.add(new Producto(1L, "Notebook IdeaPad", "Lenovo", 800.0));
        productos.add(new Producto(2L, "Smartphone Galaxy", "Samsung", 600.0));
        productos.add(new Producto(3L, "Tablet iPad", "Apple", 400.0));
        productos.add(new Producto(4L, "Smartwatch Versa", "Fitbit", 200.0));
        productos.add(new Producto(5L, "Auriculares WH-1000XM4", "Sony", 300.0));

        model.addAttribute("productos", productos);

        return "productos";
    }
}
