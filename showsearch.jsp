
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="control.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> All Property | Knect</title>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/main.css" rel="stylesheet">
            <link href="css/shape.css" rel="stylesheet">
            <link rel="shortcut icon" href="images/ico/favicon.ico">
            <link rel="stylesheet" href="css/modal.css">
        
     <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
    </head>
    <body>
        <h1>Your search results</h1>
        
        <%!
            public class Prop
            {
                String URL="jdbc:mysql://localhost:3306/project4?useSSL=false";
                String USERNAME="root";
                String PASSWORD="2123";

                Connection connection=null;
                PreparedStatement selectProps=null;
                ResultSet resultSet=null;

                public Prop()
                {
                    try{
                        connection=DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        selectProps=connection.prepareStatement("Select *"
                                                               +"from site"
                                                               +"where Price<=?"
                                                               +"and BedRoom=?"
                                                               +"and Bathroom=?");
                        }
                       catch(SQLException e)
                        {
                            e.printStackTrace();
                        }
                }
                 public ResultSet getProps(String Price,String BedRoom,String BathRoom)
                {
                    try{
                        selectProps.setString(1, Price);
                        selectProps.setString(2, BedRoom);
                        selectProps.setString(3, BathRoom);
                        resultSet=selectProps.executeQuery();
                        }
                       catch(SQLException e)
                        {
                            e.printStackTrace();
                        }
                       return resultSet;
                }       
            }       
        %>
        
        <%
                String price=new String();
                String bedroom=new String();
                String bathroom=new String();
                if(request.getParameter("Price")!=null)
                {
                    price=request.getParameter("Price");
                }
                if(request.getParameter("BedRoom")!=null)
                {
                    bedroom=request.getParameter("BedRoom");
                }
                if(request.getParameter("BathRoom")!=null)
                {
                    bathroom=request.getParameter("BathRoom");
                }
                Prop prop=new Prop();
                ResultSet props=prop.getProps(price,bedroom,bathroom);
         %>
         <table border="1">
             <tbody>
                 <tr>
                     <td>Site_Name</td>
                     <td>Location</td>
                     <td>Price</td>
                     <td>Area</td>
                     <td>BedRoom</td>
                     <td>BathRoom</td>
                 </tr>
                 <% while (props.next()){ %>
                <tr>
                     <td><%= props.getString("Site_Name")%></td>
                     <td><%= props.getString("Location")%></td>
                     <td><%= props.getString("Price")%></td>
                     <td><%= props.getString("Area")%></td>
                     <td><%= props.getString("BedRoom")%></td>
                     <td><%= props.getString("Bathroom")%></td>
                 </tr>
                 %> } %>
             </tbody>
         </table>
    </body>
</html>
