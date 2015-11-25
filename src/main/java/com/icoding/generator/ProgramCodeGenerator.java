package com.icoding.generator;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class ProgramCodeGenerator implements IdentifierGenerator {

	private String defaultPrefix = "P";
	private int defaultNumber = 1;

	@Override
	public Serializable generate(SessionImplementor session, Object object)
			throws HibernateException {
		String programId = "";
		String digits = "";
		Connection connection = session.connection();
		try {
			PreparedStatement ps = connection
					.prepareStatement("SELECT code from program order by code desc limit 1");
			ResultSet rs = ps.executeQuery();
			if (rs != null && rs.next()) {
				programId = rs.getString("code");
				String prefix = programId.substring(0, 1);
				String str[] = programId.split(prefix);
				digits = String.format("%06d", Integer.parseInt(str[1]) + 1);
				programId = prefix.concat(digits);
			} else {
				digits = String.format("%06d", defaultNumber);
				programId = defaultPrefix.concat(digits);
			}
		} catch (SQLException e) {
			/*
			 * throw new HibernateException(
			 * "Unable to generate Program Code Sequence");
			 */
			e.printStackTrace();
		}
		return programId;
	}

}
