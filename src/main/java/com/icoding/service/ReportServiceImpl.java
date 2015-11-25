package com.icoding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.GenericDao;
import com.icoding.dao.ReportDao;
import com.icoding.domain.Report;
import com.icoding.dto.ReportAcademicYear;

@Service
@Transactional
public class ReportServiceImpl extends GenericServiceImpl<Report, Integer>
		implements ReportService {

	@Autowired
	private ReportDao reportDao;

	@Override
	GenericDao<Report, Integer> getDao() {
		return reportDao;
	}

	@Override
	public Boolean isReportExist(int studentId, String code) {
		return reportDao.isReportExist(studentId, code);
	}

	@Override
	public List<ReportAcademicYear> listReportsYear() {
		return reportDao.listReportsYear();
	}

}
