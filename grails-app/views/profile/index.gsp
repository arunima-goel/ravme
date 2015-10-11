

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ravishing.me</title>

    <!-- Bootstrap Core CSS -->
    <asset:stylesheet src="bootstrap.min.css"/>
    
    <!-- Custom CSS -->
    <asset:stylesheet src="style.css"/>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!--- Google Maps -->
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
        function init_map() {
		
        var var_location = new google.maps.LatLng(28.535305, 77.241679);
 
        var var_mapoptions = {
          center: var_location,
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          mapTypeControl: false,
          panControl:false,
          rotateControl:false,
          streetViewControl: false,
          scrollwheel: false,    
        };
 
		//var var_pin = '../../assets/images/map-marker.png';
		//var var_marker = new google.maps.Marker({
		//	position: var_location,
		//	map: var_map,
		//	icon: var_pin,
		//	title:"Greater Kailash 2"});
 
        //var var_map = new google.maps.Map(document.getElementById("map-canvas"),
        //    var_mapoptions);
 
		//var_marker.setMap(var_map);	
 
      }
 
      google.maps.event.addDomListener(window, 'load', init_map);
    </script>
</head>

<body>

    <!--Header_section-->
    <header id="header-wrapper">
      <div class="container-fluid">
          <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container-fluid nav-container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">
                            <asset:image class="logo" src="logo.png" alt=""/>
                        </a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse-container">
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                               <li>
                                    <g:link class="testClick selected" mapping="aboutus">about</g:link>
                                </li>
                                <oauth:disconnected provider="facebook">
	                                <span class="vert hidden-xs">&vert;</span>
	                                <li>
	                                    <oauth:connect class="testClick" provider="facebook" id="facebook-connect-link">login</oauth:connect>
	                                </li>
	                                <span class="vert hidden-xs">&vert;</span>
	                                <li>
	                                    <oauth:connect class="testClick" provider="facebook" id="facebook-connect-link">sign up</oauth:connect>
	                                </li>
                                </oauth:disconnected>
                                <oauth:connected provider="facebook">
									<span class="vert hidden-xs">&vert;</span>
	                                <li>
	                                    <g:link class="testClick" controller="user" action="logout" id="facebook">Logout</g:link>
	                                </li>
	                            </oauth:connected>
                            </ul>
                        </div>
                    </div>
                    <!-- /.navbar-collapse -->
                
                    <div class="secondary-header row">
                    <div class="secondary-inner">
                        <div class="col-md-6">
                        	<h1 class="page-title">${profile.username}</h1>
                        </div>
                        <div class="col-md-6">
                            <ul class="second-nav">
                                <li class="selected"><a class="nav-link" href="#portfolio">Portfolio</a></li>
                                <li><a class="nav-link" href="#services">Services</a></li>
                                <li><a class="nav-link" href="#contact">Contact</a></li>
                            </ul>
                        </div>
                    </div><!-- Secondary Header -->
                    </div><!-- Secondary Inner -->
                </div><!-- Seconardy Header Row -->
                <!-- /.container -->
            </nav>
    </div><!--- Header Container -->
    </header>
    <!--Header_section--> 

    <!-- Page Content -->
    <div id="portfolio-page-wrapper">
        <div class="container-fluid">
            <span class="anchor" id="portfolio"></span>
            <section class="row portfolio">
                <h2>Portfolio</h2>
                <ul class="portfolio-categories">
                    <li><a class="nav-link" href="">All</a></li>
                    <li><a class="nav-link" href="">Bridal</a></li>
                    <li><a class="nav-link" href="">Character</a></li>
                    <li><a class="nav-link" href="">Fashion</a></li>
                    <li><a class="nav-link" href="">Special Events</a></li>
                </ul>
                
                <div class="row portfolio-grid">
                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>

                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>

                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>


                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>


                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>


                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>


                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>


                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>


                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>

                    <!-- column -->    
                    <div class="col-xs-6 col-sm-5cols">
                      <div class="thumbnail">
                        <img src="http://placehold.it/500x500" alt="">
                      </div>
                    </div>


                  </div>
            </section><!-- Portfolio Section -->
            <span class="anchor" id="services"></span>
            <section class="services">
                <h2>Services</h2>
                <div class="services-content">
                    <div class="row">
                        <div class="col-md-2 col-md-offset-4 services-first">
                            <h6>Consulation</h6>
                            <p>Complimentary</p>
                            <p>Does not include makeup application</p>
                            <p>Travel not included</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-md-offset-4">
                            <h6>Makeup</h6>
                            <p>Light makeup</p>
                            <p>Party makeup</p>
                            <p>Base makeup</p>
                            <p>Bridal makeup</p>
                            <p>Enagagement makeup</p>
                            <p>Receptiom makeup</p>
                            <p>Eye makeup</p>
                            <br/>
                            <h6>Hair</h6>
                            <p>Haircut</p>
                            <p>Hair Styling</p>
                            <p>Blow drying</p>
                        </div>
                        
                        <div class="col-md-2 services-model">
                            <br/>
                            <p>Rs. 3000</p>
                            <p>Rs. 4000</p>
                            <p>Rs. 2000</p>
                            <p>Rs. 8000 and up</p>
                            <p>Rs. 8000</p>
                            <p>Rs. 2000</p>
                            <p>Rs. 500</p>
                            <br/><br/>
                            
                            <p>Rs. 800</p>
                            <p>Rs. 400</p>
                            <p>Rs. 500</p>
                        </div>
                    </div>
                </div>
            </section><!-- Services Section -->   
            
            <span class="anchor" id="contact"></span>
            <section class="contact">
                <h2>Contact</h2>
                <!-- Google Map -->
                <div class="row"> 
                    <div id="map-canvas"></div>
                </div>
                <!-- Contact Form -->
                <div class="row">
                    <div class="col-md-8 contact-form">
                      <h3 class="contact-header">Say Hello!</h3>
                      <form role="form" action="" method="post" >
                        <label for="InputName">Name <span class="required">*</span></label>
                        <input type="text" class="form-control" name="InputName" id="InputName" required>
            
                        <label for="InputEmail">Email <span class="required">*</span></label>
                        <input type="email" class="form-control" id="InputEmail" name="InputEmail" required  >
                           
                        <label for="InputMessage">Message <span class="required">*</span></label>
                        <textarea name="InputMessage" id="InputMessage" class="form-control" rows="5" required></textarea>
                        <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info contact-btn">
                      
                    </form><!-- /Contact Form -->
                    </div>
                    
                    <div class="col-md-4 contact-info">
                        <h3 class="contact-header">Contacts</h3>
                        <h6>Location</h6>
                        <p>E-556 Greater Kailash 2,<br/>
                        New Delhi</p>
                        
                        <h6>Phone</h6>
                        <p>741-221-5402</p>
                        
                        <h6>Email</h6>
                        <p>prk@gmail.com</p>
                    </div>
                </div><!-- /Row -->
            </section><!-- /Contact Section -->
        </div>
    </div><!-- /Page Content Wrapper -->
        
    <!-- jQuery -->
    <asset:javascript src="jquery.js"/>

    <!-- Bootstrap Core JavaScript -->
    <asset:javascript src="bootstrap.min.js"/>
        
    <!-- Custom JS Script -->
    <asset:javascript src="custom.js"/>
    
</body>

</html>
