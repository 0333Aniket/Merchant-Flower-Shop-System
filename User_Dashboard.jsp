<%@page import="java.util.Base64"%>

<%@page import="com.Entity.addFlower.*"%>
<%@page import="java.util.List"%>
<%@page import="com.Connection.jdbc_conn"%>
<%@page import="com.model.Promodel"%>
<%@page import="com.Entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>BLOSSOM FLOWER MERCHANT </title>
	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Fontawesome CSS -->
	<link href="css/all.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
       <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-light top-nav fixed-top">
        <div class="container">
             <a class="navbar-brand" href="index.html">
            <img src="images/shop_logo.webp" alt="logo" style="height: 100px ; width: 100px"/>
            </a> 
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="fas fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                     <a class="nav-link active" href="User_Dashboard.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="about.jsp">About</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="services.jsp">Services</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="contact.jsp">Contact</a>
                  </li>
                   <li class="nav-item">
                     <a class="nav-link" href="Login.jsp">Login</a>
                  </li>
                 
               </ul>
            </div> 
        </div>
    </nav>
    <header class="slider-main">
        <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
               <!-- Slide One - Set the background image for this slide in the line below -->
               <div class="carousel-item active" style="background-image: url('back_img/bg1.avif')">
                  <div class="carousel-caption d-none d-md-block">
                     <h3>Welcome to BLOSSOM FLOWERS</h3>
                     <p>A Great Theme For HAPPINESS</p>
                  </div>
               </div>
               <!-- Slide Two - Set the background image for this slide in the line below -->
               <div class="carousel-item" style="background-image: url('back_img/bg2.avif')">
                  <div class="carousel-caption d-none d-md-block">
                     <h3>Welcome to BLOSSOM FLOWERS</h3>
                     <p>A Great Theme For HAPPINESS</p>
                  </div>
               </div>
               <!-- Slide Three - Set the background image for this slide in the line below -->
               <div class="carousel-item" style="background-image: url('back_img/bg4.avif')">
                  <div class="carousel-caption d-none d-md-block">
                     <h3>Welcome to BLOSSOM FLOWERS</h3>
                     <p>A Great Theme For HAPPINESS</p>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
            </a>
        </div>
    </header>
    <!-- Page Content -->
    <div class="container">
        <div class="services-bar">
            <h1 class="my-4">Our Best Services </h1>
            
            <!-- Services Section -->
            <div class="row">
            <%
try {
    Promodel pm = new Promodel(jdbc_conn.getConnection()); 
    List<addFlower> flowers = pm.displayflower();
    for(addFlower flower : flowers) {
        byte[] img = flower.getImage();
        String base64Image = img != null ? Base64.getEncoder().encodeToString(img) : "";
%>  
               <div class="col-lg-4 mb-4">
                  <div class="card h-100">
   

                     <h4 class="card-header"><%=flower.getName() %></h4>
                     <div class="card-img">
                           <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= flower.getName() %>" style="width:200px; height: 200px">
                     </div>
                     <div class="card-body">
                        <!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p> -->
                     </div>
                     <div class="card-footer">
                        <a  href="flower_info.jsp?id=<%=flower.getId()%>" class="btn btn-primary">Buy Now</a>
                     </div>
                  </div>
               </div>
               <%
    }
} catch(Exception e) {
    // Handle exceptions gracefully, e.g., log the error
    e.printStackTrace();
}
%>
               <!-- <div class="col-lg-4 mb-4">
                  <div class="card h-100">
                     <h4 class="card-header">Garden Watering</h4>
                     <div class="card-img">
                        <img class="img-fluid" src="images/services-img-02.jpg" alt="" />
                     </div>
                     <div class="card-body">
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                     </div>
                     <div class="card-footer">
                        <a href="#" class="btn btn-primary">Learn More</a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 mb-4">
                  <div class="card h-100">
                     <h4 class="card-header">Garden Supplies</h4>
                     <div class="card-img">
                        <img class="img-fluid" src="images/services-img-03.jpg" alt="" />
                     </div>
                     <div class="card-body">
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                     </div>
                     <div class="card-footer">
                        <a href="#" class="btn btn-primary">Learn More</a>
                     </div>
                  </div>
               </div>  -->
            </div>
            <!-- /.row -->
        </div>
        <!-- About Section -->
        <div class="about-main">
            <div class="row">
               <div class="col-lg-6">
                  <h2>Welcome to BLOSSOM FLOWERS</h2>
                  <p>BLOSSOM FLOWERS is an E-commerce market place for B2B Buying & Selling of Indian and imported flowers & leaf’s. 
                  BLOSSOM FLOWERS is operated through mobile application, itis available both on Android and IOS. Buyers across India can
                   buy through BLOSSOM FLOWERS Buyer App and one can sell through BLOSSOM FLOWERS Seller App.

