<% 
    if(session.getAttribute("id")!=null)
    {
        response.sendRedirect("home.jsp");
    }
%>

<html>
<head>

<title>Search Form</title>
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="search.css">
    <link rel="shortcut icon" href="images/ico/favicon.ico"> 
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>


<div class="back-image"></div>
<div class="back-gradient"></div>
    
    
<section class="search-sec">
    <div class="container">
        <form action="#" method="post" novalidate="novalidate">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <input type="number" class="form-control search-slt" placeholder="Bedroom">
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <input type="number" class="form-control search-slt" placeholder="Bathroom">
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <select class="form-control search-slt" id="exampleFormControlSelect1">
                                <option>State</option>
                                <option>MH</option>
                                <option>J&K</option>
                                <option>UP</option>
                                <option>AP</option>
                                <option>MP</option>
                                <option>GOA</option>
                            </select>
                        </div>
                        <!-- <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <select class="form-control search-slt" id="exampleFormControlSelect1">
                                <option>Max Price Range</option>
                                <option>5000</option>
                                <option>8000</option>
                                <option>11000</option>
                                <option>14000</option>
                                <option>17000</option>
                                <option>20000</option>
                            </select>
                        </div> -->
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <select class="form-control search-slt" id="exampleFormControlSelect2">
                                <option>Max Price Range</option>
                                <option>5000</option>
                                <option>8000</option>
                                <option>11000</option>
                                <option>14000</option>
                                <option>17000</option>
                                <option>20000</option>
                            </select>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
<!--                            <button type="button" class="btn btn-danger wrn-btn">Search</button>-->
                            <a href="showsearch.jsp"><input type="button" class=" btn btn-danger wrn-btn" style="color:rgb(48, 88, 148)" value="Search" ></a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

</body>
</html>