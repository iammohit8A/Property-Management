<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="control.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ckeditor.samples.ConfigurationHelper"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>

<!DOCTYPE html>

<html>    
    <head>        
            <title> HOME | K-Nect</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/main.css" rel="stylesheet">
            <link href="css/shape.css" rel="stylesheet">
            <link rel="shortcut icon" href="images/ico/favicon.ico">
            <link rel="stylesheet" href="css/modal.css">        
            <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">                   
            <script src="js/jquery.js"></script>
            <script src="js/bootstrap.min.js"></script> 
            <script src="js/jquery-2.1.1.min.js"></script>
            <script src="js/jquery.cycle2.min.js"></script>
    </head>
    
    <body class="b1">
        <header>
         <nav class="navbar navbar-inverse navbar-fixed-top" role="banner" >
            <div class="container">
                <div class="navbar-header">
                   
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="images/logo2.png" alt="logo"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right ">
                    
               
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="showproperty.jsp">Show Property</a></li> 
                        <li><a href="Login.jsp">Login</a></li>
                        <li><a href="registration.html">Sign Up</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#add_project1">Feedback</a></li> 
                                               
                    </ul>
                </div>
            </div><!--/.container-->
        </nav>
    </header>
        


    

        
        <div id="wrap" style="position:absolute; margin-top:-6%;">
	 <div id="slideshow" class="cycle-slideshow" 
		 data-cycle-fx="turnLeft" 
		 data-cycle-manual-fx="scrollLeft" 
		 data-cycle-pager-fx = "fadeZoom" 
		 data-cycle-manual-speed="500"
		 data-cycle-prev="#prev"  	
		 data-cycle-next="#next"
		 data-cycle-speed="650"  
		 data-cycle-timeout="4000" 
		 data-cycle-pager = "#pager" 
		 data-cycle-pager-template="<a><img src='{{src}}' id='p2'></a>" > 
	      
	        <img src="images/slider/home-inside-1.jpg"/>
	        <img src="images/slider/showcase.jpg" id="intro_img"/>
	        <img src="images/slider/building.jpg" id="intro_img"/>
	      

            </div>
        <div id="pager"></div>
        <div id="backDiv">
            
            <img id="prev" src="images/ARROW_BACK.png" alt="Previous"/>
            
        	
        </div>
        
        <div id="nextDiv">
        	            
            <img id="next" src="images/ARROW_NEXT.png" alt="Next"/>

        </div>
            
</div>
        <div  id="p3" >
            <span  id="tag1"> You Can Buy Most <br></span>
            <span id="tag1"> Beautiful Property With<br> </span>
                   <span id="tag1">Such Simple Steps !!!<br></span>
            
</div>
                   
        
       
       <div class="container-fluid row"  id="p5">
           <hr>
           <h1><u>Why Choose Our Site</u></h1>
           <div class="col-md-4">
                <img src="images/85.png" height="80" weight="60">
               <h3>User Profiles</h3>
               <p>You can sell your property using K-Nect !!</p>
               
           </div>
           <div class="col-md-4">
                <img src="images/Brand_Protection-512.png" height="80" weight="60">
               <h3>Buyers Trust Us</h3>
               <p>12 million users visit us every month for their buying and renting need.</p>
               
           </div>
               <div class="col-md-4">
                <img src="images/i.png" height="80" weight="60">
               <h3>Seller Prefer Us</h3>
               <p>New properties are posted daily, making us the biggest plateform to sell & rent properties</p>
               
           </div>
          
        </div>
              
        <div class="  col-md-12"  id="o5">
            <hr>
            <p id="o5p"><b><u>RECENT ADDED PROPERTY</u></b></p>
            <%
                    Connection con;
                    con=ConnectDB.connect();
                    Statement st=con.createStatement();
                                String phl; int i=0,sn;
                                ResultSet   rs,rs1;
                                rs=st.executeQuery("select * from site Where S_no = (SELECT MAX(S_no) from site)");
                              
                              Boolean b;
                              b=rs.next();
                                  sn=rs.getInt("S_no");
                              do
                              {
                                  rs1=st.executeQuery("select * from site Where S_no = '"+sn+"'");
                                  b=rs1.next();
                                  if(i==4){
                                      break;
                                  }
                                  if(b==true)
                                  {
                                      
                                  phl="images/"+rs1.getString("Photo");
                              %>
            
            <div class="col-md-3 col-sm-6 "  id="o6" >
                
                <img src="<%=phl%>" height="270" width="260" class="img-responsive">
                <h3 style="font-weight:900;"><%=rs1.getString("Site_name")%></h3>
                <%=rs1.getString("Location")%><br>
                <span style="font-weight:100;"><%=rs1.getString("Address")%></span><br>
                <p><%=rs1.getInt("Area")%> <b> Area(in Sq.Ft) | </b><%=rs1.getInt("BedRoom")%><b> BedRoom's <br> </b> <%=rs1.getInt("BathRoom")%> <b>BathRoom</b></p>
                <p> <img src="images/in.png" height="20" weight="20"><b><%=rs1.getInt("Price")%></b> <b>/-</b></p>
                 <form action='ShowDetailf.jsp' method='post'>
                    <Button type="submit" value="<%=rs1.getString("Site_Name")%>" name="detail" style="background:#5383d3; color:white;">See Details</button></form>
                
                </div>
                
            <%
                 i++;}sn--;
                              }while(true);
                %>
                
                <a href="showproperty.jsp"><input type="button" class=" btn btn-info" style="color:rgb(48, 88, 148)" value="Show All Property" ></a>
                            
        </div>
        
       <br>
