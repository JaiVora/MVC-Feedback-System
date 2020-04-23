/*
 * Author: Jai Vora
 * StudentDAO.java establishes a connection with the DB to store and retrieve information*/
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	StudentBean sB = new StudentBean();
	public StudentDAO(StudentBean sB) {
		this.sB = sB;
	}
	public List<String> storeData() {
		List<String> si = new ArrayList<String>();
		try {
			Class.forName ("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection (
					"jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu",
					"jvora", "psuthyxe");
			DatabaseMetaData metadata = con.getMetaData();
			ResultSet resultSet;resultSet = metadata.getTables(null, null, "STUDENT", null);
			if(!(resultSet.next())) {
				Statement smt=con.createStatement();
				String q="create table student(UNAME varchar(45),STREETADDRESS varchar(45), ZIP varchar(45),CITY varchar(45),STATE varchar(45),PHONENUMBER varchar(45),EMAIL varchar(45),URL varchar(45),DATE_Y varchar(45),INTEREST varchar(45),COMMENTS varchar(45),MONTH varchar(45), YEAR varchar(45), LIKELIHOOD varchar(45), STUDENTID varchar(45),KNOW1 varchar(45))";
				smt.executeUpdate(q);
			}
			PreparedStatement pstmt = con.prepareStatement("insert into student(UNAME,STREETADDRESS,ZIP,CITY,STATE,PHONENUMBER,EMAIL,URL,DATE_Y,INTEREST,COMMENTS,MONTH,YEAR,LIKELIHOOD,STUDENTID,KNOW1) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, sB.getUsername());
            pstmt.setString(2, sB.getAddress());
            pstmt.setString(3, sB.getZip());
            pstmt.setString(4, sB.getCity());
            pstmt.setString(5, sB.getState());
            pstmt.setString(6, sB.getPhone());
            pstmt.setString(7, sB.getEmail());
            pstmt.setString(8, sB.getLink());
            pstmt.setString(9, sB.getDate());
            pstmt.setString(10, sB.getInterest());
            pstmt.setString(11, sB.getComment());
            pstmt.setString(12, sB.getMonth());
            pstmt.setString(13, sB.getYear());
            pstmt.setString(14, sB.getLikelihood());
            pstmt.setString(15, sB.getStudentId());
            pstmt.setString(16,sB.getCs());
            pstmt.executeUpdate();
            pstmt.close();
            pstmt = con.prepareStatement("select STUDENTID from student");
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                si.add(rs.getString("studentid"));
            }	
            return si;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return si;
	}
	public StudentBean retrieveData(String studentid){
		StudentBean sb = new StudentBean();
		try {
			Class.forName ("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection (
					"jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu",
					"jvora", "psuthyxe");
			PreparedStatement pstmt = con.prepareStatement("select * from student where STUDENTID=?");
            pstmt.setString(1, studentid);
            ResultSet rs = pstmt.executeQuery();
            int i = 0;
            
            while(rs.next()) {
                ++i;
                sb.setUsername(rs.getString("UNAME"));
                sb.setAddress(rs.getString("STREETADDRESS"));
                sb.setZip(rs.getString("ZIP"));
                sb.setCity(rs.getString("CITY"));
                sb.setState(rs.getString("STATE"));
                sb.setPhone(rs.getString("PHONENUMBER"));
                sb.setEmail(rs.getString("EMAIL"));
                sb.setLink(rs.getString("URL"));
                sb.setDate(rs.getString("DATE_Y"));
                sb.setInterest(rs.getString("Interest"));
                sb.setComment(rs.getString("Comments"));
                sb.setMonth(rs.getString("MONTH"));
                sb.setYear(rs.getString("YEAR"));
                sb.setLikelihood(rs.getString("LIKELIHOOD"));
                sb.setStudentId(rs.getString("STUDENTID"));
                sb.setCs(rs.getString("KNOW1"));
                
             }

            pstmt.close();
            con.close();
            return i > 0 ? sb : null;
        }
		catch (Exception var10) {
            var10.printStackTrace();
            return null;
        }
	}	
}
