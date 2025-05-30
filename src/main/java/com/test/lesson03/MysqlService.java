package com.test.lesson03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
    private static MysqlService mysqlService = null;

    private static final String URL = "jdbc:mysql://localhost:3306/test_250120"; // 접속할 DB명까지 넣는다
    private static final String ID = "root";
    private static final String PASSWORD = "root";// 본인이 설정한 비밀번호를 작성한다.

    private Connection conn = null;
    private Statement statement;
    private ResultSet res;

    // Singleton 패턴: MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인 패턴(DB 연결을 여러 객체에서 하지 않도록)
    public static MysqlService getInstance() {
        if (mysqlService == null) {
            mysqlService =  new MysqlService();
        }
        return mysqlService;
    }

    public void connect() {
        try {
            // 1. 드라이버 메모리에 로딩
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

            // 2. DB connection
            conn = DriverManager.getConnection(URL, ID, PASSWORD);

            // 3. statement: DB와 쿼리를 실행하기 위한 준비
            statement = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void disconnect() {
        try {
            // 연결 끊기
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet select(String query) throws SQLException {
        res = statement.executeQuery(query);
        return res;
    }

    public void update(String query) throws SQLException {
        statement.executeUpdate(query);
    }
}