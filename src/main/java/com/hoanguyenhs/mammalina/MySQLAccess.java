package com.hoanguyenhs.mammalina;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MySQLAccess {

	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;

	public ResultSet execute(String sql) {
		String url = "jdbc:mysql://127.10.35.130:3306/"; // 127.10.35.130:3306 - localhost:3306
		String db = "mammalina" + "?"; //
		String username = "user=" + "adminb9I1Nl7"; // adminb9I1Nl7 - root
		String password = "&password=" + "8fVeXPP9ZiNv"; // 8fVeXPP9ZiNv - root
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(url + db + username + password);
			preparedStatement = connect.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//close();
		}
		return resultSet;
	}

	public void close() {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (statement != null) {
				statement.close();
			}
			if (connect != null) {
				connect.close();
			}
		} catch (Exception e) {
		}
	}

}
