package com.sample.core.domain;

import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.ConsumoEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoEnum;
import com.sample.core.enums.TipoRodadoEnum;

public class Rodado {

	private int id;
	private CajaEnum caja;
	private String patente;
	private String motorcodigo;
	private String motor;
	private TipoEnum tipo;
	private String color;
	private ConsumoEnum consumo;
	private PuertasEnum puerta;
	private TipoRodadoEnum tiporodado;
	private String baul;

	public Rodado() {}

	public Rodado(int id, CajaEnum caja, String patente, String motorcodigo, String motor,
	              TipoEnum tipo, String color, ConsumoEnum consumo,
	              PuertasEnum puerta, TipoRodadoEnum tiporodado, String baul) {
		this.id = id;
		this.caja = caja;
		this.patente = patente;
		this.motorcodigo = motorcodigo;
		this.motor = motor;
		this.tipo = tipo;
		this.color = color;
		this.consumo = consumo;
		this.puerta = puerta;
		this.tiporodado = tiporodado;
		this.baul = baul;
	}

	public int getId() { return id; }
	public void setId(int id) { this.id = id; }

	public CajaEnum getCaja() { return caja; }
	public void setCaja(CajaEnum caja) { this.caja = caja; }

	public String getPatente() { return patente; }
	public void setPatente(String patente) { this.patente = patente; }

	public String getMotorcodigo() { return motorcodigo; }
	public void setMotorcodigo(String motorcodigo) { this.motorcodigo = motorcodigo; }

	public String getMotor() { return motor; }
	public void setMotor(String motor) { this.motor = motor; }

	public TipoEnum getTipo() { return tipo; }
	public void setTipo(TipoEnum tipo) { this.tipo = tipo; }

	public String getColor() { return color; }
	public void setColor(String color) { this.color = color; }

	public ConsumoEnum getConsumo() { return consumo; }
	public void setConsumo(ConsumoEnum consumo) { this.consumo = consumo; }

	public PuertasEnum getPuerta() { return puerta; }
	public void setPuerta(PuertasEnum puerta) { this.puerta = puerta; }

	public TipoRodadoEnum getTiporodado() { return tiporodado; }
	public void setTiporodado(TipoRodadoEnum tiporodado) { this.tiporodado = tiporodado; }

	public String getBaul() { return baul; }
	public void setBaul(String baul) { this.baul = baul; }
}