package com.icoding.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.icoding.domain.Report;
import com.icoding.dto.ReportAcademicYear;

@Repository
public class ReportDaoImpl extends GenericDaoImpl<Report, Integer> implements
		ReportDao {

	private static final Logger logger = LoggerFactory
			.getLogger(ReportDaoImpl.class);

	@Override
	public Boolean isReportExist(int studentId, String code) {
		Boolean flag = false;
		List<Report> listReports = getAll();
		for (Report report : listReports) {
			if (report.getProgram().getCode().equalsIgnoreCase(code)
					&& report.getStudent().getId() == studentId) {
				flag = true;
				break;
			}
		}
		return flag;
	}

	@Override
	public List<ReportAcademicYear> listReportsYear() {
		List<ReportAcademicYear> listReportYears = new ArrayList<ReportAcademicYear>();
		/*
		 * String sql =
		 * " Select p.academic_year as 'academicYear', count(-1) as 'numReport' "
		 * + " from program p, report r " + " where r.program = p.code " +
		 * " and r.isApproved= 'true' " + " group by p.academic_year ";
		 * listReportYears = currentSession() .createSQLQuery(sql)
		 * .addScalar("academicYear") .addScalar("numReport")
		 * .setResultTransformer(
		 * Transformers.aliasToBean(ReportAcademicYear.class)) .list();
		 */
		logger.debug("Size ne:" + listReportYears.size());
		// TODO Auto-generated method stub
		return listReportYears;
	}
}
