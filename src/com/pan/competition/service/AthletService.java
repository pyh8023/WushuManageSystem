package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Athlet;
import com.pan.competition.dao.AthletDao;

public class AthletService {

	AthletDao athletDao = new AthletDao();
	
	public List<Athlet> querAthlet(){
		List<Athlet> list = athletDao.queryAthlet();
		return list;
	}
}
