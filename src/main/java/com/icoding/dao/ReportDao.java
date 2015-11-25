package com.icoding.dao;

import java.util.List;

import com.icoding.domain.Report;
import com.icoding.dto.ReportAcademicYear;

public interface ReportDao extends GenericDao<Report, Integer> {
	Boolean isReportExist(int studentId, String code);

	List<ReportAcademicYear> listReportsYear();
}
