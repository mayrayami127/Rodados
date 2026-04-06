package com.sample.core.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.core.dao.config.Conexion;
import com.sample.core.domain.Rodado;
import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.ConsumoEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoEnum;
import com.sample.core.enums.TipoRodadoEnum;
import com.sample.core.exceptions.ErrorException;

public class RodadoDaoImpl {

    private Conexion conexion = Conexion.getInstance();

    private static final String queryList = "SELECT * FROM vehiculos";
    private static final String queryConsultarRodado = "SELECT * FROM vehiculos WHERE id=?";
    private static final String queryAddRodado =
        "INSERT INTO vehiculos (tipocaja, tipo, tipoconsumo, puertas, tipoderodado, patente, motorrodaje, motor, color, baul) VALUES (?,?,?,?,?,?,?,?,?,?)";
    private static final String queryDeleteRodado = "DELETE FROM vehiculos WHERE id=?";

    // 🔹 LISTAR
    public List<Rodado> list() throws Exception {
        List<Rodado> lista = new ArrayList<Rodado>();
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = conexion.dameConnection().prepareStatement(queryList);
            rs = st.executeQuery();

            while (rs.next()) {
                Rodado r = new Rodado();

                r.setId(rs.getInt("id"));
                r.setCaja(CajaEnum.valueOf(rs.getString("tipocaja").toUpperCase()));
                r.setTipo(TipoEnum.valueOf(rs.getString("tipo").toUpperCase()));
                r.setConsumo(ConsumoEnum.valueOf(rs.getString("tipoconsumo").toUpperCase()));
                r.setPuerta(PuertasEnum.valueOf(rs.getString("puertas").toUpperCase()));
                r.setTiporodado(TipoRodadoEnum.valueOf(rs.getString("tipoderodado").toUpperCase()));
                r.setPatente(rs.getString("patente"));
                r.setMotorcodigo(rs.getString("motorrodaje"));
                r.setMotor(rs.getString("motor"));
                r.setColor(rs.getString("color"));
                r.setBaul(rs.getString("baul"));

                lista.add(r);
            }

        } catch (Exception e) {
            throw new ErrorException("Error al listar rodados", e);
        } finally {
        	finalizarConexion(st, rs);
        }

        return lista;
    }

    // 🔹 BUSCAR POR ID
    public Rodado findById(int id) throws Exception {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = conexion.dameConnection().prepareStatement(queryConsultarRodado);
            st.setInt(1, id);
            rs = st.executeQuery();

            if (rs.next()) {
                Rodado r = new Rodado();

                r.setId(rs.getInt("id"));
                r.setCaja(CajaEnum.valueOf(rs.getString("tipocaja").toUpperCase()));
                r.setTipo(TipoEnum.valueOf(rs.getString("tipo").toUpperCase()));
                r.setConsumo(ConsumoEnum.valueOf(rs.getString("tipoconsumo").toUpperCase()));
                r.setPuerta(PuertasEnum.valueOf(rs.getString("puertas").toUpperCase()));
                r.setTiporodado(TipoRodadoEnum.valueOf(rs.getString("tipoderodado").toUpperCase()));
                r.setPatente(rs.getString("patente"));
                r.setMotorcodigo(rs.getString("motorrodaje"));
                r.setMotor(rs.getString("motor"));
                r.setColor(rs.getString("color"));
                r.setBaul(rs.getString("baul"));

                return r;
            }

        } catch (Exception e) {
            throw new ErrorException("Error al buscar rodado", e);
        } finally {
        	finalizarConexion(st, rs);
        }

        return null;
    }

    // 🔹 ELIMINAR
    public void delete(int id) throws Exception {
        PreparedStatement st = null;

        try {
            st = conexion.dameConnection().prepareStatement(queryDeleteRodado);
            st.setInt(1, id);

            int result = st.executeUpdate();

            if (result == 0) {
                throw new Exception("No se pudo eliminar");
            }

        } finally {
        	finalizarConexion(st, null);
        }
    }

    // 🔹 GUARDAR
    public void save(Rodado r) throws Exception {
        PreparedStatement st = null;

        try {
            st = conexion.dameConnection().prepareStatement(queryAddRodado);

            st.setString(1, r.getCaja().name());
            st.setString(2, r.getTipo().name());
            st.setString(3, r.getConsumo().name());
            st.setString(4, r.getPuerta().name());
            st.setString(5, r.getTiporodado().name());
            st.setString(6, r.getPatente());
            st.setString(7, r.getMotorcodigo());
            st.setString(8, r.getMotor());
            st.setString(9, r.getColor());
            st.setString(10, r.getBaul());

            st.executeUpdate();

        } finally {
        	finalizarConexion(st, null);
        }
    }

    // 🔹 CERRAR
    private void finalizarConexion(PreparedStatement st, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}