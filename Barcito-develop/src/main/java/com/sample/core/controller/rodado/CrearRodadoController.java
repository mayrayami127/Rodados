package com.sample.core.controller.rodado;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.sample.core.service.RodadoService;
import com.sample.core.service.RodadoServiceImpl;

@WebServlet(urlPatterns = "/CrearRodado")
public class CrearRodadoController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    RodadoService rodadoService = (RodadoService) new RodadoServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String caja = req.getParameter("tipocaja");
        String tipo = req.getParameter("tipo");
        String consumo = req.getParameter("tipoconsumo");
        String puertas = req.getParameter("puertas");
        String tiporodado = req.getParameter("tipoderodado");
        String patente = req.getParameter("patente");
        String motorcodigo = req.getParameter("motorrodaje");
        String motor = req.getParameter("motor");
        String color = req.getParameter("color");
        String baul = req.getParameter("baul");

        try {
        	rodadoService.crearRodado(
                caja,
                tipo,
                consumo,
                puertas,
                tiporodado,
                patente,
                motorcodigo,
                motor,
                color,
                baul
            );

            PrintWriter out = resp.getWriter();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");

            JsonObject obj = new JsonObject();
            obj.addProperty("estatus", "ok");
            obj.addProperty("mensaje", "Se creo exitosamente el rodado");

            out.print(obj.toString());
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}