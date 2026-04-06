package com.sample.core.dao;

import java.util.List;

import com.sample.core.domain.Rodado;
import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.ConsumoEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoEnum;
import com.sample.core.enums.TipoRodadoEnum;

public interface RodadoDao {
public List<Rodado> list() throws Exception;
	
	public Rodado findById(int id) throws Exception;
	
	public void delete (int id) throws Exception;
	
	public void save (int id,CajaEnum caja, java.lang.String patente, java.lang.String motorcodigo, java.lang.String motor, TipoEnum tipo, java.lang.String color,
			ConsumoEnum consumo, PuertasEnum puerta, TipoRodadoEnum tiporodado, java.lang.String baul) throws Exception;
	
}