Flower Blossom is a one stop shop to buy all kinds of Indian flowers, imported flowers and leafs in Bulk.
 By using Flower Blossom Buyerapp the Re-sellers, Decorators, Wedding planners and Event companies can buy directly from 
 the growers and whole sellers from any part of the country.By using Flower Blossom Seller App the growers, whole sellers, re-sellers, 
can sell directly to the buyers across India without any hassle, with the support of Flower Blossom team.</p>
                  <!-- <h5>Our smart approach</h5>
                  <ul>
                     <li>Sed at tellus eu quam posuere mattis.</li>
                     <li>Phasellus quis erat et enim laoreet posuere ac porttitor ipsum.</li>
                     <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                     <li>Duis porttitor odio pellentesque mollis vulputate.</li>
                     <li>Quisque ac eros non ex hendrerit vehicula.</li>
                  </ul>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p> -->
               </div>
               <div class="col-lg-6">
                  <img class="img-fluid rounded" src="images/about-img.jpg" alt="" />
               </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- Portfolio Section -->
        <!-- <div class="portfolio-main">
            <h2>Our Portfolio</h2>
            <div class="row">
               <div class="col-lg-4 col-sm-6 portfolio-item">
                  <div class="card h-100">
                     <div class="card-img">
                        <a href="#">
                           <img class="card-img-top" src="images/portfolio-img-01.jpg" alt="" />
                           <div class="overlay"><i class="fas fa-arrows-alt"></i></div>
                        </a>
                     </div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#">Lawn & garden care</a>
                        </h4>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-sm-6 portfolio-item">
                  <div class="card h-100">
                     <div class="card-img">
                        <a href="#">
                           <img class="card-img-top" src="images/portfolio-img-02.jpg" alt="" />
                           <div class="overlay"><i class="fas fa-arrows-alt"></i></div>
                        </a>
                     </div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#">Lawn renovation</a>
                        </h4>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-sm-6 portfolio-item">
                  <div class="card h-100">
                     <div class="card-img">
                        <a href="#">
                           <img class="card-img-top" src="images/portfolio-img-03.jpg" alt="" />
                           <div class="overlay"><i class="fas fa-arrows-alt"></i></div>
                        </a>
                     </div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#">Tree planting</a>
                        </h4>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-sm-6 portfolio-item">
                  <div class="card h-100">
                     <div class="card-img">
                        <a href="#">
                           <img class="card-img-top" src="images/portfolio-img-04.jpg" alt="" />
                           <div class="overlay"><i class="fas fa-arrows-alt"></i></div>
                        </a>
                     </div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#">Water Baganig</a>
                        </h4>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-sm-6 portfolio-item">
                  <div class="card h-100">
                     <div class="card-img">
                        <a href="#">
                           <img class="card-img-top" src="images/portfolio-img-05.jpg" alt="" />
                           <div class="overlay"><i class="fas fa-arrows-alt"></i></div>
                        </a>
                     </div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#">Growing plants</a>
                        </h4>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-sm-6 portfolio-item">
                  <div class="card h-100">
                     <div class="card-img">
                        <a href="#">
                           <img class="card-img-top" src="images/portfolio-img-01.jpg" alt="" />
                           <div class="overlay"><i class="fas fa-arrows-alt"></i></div>
                        </a>
                     </div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#">Snow removal</a>
                        </h4>
                     </div>
                  </div>
               </div>
            </div> -->
            <!-- /.row -->
        </div>
        <hr>
        <!-- Get In Touch Now Section -->
        <div class="row mb-4">
            <!-- <div class="col-md-8">
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
            </div> -->
            <!-- <div class="col-md-4">
               <a class="btn btn-lg btn-secondary btn-block" href="#">Get In Touch Now</a>
            </div> -->
        </div>
    </div>
    <!-- /.container -->
    <!--footer starts from here-->
    <footer class="footer">
        <div class="container bottom_border">
            <div class="row">
               <div class="col-lg-3 col-md-6 col-sm-6 col">
					<h5 class="headin5_amrc col_white_amrc pt2">Find us</h5>
					<!--headin5_amrc-->
					<p class="mb10">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
					<p><i class="fa fa-location-arrow"></i> 9878/25 sec 9 rohini 35 </p>
					<p><i class="fa fa-phone"></i> +91-9999878398 </p>
					<p><i class="fa fa fa-envelope"></i> info@example.com </p>
               </div>
               <div class="col-lg-3 col-md-6 col-sm-6 col">
					<h5 class="headin5_amrc col_white_amrc pt2">Follow us</h5>
					<!--headin5_amrc ends here-->
					<ul class="footer_ul2_amrc">
						<li>
							<a href="#"><i class="fab fa-twitter fleft padding-right"></i> </a>
							<p>Lorem Ipsum is simply dummy printing...<a href="#">https://www.lipsum.com/</a></p>
						</li>
						<li>
							<a href="#"><i class="fab fa-twitter fleft padding-right"></i> </a>
							<p>Lorem Ipsum is simply dummy printing...<a href="#">https://www.lipsum.com/</a></p>
						</li>
						<li>
							<a href="#"><i class="fab fa-twitter fleft padding-right"></i> </a>
							<p>Lorem Ipsum is simply dummy printing...<a href="#">https://www.lipsum.com/</a></p>
						</li>
					</ul>
					<!--footer_ul2_amrc ends here-->
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<h5 class="headin5_amrc col_white_amrc pt2">Quick links</h5>
					<!--headin5_amrc-->
					<ul class="footer_ul_amrc">
						<li><a href="#">Default Version</a></li>
						<li><a href="#">Boxed Version</a></li>
						<li><a href="#">Our Team </a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Our Services</a></li>
						<li><a href="#">Get In Touch</a></li>
					</ul>
					<!--footer_ul_amrc ends here-->
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 ">
					<h5 class="headin5_amrc col_white_amrc pt2">Services</h5>
					<!--headin5_amrc-->
					<ul class="footer_ul_amrc">
						<li class="media">
							<div class="media-left">
								<img class="img-fluid" src="images/post-img-01.jpg" alt="" />
							</div>
							<div class="media-body">
								<p>Flower Delivery Near Me</p>
