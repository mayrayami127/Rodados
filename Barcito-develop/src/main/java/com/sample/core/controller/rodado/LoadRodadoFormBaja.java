package com.sample.core.controller.rodado;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sample.core.domain.Rodado;
import com.sample.core.service.RodadoService;
import com.sample.core.service.RodadoServiceImpl;

//LoadRodadoFormBaja
@WebServlet( urlPatterns =  "/loadRodadoFormBaja")

public class LoadRodadoFormBaja extends HttpServlet{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		private RodadoService rodadoService = (RodadoService) new RodadoServiceImpl();
		
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher ds = this.getServletContext().getRequestDispatcher("/rodadoFormBaja.jsp");
			
			try {
				//req.setAttribute("Rodados", platoService.listarPlatos());
				 String id = req.getParameter("id");
				 System.err.println(id);
				 
				 Rodado rodado =  rodadoService.consultarRodado(Integer.parseInt(id));
				 
				 req.setAttribute("rodado", rodado);
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ds.forward(req, resp);
			
	}
}
