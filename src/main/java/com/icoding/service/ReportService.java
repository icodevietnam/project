package com.icoding.service;

import java.util.List;

import com.icoding.domain.Report;
import com.icoding.dto.ReportAcademicYear;

public interface ReportService extends GenericService<Report, Integer> {
	Boolean isReportExist(int studentId,String code);
	List<ReportAcademicYear> listReportsYear();
}
