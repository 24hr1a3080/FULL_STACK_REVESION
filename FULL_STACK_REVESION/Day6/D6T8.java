import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.Scanner;

public class D6T8 {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/library_db";

        String username = "root";

        String password = "Varshini@3080";

        try {

            Connection con = DriverManager.getConnection(url, username, password);

            System.out.println("connection successful");

            String query1 = "select * from books";

            PreparedStatement ps1 = con.prepareStatement(query1);

            ResultSet rs = ps1.executeQuery();

            while(rs.next()){

                System.out.println(

                        rs.getInt("book_id") + " " +

                        rs.getString("book_name") + " " +

                        rs.getString("author") + " " +

                        rs.getString("category") + " " +

                        rs.getInt("available_copies")

                );

            }

            Scanner sc = new Scanner(System.in);

            System.out.println("enter book id");

            int book_id = sc.nextInt();

            System.out.println("enter new available copies");

            int available_copies = sc.nextInt();

            String query2 = "update books set available_copies=? where book_id=?";

            PreparedStatement ps2 = con.prepareStatement(query2);

            ps2.setInt(1, available_copies);

            ps2.setInt(2, book_id);

            int rows = ps2.executeUpdate();

            if(rows > 0){

                String query3 = "select * from books where book_id=?";

                PreparedStatement ps3 = con.prepareStatement(query3);

                ps3.setInt(1, book_id);

                ResultSet rs3 = ps3.executeQuery();

                while(rs3.next()){

                    System.out.println(

                            rs3.getInt("book_id") + " " +

                            rs3.getString("book_name") + " " +

                            rs3.getString("author") + " " +

                            rs3.getString("category") + " " +

                            rs3.getInt("available_copies")

                    );

                }

            } else {

                System.out.println("book id does not exist");

            }

            sc.close();

            con.close();

        } catch (Exception e) {

            System.out.println(e);

        }

    }

}

