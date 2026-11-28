package Day5;

import java.sql.*;
import java.util.Scanner;

public class D5T1{
  public static void main(String[] args){
  String url="jdbc:mysql://localhost:3306/Learned";
  String name="root";
  String password="password@123";


  try{
  Connection con=DriverManager.getConnection(url ,name, password );
  System.out.println("connection successful");
 // String query="insert into student values (101, 'sravan','cse',24);" ;
  String query="insert into student values (?,?,?,?)" ;
  PreparedStatement ps=con.prepareStatement(query);

  Scanner sc = new Scanner(System.in);

  ps.setInt(1,101 );
  ps.setString(2, "kishore");
  ps.setString(3,"eee");
  ps.setInt(4, 23);
  ps.executeUpdate();

  // Statement st=con.createStatement();
  // st.executeUpdate(query);
  con.close();
  sc.close();
  }catch(Exception e){
    System.out.println("something went wrong"+e);
  }
  }
}