<!-- 								<span>22 Sep 2018</span>
 -->							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<img class="img-fluid" src="images/post-img-02.jpg" alt="" />
							</div>
							<div class="media-body">
								<p>Send Flowers Online</p>
<!-- 								<span>34 Sep 2018</span>
 -->							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<img class="img-fluid" src="images/post-img-03.jpg" alt="" />
							</div>
							<div class="media-body">
								<p>Trusted Online Florist Shop</p>
<!-- 								<span>30 Sep 2018</span>
 -->							</div>
						</li>
					</ul>
					<!--footer_ul_amrc ends here-->
				</div>
			</div>
		</div>
        <div class="container">
            <div class="footer-logo">
				<a href="#"><img src="images/shop_logo.webp" alt="" / style="width: 100px; height: 100px"></a>
			</div>
            <!--foote_bottom_ul_amrc ends here-->
            <p class="copyright text-center">All Rights Reserved. &copy; 2018 <a href="#">BLOSSOM FLOWERS</a> Design By : 
				<a href="https://html.design/">html design</a>
            </p>
            <ul class="social_footer_ul">
				<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
				<li><a href="#"><i class="fab fa-twitter"></i></a></li>
				<li><a href="#"><i class="fab fa-linkedin"></i></a></li>
				<li><a href="#"><i class="fab fa-instagram"></i></a></li>
            </ul>
            <!--social_footer_ul ends here-->
        </div>
    </footer>
	  
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>