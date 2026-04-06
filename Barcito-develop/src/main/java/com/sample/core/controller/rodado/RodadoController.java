package com.sample.core.controller.rodado;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sample.core.service.RodadoService;
import com.sample.core.service.RodadoServiceImpl;
	@WebServlet( urlPatterns = "/rodados")
	public class RodadoController extends HttpServlet{

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		RodadoService rodadoService = (RodadoService) new RodadoServiceImpl();
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			try {
				Gson json = new Gson();
				PrintWriter out = resp.getWriter();
				resp.setContentType("application/json");
				resp.setCharacterEncoding("utf-8");
				out.print(json.toJson(rodadoService.listarRodados()).toString());
				out.flush();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
		}

		
		
		
	}
