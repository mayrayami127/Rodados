package com.sample.core.service;

import java.util.List;

import com.sample.core.domain.Rodado;

public interface RodadoService {
public List<Rodado> listarRodados() throws Exception;
	
	public Rodado consultarRodado(int id) throws Exception;
	

	public void delete(int id) throws Exception;

	public void crearRodado(java.lang.String caja, java.lang.String tipo, java.lang.String consumo,
			java.lang.String puertas, java.lang.String tiporodado, java.lang.String patente,
			java.lang.String motorcodigo, java.lang.String motor, java.lang.String color, java.lang.String baul);
}
