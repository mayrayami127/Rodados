package com.sample.core.service;

import java.util.List;
import com.sample.core.dao.RodadoDao;
import com.sample.core.dao.RodadoDaoImpl;
import com.sample.core.domain.Rodado;
import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.ConsumoEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoEnum;
import com.sample.core.enums.TipoRodadoEnum;

public class RodadoServiceImpl {
    
    private RodadoDao rodadoDao = (RodadoDao) new RodadoDaoImpl();
	
    public List<Rodado> listarRodados() throws Exception {
        return rodadoDao.list();
    }

    public Rodado consultarRodado(int id) throws Exception {
        return rodadoDao.findById(id);
    }

    public void crearRodado(int id, CajaEnum caja, String patente, String motorcodigo, String motor, 
                           TipoEnum tipo, String color, ConsumoEnum consumo, PuertasEnum puerta, 
                           TipoRodadoEnum tiporodado, String baul) throws Exception {
        
        rodadoDao.save(id, caja, patente, motorcodigo, motor, tipo, color, consumo, puerta, tiporodado, baul);
    }
	
    public void delete(int id) throws Exception {
        rodadoDao.delete(id);
    }
}