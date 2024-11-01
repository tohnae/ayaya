package com.example.ayaya;

import java.sql.*;
import java.util.ArrayList;

public class DB {
    private final String HOST = "10.207.144.159";
    private final String PORT = "3306";
    private final String DB_NAME = "user060_user1";
    private final String LOGIN = "user060"; // Если OpenServer, то здесь mysql напишите
    private final String PASS = "70144"; // Если OpenServer, то здесь mysql напишите

    private Connection dbConn = null;
    private Connection getDbConnection() throws ClassNotFoundException, SQLException {
        String connStr = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME+"?characterEncoding=UTF8";
        Class.forName("com.mysql.cj.jdbc.Driver");

        dbConn = DriverManager.getConnection(connStr, LOGIN, PASS);
        return dbConn;
    }
    public void insertStudent(String fam) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO student (fio) VALUES (?)";

        PreparedStatement prSt = getDbConnection().prepareStatement(sql);
        prSt.setString(1, fam);

        prSt.executeUpdate();

    }
    public ArrayList<String> getStudent() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM student ORDER BY `id` DESC";

        Statement statement = getDbConnection().createStatement();
        ResultSet res = statement.executeQuery(sql);

        ArrayList<String> stud = new ArrayList<>();
        while(res.next())
            stud.add(res.getString("fio"));

        return stud;
    }
    public int getStudent(String fam) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM student where fio='"+fam+"' ORDER BY `id` DESC";

        Statement statement = getDbConnection().createStatement();
        ResultSet res = statement.executeQuery(sql);

        int id = 0;
        while(res.next())
            id=res.getInt("id");

        return id;
    }
}