package com.novel.osp.manager.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name = "curr_station_data")
public class PowerData1 implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "stationid")
	private String stationId;
	private String powerstatus;
	private String devtemp;
	private String envtemp; 
	private String envhum;
	private String chargesource;
	private String supplyceel;
	private String loadvoltage1;
	private String loadcurrent1;
	private String loadvoltage2;
	private String loadcurrent2;
	private String loadvoltage3;
	private String loadcurrent3;
	private String loadvoltage4;
	private String loadcurrent4;
	private String loadvoltage5;
	private String loadcurrent5;
	private String innerstatus1;
	private String innervalue1;
	private String innerstatus2;
	private String innervalue2;
	//
	private String innerstatus3;
	private String innervalue3;
	private String innerstatus4;
	private String innervalue4;
	private String electricfield;
	private String groundresistance;
	private String flagdoor;
	private String flagIR;

	private String flagwater;
	private String flaglight;
	private String flagSD;
	private String recvdatatime;
	private String devno;
	private String ac;
	private String pingstatus;
	private String thdccminvalue;
	private String voltagesolarceel;
	private String chargevoltage;
	private String chargecurrent;
	private String supplyvoltage;
	private String supplycurrent;
	
	@Transient
	private String d;

	@Transient
	private Station station;

	public PowerData1() {

	}

	

	public PowerData1(String stationId, String powerstatus, String devtemp, String envtemp, String envhum,
			String chargesource, String supplyceel, String loadvoltage1, String loadcurrent1, String loadvoltage2,
			String loadcurrent2, String loadvoltage3, String loadcurrent3, String loadvoltage4, String loadcurrent4,
			String loadvoltage5, String loadcurrent5, String innerstatus1, String innervalue1, String innerstatus2,
			String innervalue2, String innerstatus3, String innervalue3, String innerstatus4, String innervalue4,
			String electricfield, String groundresistance, String flagdoor, String flagIR, String flagwater,
			String flaglight, String flagSD, String recvdatatime, String devno, String ac, String voltagesolarceel,
			String chargevoltage, String chargecurrent, String supplyvoltage, String supplycurrent, Station station) {
		this.stationId = stationId;
		this.powerstatus = powerstatus;
		this.devtemp = devtemp;
		this.envtemp = envtemp;
		this.envhum = envhum;
		this.chargesource = chargesource;
		this.supplyceel = supplyceel;
		this.loadvoltage1 = loadvoltage1;
		this.loadcurrent1 = loadcurrent1;
		this.loadvoltage2 = loadvoltage2;
		this.loadcurrent2 = loadcurrent2;
		this.loadvoltage3 = loadvoltage3;
		this.loadcurrent3 = loadcurrent3;
		this.loadvoltage4 = loadvoltage4;
		this.loadcurrent4 = loadcurrent4;
		this.loadvoltage5 = loadvoltage5;
		this.loadcurrent5 = loadcurrent5;
		this.innerstatus1 = innerstatus1;
		this.innervalue1 = innervalue1;
		this.innerstatus2 = innerstatus2;
		this.innervalue2 = innervalue2;
		this.innerstatus3 = innerstatus3;
		this.innervalue3 = innervalue3;
		this.innerstatus4 = innerstatus4;
		this.innervalue4 = innervalue4;
		this.electricfield = electricfield;
		this.groundresistance = groundresistance;
		this.flagdoor = flagdoor;
		this.flagIR = flagIR;
		this.flagwater = flagwater;
		this.flaglight = flaglight;
		this.flagSD = flagSD;
		this.recvdatatime = recvdatatime;
		this.devno = devno;
		this.ac = ac;
		this.voltagesolarceel = voltagesolarceel;
		this.chargevoltage = chargevoltage;
		this.chargecurrent = chargecurrent;
		this.supplyvoltage = supplyvoltage;
		this.supplycurrent = supplycurrent;
	}
	
	

	public  void t(PowerData d) {
		this.stationId = d.getStation().getId();
		this.powerstatus = d.getPowerstatus();
		this.devtemp = d.getDevtemp();
		this.envtemp = d.getEnvtemp();
		this.envhum = d.getEnvhum();
		this.chargesource = d.getChargesource();
		this.supplyceel = d.getSupplyceel();
		this.loadvoltage1 = d.getLoadvoltage1();
		this.loadcurrent1 = d.getLoadcurrent1();
		this.loadvoltage2 = d.getLoadvoltage2();
		this.loadcurrent2 = d.getLoadcurrent2();
		this.loadvoltage3 = d.getLoadvoltage3();
		this.loadcurrent3 = d.getLoadcurrent3();
		this.loadvoltage4 = d.getLoadvoltage4();
		this.loadcurrent4 = d.getLoadcurrent4();
		this.loadvoltage5 = d.getLoadvoltage5();
		this.loadcurrent5 = d.getLoadcurrent5();
		this.innerstatus1 = d.getInnerstatus1();
		this.innervalue1 = d.getInnervalue1();
		this.innerstatus2 = d.getInnerstatus2();
		this.innervalue2 = d.getInnervalue2();
		this.innerstatus3 = d.getInnerstatus3();
		this.innervalue3 = d.getInnervalue3();
		this.innerstatus4 = d.getInnerstatus4();
		this.innervalue4 = d.getInnervalue4();
		this.electricfield = d.getElectricfield();
		this.groundresistance = d.getGroundresistance();
		this.flagdoor = d.getFlagdoor();
		this.flagIR = d.getFlagIR();
		this.flagwater = d.getFlagwater();
		this.flaglight = d.getFlaglight();
		this.flagSD = d.getFlagSD();
		this.recvdatatime = d.getRecvdatatime();
		this.devno = d.getDevno();
		this.ac = d.getAc();
		this.voltagesolarceel = d.getVoltagesolarceel();
		this.chargevoltage = d.getChargevoltage();
		this.chargecurrent = d.getChargecurrent();
		this.supplyvoltage = d.getSupplyvoltage();
		this.supplycurrent = d.getSupplycurrent();
		this.pingstatus = d.getPingstatus();
		this.thdccminvalue = d.getThdccminvalue();
	}


	public String getPingstatus() {
		return pingstatus;
	}



	public void setPingstatus(String pingstatus) {
		this.pingstatus = pingstatus;
	}



	public String getThdccminvalue() {
		return thdccminvalue;
	}



	public void setThdccminvalue(String thdccminvalue) {
		this.thdccminvalue = thdccminvalue;
	}



	public String getD() {
		return d;
	}



	public void setD(String d) {
		this.d = d;
	}



	public String getStationId() {
		return stationId;
	}

	public void setStationId(String stationId) {
		this.stationId = stationId;
	}

	public String getDevtemp() {
		return devtemp;
	}

	public void setDevtemp(String devtemp) {
		this.devtemp = devtemp;
	}

	public String getEnvtemp() {
		return envtemp;
	}

	public void setEnvtemp(String envtemp) {
		this.envtemp = envtemp;
	}

	public String getEnvhum() {
		return envhum;
	}

	public void setEnvhum(String envhum) {
		this.envhum = envhum;
	}

	public String getChargesource() {
		return chargesource;
	}

	public void setChargesource(String chargesource) {
		this.chargesource = chargesource;
	}

	public String getSupplyceel() {
		return supplyceel;
	}

	public void setSupplyceel(String supplyceel) {
		this.supplyceel = supplyceel;
	}

	public String getLoadvoltage1() {
		return loadvoltage1;
	}

	public void setLoadvoltage1(String loadvoltage1) {
		this.loadvoltage1 = loadvoltage1;
	}

	public String getLoadcurrent1() {
		return loadcurrent1;
	}

	public void setLoadcurrent1(String loadcurrent1) {
		this.loadcurrent1 = loadcurrent1;
	}

	public String getLoadvoltage2() {
		return loadvoltage2;
	}

	public void setLoadvoltage2(String loadvoltage2) {
		this.loadvoltage2 = loadvoltage2;
	}

	public String getLoadcurrent2() {
		return loadcurrent2;
	}

	public void setLoadcurrent2(String loadcurrent2) {
		this.loadcurrent2 = loadcurrent2;
	}

	public String getLoadvoltage3() {
		return loadvoltage3;
	}

	public void setLoadvoltage3(String loadvoltage3) {
		this.loadvoltage3 = loadvoltage3;
	}

	public String getLoadcurrent3() {
		return loadcurrent3;
	}

	public void setLoadcurrent3(String loadcurrent3) {
		this.loadcurrent3 = loadcurrent3;
	}

	public String getLoadvoltage4() {
		return loadvoltage4;
	}

	public void setLoadvoltage4(String loadvoltage4) {
		this.loadvoltage4 = loadvoltage4;
	}

	public String getLoadcurrent4() {
		return loadcurrent4;
	}

	public void setLoadcurrent4(String loadcurrent4) {
		this.loadcurrent4 = loadcurrent4;
	}

	public String getLoadvoltage5() {
		return loadvoltage5;
	}

	public void setLoadvoltage5(String loadvoltage5) {
		this.loadvoltage5 = loadvoltage5;
	}

	public String getLoadcurrent5() {
		return loadcurrent5;
	}

	public void setLoadcurrent5(String loadcurrent5) {
		this.loadcurrent5 = loadcurrent5;
	}

	public String getInnerstatus1() {
		return innerstatus1;
	}

	public void setInnerstatus1(String innerstatus1) {
		this.innerstatus1 = innerstatus1;
	}

	public String getInnervalue1() {
		return innervalue1;
	}

	public void setInnervalue1(String innervalue1) {
		this.innervalue1 = innervalue1;
	}

	public String getInnerstatus2() {
		return innerstatus2;
	}

	public void setInnerstatus2(String innerstatus2) {
		this.innerstatus2 = innerstatus2;
	}

	public String getInnervalue2() {
		return innervalue2;
	}

	public void setInnervalue2(String innervalue2) {
		this.innervalue2 = innervalue2;
	}

	public String getInnerstatus3() {
		return innerstatus3;
	}

	public void setInnerstatus3(String innerstatus3) {
		this.innerstatus3 = innerstatus3;
	}

	public String getInnervalue3() {
		return innervalue3;
	}

	public void setInnervalue3(String innervalue3) {
		this.innervalue3 = innervalue3;
	}

	public String getInnerstatus4() {
		return innerstatus4;
	}

	public void setInnerstatus4(String innerstatus4) {
		this.innerstatus4 = innerstatus4;
	}

	public String getInnervalue4() {
		return innervalue4;
	}

	public void setInnervalue4(String innervalue4) {
		this.innervalue4 = innervalue4;
	}

	public String getElectricfield() {
		return electricfield;
	}

	public void setElectricfield(String electricfield) {
		this.electricfield = electricfield;
	}

	public String getGroundresistance() {
		return groundresistance;
	}

	public void setGroundresistance(String groundresistance) {
		this.groundresistance = groundresistance;
	}

	public String getFlagdoor() {
		return flagdoor;
	}

	public void setFlagdoor(String flagdoor) {
		this.flagdoor = flagdoor;
	}

	public String getFlagIR() {
		return flagIR;
	}

	public void setFlagIR(String flagIR) {
		this.flagIR = flagIR;
	}

	public String getFlagwater() {
		return flagwater;
	}

	public void setFlagwater(String flagwater) {
		this.flagwater = flagwater;
	}

	public String getFlaglight() {
		return flaglight;
	}

	public void setFlaglight(String flaglight) {
		this.flaglight = flaglight;
	}

	public String getFlagSD() {
		return flagSD;
	}

	public void setFlagSD(String flagSD) {
		this.flagSD = flagSD;
	}

	public String getRecvdatatime() {
		return recvdatatime;
	}

	public void setRecvdatatime(String recvdatatime) {
		this.recvdatatime = recvdatatime;
	}

	public String getDevno() {
		return devno;
	}

	public void setDevno(String devno) {
		this.devno = devno;
	}

	public String getAc() {
		return ac;
	}

	public void setAc(String ac) {
		this.ac = ac;
	}

	public String getVoltagesolarceel() {
		return voltagesolarceel;
	}

	public void setVoltagesolarceel(String voltagesolarceel) {
		this.voltagesolarceel = voltagesolarceel;
	}

	public String getChargevoltage() {
		return chargevoltage;
	}

	public void setChargevoltage(String chargevoltage) {
		this.chargevoltage = chargevoltage;
	}

	public String getChargecurrent() {
		return chargecurrent;
	}

	public void setChargecurrent(String chargecurrent) {
		this.chargecurrent = chargecurrent;
	}

	public String getSupplyvoltage() {
		return supplyvoltage;
	}

	public void setSupplyvoltage(String supplyvoltage) {
		this.supplyvoltage = supplyvoltage;
	}

	public String getSupplycurrent() {
		return supplycurrent;
	}

	public void setSupplycurrent(String supplycurrent) {
		this.supplycurrent = supplycurrent;
	}

	public Station getStation() {
		return station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public String getPowerstatus() {
		return powerstatus;
	}

	public void setPowerstatus(String powerstatus) {
		this.powerstatus = powerstatus;
	}
}
