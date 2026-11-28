import java.sql.*;

public class D6T1 {
  public static void main(String[] args) {
    String url="jdbc:mysql://localhost:3306/day5";
    String username="root";
    String password="password@123";
    try{
      Connection con=DriverManager.getConnection(url,username,password);
      System.out.println("connection successful");
      // Scanner sc = new Scanner(System.in);
      // String query="insert into students values(?,?,?,?,?)";
      // System.out.println("enter id:");
      // int id=sc.nextInt();
      // sc.nextLine();

      // System.out.println("enter name:");
      // String student_name=sc.nextLine();

      // System.out.println("enter age:");
      // int age=sc.nextInt();
      // sc.nextLine();

      // System.out.println("eneter department:");
      // String dep=sc.nextLine();

      // System.out.println("enetr email:");
      // String email=sc.nextLine();
      String query="select * from students";
      PreparedStatement ps=con.prepareStatement(query);
      // ps.setInt(1, id);
      // ps.setString(2, student_name);
      // ps.setInt(3,age );
      // ps.setString(4, dep);
      // ps.setString(5, email);

      // ps.executeUpdate();
      System.out.println("data insertion successful");
      
      ResultSet rs=ps.executeQuery();
      while(rs.next()){
          System.out.println(   rs.getInt("student_id") + " " +
          rs.getString("student_name") + " " +
          rs.getInt("age") + " " +
          rs.getString("department") + " " +
          rs.getString("email"));
            }

      // sc.close();
      con.close();
    }catch (Exception e){
      System.out.println(e);
    }
  }
}