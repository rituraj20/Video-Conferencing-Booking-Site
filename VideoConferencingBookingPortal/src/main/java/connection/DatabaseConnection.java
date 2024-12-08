package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
public static Connection dbConnect() {
	String dbUrl="jdbc:derby:C:\\Users\\ritur\\MyDB;create=true";
	Connection con = null;
	try {
		Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
		con=DriverManager.getConnection(dbUrl);
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return con;
}
}

