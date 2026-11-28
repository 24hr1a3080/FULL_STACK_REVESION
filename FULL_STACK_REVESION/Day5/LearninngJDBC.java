package Day5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class LearninngJDBC {
  public static void main(String[] args) {
    String url="jdbc:mysql://localhost:3306/Learned";
    String name="root";
    String password="password@123";
    try{
      Connection con = DriverManager.getConnection(url,name,password);
      System.out.println("connection successsful");
      Scanner sc = new Scanner(System.in);
      String query="insert into student values (?,?,?,?)";
      PreparedStatement ps=con.prepareStatement(query);
      while(true){
        System.out.println("Enter student id:");
        int id = sc.nextInt();
        System.out.println("Enter name of student:");
        sc.nextLine();
        String str =sc.nextLine();
        System.out.println("Enter department :");
        String dep=sc.nextLine();
        System.out.println("Enter the age:");
        int age = sc.nextInt();
        ps.setInt(1, id);
        ps.setString(2, str);
        ps.setString(3, dep);
        ps.setInt(4, age);
        ps.executeUpdate();
        
      }
    }catch(Exception e){
      System.out.println("error in connection");
    }

  }
  
}
