package com.example.ayaya;

import java.sql.*;

import static java.sql.DriverManager.getConnection;

public class DBUsers {
    private final String HOST = "10.207.144.159";
    private final String PORT = "3306";
    private final String DB_NAME = "user060_db1";
    private final String LOGIN = "user060_user1";// Если OpenServer, то здесь mysql напишите
    private final String PASS = "m_Nem7Ei"; // Если OpenServer, то здесь mysql напишите


    private Connection dbConn = null;
    private Connection getDbConnection() throws ClassNotFoundException, SQLException {
        String connStr = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME+"?characterEncoding=UTF8";
        Class.forName("com.mysql.cj.jdbc.Driver");

        dbConn = DriverManager.getConnection(connStr, LOGIN, PASS);
        return dbConn;
    }
    public void insertUsers(String log,String pass) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Users  VALUES (null,?,?,?,1)";

        PreparedStatement prSt = getDbConnection().prepareStatement(sql);
        prSt.setString(1, log);
        prSt.setString(2, pass);
        prSt.executeUpdate();

    }
    public int getUser(String log,String pass) throws SQLException, ClassNotFoundException {
        String sql = "SELECT typeID,count(*) as n FROM Users where login=? and password=? group by typeID";

        PreparedStatement statement = getDbConnection().prepareStatement(sql);
        statement.setString(1, log);
        statement.setString(2, pass);
        ResultSet res = statement.executeQuery();

        int coll = 0;
        int role=0;
        while(res.next()) {
            coll = res.getInt("n");
            role = res.getInt("typeID");
        }
        return role;
    }
}