<div class="carousel-reviews broun-block">
    <div class="container">
        <div class="row">
             <div class="row" style="text-align:center; color:white; font-size:35px; padding-top:20px;">
		
                 <p id="o5p"><b><u>User's Feedback</u></b></p>
	</div>
            <div id="carousel-reviews" class="carousel slide" data-ride="carousel">
           
                <div class="carousel-inner">
                    <div class="item active">
                	    <div class="col-md-4 col-sm-6" >
        				    <div class="block-text rel zmin" style="text-align:center;">
						        
                                <p >Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br>
                                
                                    <img src="images/user_avatar-blank.jpg" style="border-radius: 50%; " /><br>
								<a title="" href="#">Mohit</a> 
                                </p>
							    
					        </div>
							
						</div>
            			<div class="col-md-4 col-sm-6 hidden-xs" style="text-align:center;">
						    <div class="block-text rel zmin">
						        
        						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br>
                                <img src="images/user_avatar-blank.jpg" style="border-radius: 50%;"/><br>
						        <a title="" href="#">Aditi</a>
                                </p>
					           
				            </div>
							
						</div>
						<div class="col-md-4 col-sm-6 hidden-sm hidden-xs">
							<div class="block-text rel zmin" style="text-align:center;">
								
    							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br>
                                <img src="images/user_avatar-blank.jpg" style="border-radius: 50%;"/><br>
                                    <a title="" href="#">Riya</a>
                                
                                </p>
								
							</div>
							
						</div>
                    </div>
                    
                     <div class="item ">
                	    <div class="col-md-4 col-sm-6">
        				    <div class="block-text rel zmin" style="text-align:center;">
						        
						        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br>  
                                <img alt="" src="images/user_avatar-blank.jpg" style="border-radius: 50%;" /><br>
								<a title="" href="#">Sagar</a>
                                </p>
							    
					        </div>
							
						</div>
            			<div class="col-md-4 col-sm-6 hidden-xs">
						    <div class="block-text rel zmin" style="text-align:center;">
						        
        						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br> 
                                <img alt="" src="images/user_avatar-blank.jpg" style="border-radius: 50%;" /><br>
						        <a title="" href="#">Ankit</a>
                                </p>
					           
				            </div>
							
						</div>
						<div class="col-md-4 col-sm-6 hidden-sm hidden-xs">
							<div class="block-text rel zmin" style="text-align:center;">
								
    							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br> 
                                <img src="images/user_avatar-blank.jpg" style="border-radius: 50%;"/><br>
                                    <a title="" href="#">Piyush</a>
                                
                                </p>
								
							</div>
							
						</div>
                    </div>
                    
                 
                </div>
               
            </div>
        </div>
    </div>
</div> 
         
     <footer class="footer-distributed">
         
			<div class="footer-left">

				<h3>K-<span>Nect</span></h3>

				<p class="footer-links">
					<a href="index.jsp">Home</a>
					.
                    <a href="about.html">About us</a>
					.
					<a href="Login.jsp">Login</a>
					.
					<a href="registration.html">Sign Up</a>
					.
					<a href="#" data-toggle="modal" data-target="#add_project1">FeedBack</a>
					.
                    <a href="terms.html">T&C</a>
				</p>

				<p class="footer-company-name">KNECT &copy; 2019</p>
			</div>

			<div class="footer-center">

				<div style="margin-bottom:5px;">
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="font-weight:900; font-size:30px;"></span>
					<p><span> Dhankawadi</span> Pune, India</p>
				</div>

				

				<div style="margin-bottom:5px;">
					<span class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-weight:900; font-size:20px;"></span>
					<p><a href="mailto:support@company.com">Knect@gmail.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>About the company</span>
					Knect is India's No 1 Property portal and has been adjudged as the most preferred property site in India, by independent surveys. 
				</p>

				<div class="footer-icons">

					<a href="#"><img src="images/fb.png" height="20" width="15"></a>
					<a href="#"><img src="images/goo.png" height="20" width="20"></a>
					<a href="#"><img src="images/tw.png" height="30" width="30"></a>
					<a href="#"><img src="images/li.png" height="30" width="30"></a>

				</div>

			</div>

		</footer>
   
                      
    <!-- Modal -->
    <div id="add_project1" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal" style="color:white;">?</button>
                    <h4 class="modal-title">Give Your Site FeedBack</h4>
                </div>
                <form action="feedback" method="post" >
                <div class="modal-body " >
                    <input type="text" required="" placeholder="Enter Your Name" name="fname" style="width:100%;" >
                    <input type="email" required=""  placeholder="Enter Your Email" name="femail" style="width:100%;" >
                           <input type="text" required=""  placeholder="Enter Your Mobile Number" name="fnumber" style="width:100%;" >
                      <textarea id="editor5"  placeholder="Your FeedBack" name="fmessage" rows="5"></textarea>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="cancel" data-dismiss="modal">Close</button>
                    <button type="submit" class="add-project" >Save</button>
                </div>
                </form>
            </div>

        </div>
    </div>
                             

    </body>

    <ckeditor:replace replace="editor5" basePath="ckeditor/"
   config="<%= ConfigurationHelper.createConfig() %>" />
    
    
</html>
