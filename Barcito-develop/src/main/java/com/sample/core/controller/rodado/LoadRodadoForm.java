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
@WebServlet( urlPatterns =  "/loadRodadoForm")
public class LoadRodadoForm  extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private RodadoService rodadoService = (RodadoService) new RodadoServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	RequestDispatcher ds = this.getServletContext().getRequestDispatcher("/RodadoForm.jsp");
		
		try {
			//req.setAttribute("Rodado", platoService.listarPlatos());
			String id = req.getParameter("id");
			 
			// System.err.println(id);
			 
			Rodado rodado =  rodadoService.consultarRodado( Integer.parseInt(id) );
			 
			 req.setAttribute("rodado", rodado);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ds.forward(req, resp);
		
	}
	
}
