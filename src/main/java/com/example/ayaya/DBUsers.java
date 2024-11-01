package com.example.ayaya;

import java.sql.*;

import static java.sql.DriverManager.getConnection;

public class DBUsers {
    private final String HOST = "127.0.0.1";
    private final String PORT = "3306";
    private final String DB_NAME = "user060_db1";
    private final String LOGIN = "root"; // Если OpenServer, то здесь mysql напишите
    private final String PASS = "1111"; // Если OpenServer, то здесь mysql напишите

    private Connection dbConn = null;
    private Connection getDbConnection() throws ClassNotFoundException, SQLException {
        String connStr = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME+"?characterEncoding=UTF8";
        Class.forName("com.mysql.cj.jdbc.Driver");

        dbConn = DriverManager.getConnection(connStr, LOGIN, PASS);
        return dbConn;
    }
    public void insertUsers(String log,String pass) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO users  VALUES (null,?,?,1)";

        PreparedStatement prSt = getDbConnection().prepareStatement(sql);
        prSt.setString(1, log);
        prSt.setString(2, pass);
        prSt.executeUpdate();

    }
    public int getUser(String log,String pass) throws SQLException, ClassNotFoundException {
        String sql = "SELECT idrole,count(*) as n FROM users where login_us=? and password_us=? group by idrole";

        PreparedStatement statement = getDbConnection().prepareStatement(sql);
        statement.setString(1, log);
        statement.setString(2, pass);
        ResultSet res = statement.executeQuery();

        int coll = 0;
        int role=0;
        while(res.next()) {
            coll = res.getInt("n");
            role = res.getInt("idrole");
        }
        return role;
    }
}

