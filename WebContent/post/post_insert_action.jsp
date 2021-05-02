<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
	String post_name = request.getParameter("post_name");
	String post_pw = request.getParameter("post_pw");
	String post_subject = request.getParameter("post_subject");
	String post_content = request.getParameter("post_content");
	String post_file = request.getParameter("post_file");
	System.out.println(post_name + "<-- m_id /minsert/m_insert_pro.jsp");
	System.out.println(post_pw + "<-- m_pw /minsert/m_insert_pro.jsp");
	System.out.println(post_subject + "<-- m_level /minsert/m_insert_pro.jsp");
	System.out.println(post_content + "<-- m_name /minsert/m_insert_pro.jsp");
	System.out.println(post_file + "<-- m_email /minsert/m_insert_pro.jsp");
//화면에서 입력자료 받아서 콘솔창에 출력 끝	
	//JDBC 프로그램 순서
	//01단계 :드라이버 로딩 시작
	Class.forName("com.mysql.jdbc.Driver");
	//01단계 :드라이버 로딩 끝
	
	try{
//02단계 :DB연결(Connection)시작
		String jdbcDriver = "jdbc:mysql://localhost:3306/test?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "testid";
		String dbPass = "testpw";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn");
		System.out.println(conn.getClass() + "<-- conn.getClass()");
		
		
//02단계 :DB연결(Connection)끝
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_post VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
//insert into tb_member values('id001','pw001','관리자','홍01','email01');
		pstmt.setString(1, post_name);
		pstmt.setString(2, post_pw);
		pstmt.setString(3, post_subject);
		pstmt.setString(4, post_content);
		pstmt.setString(5, post_file); // 아직 구현 불가능

		System.out.println(pstmt + "<-- pstmt 2");
		
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 끝
//04단계 :Query실행 시작
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
//04단계 :Query실행 끝
//05단계 :Query실행결과 사용 (insert의 경우 생략 가능단계)

	}finally{
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>