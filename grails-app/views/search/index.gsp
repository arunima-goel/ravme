
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

</head>

<body>
<script type="text/javascript">
	window.onload = function() {
		var x = location.pathname;
	    var facebookLinks = document.getElementsByClassName("facebookLogin")
	    Array.prototype.forEach.call(facebookLinks, function(facebookLink) {
		    var hrefAttr = facebookLink.getAttribute("href");
	        facebookLink.setAttribute("href", hrefAttr + x)
	    });
	    	    
	}
</script>
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
                                    <g:link class="selected" mapping="aboutus">about</g:link>
                                </li>
                                <oauth:disconnected provider="facebook">
	                                <span class="vert hidden-xs">&vert;</span>
	                                <li>
	                                    <oauth:connect provider="facebook" id="facebook-connect-link" class="facebookLogin">login</oauth:connect>
	                                </li>
	                                <span class="vert hidden-xs">&vert;</span>
	                                <li>
	                                    <oauth:connect provider="facebook" id="facebook-connect-link" class="facebookLogin">sign up</oauth:connect>
	                                </li>
                                </oauth:disconnected>
                                <oauth:connected provider="facebook">
									<span class="vert hidden-xs">&vert;</span>
	                                <li>
	                                    <g:link controller="user" action="logout" id="facebook">Logout</g:link>
	                                </li>
	                            </oauth:connected>
                            </ul>
                        </div>
                    </div>
                    <!-- /.navbar-collapse -->
                
                    <div class="search-header">
                        <asset:image src="search_bg.png" alt="search"/>
                        <div class="row sh-inner">
                            <div class="col-md-4 col-md-offset-2 sh-search">
                                <input name="search" type="text" placeholder="Search by type of event, makeup, name, etc">
                            </div>
                            <div class="col-md-4 sh-city">
                                <div class="input-group">
                                    <input name="city" type="text" placeholder="City">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default home-btn" type="button">Search</button>
                                    </span>
                                </div><!-- /input-group -->
                            </div><!-- /home-city row -->
                        </div><!-- /Search Bar Row -->
                    </div><!-- Search Header -->
                </div>
                <!-- /.container -->
            </nav>
    </div><!--- Header Container -->
    </header>
    <!--Header_section--> 

    <!-- Page Content -->
    <div id="result-page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 result-filter">
                    <h6>Filter by</h6>
                    <h6 class="filter-header">Budget</h6>
                    <div class="checkbox">
                        <label><input type="checkbox" value="">Promotion - RS.5,0000</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Rs.5,001 - Rs.10,000</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Rs.10,001 - Rs.15,000</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Rs.15,001 - above</label>
                    </div>
                    
                    <h6 class="filter-header">Type of Makeup</h6>
                    <div class="checkbox">
                        <label><input type="checkbox" value="">Regular</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">High Definition</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Airbrush</label>
                    </div> 
                    
                    <h6 class="filter-header">Specialties</h6>
                    <div class="checkbox">
                        <label><input type="checkbox" value="">Bridal</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Character</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Fashion</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Ramp shows</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">Special Events</label>
                    </div>
                    
                    <h6 class="filter-header">Cosmetic brands used</h6>
                    <div class="checkbox">
                        <label><input type="checkbox" value="">mac</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="">lakme</label>
                    </div>
                </div><!-- /Result Filter -->
                
                <div class="col-md-10 result-items">
                    <div class="row result-item">
                        <div class="col-md-2 result-img">
                            <asset:image src="result-img.png" alt=""/>
                            <button class="portfolio-btn">portfolio</button>
                        </div>
                        
                        <div class="col-md-4 result-contact">
                            <h2 class="result-title">Preeti Rilley</h2>
                            
                            <h6>Location</h6>
                            <p>Great Kailash -2, New Delhi</p>
                            
                            <h6>Phone</h6>
                            <p>741-221-5402</p>
                            
                            <h6>Email</h6>
                            <p>prk@gmail.com</p>
                        </div>
                        
                        <div class="col-md-4 result-meta">                            
                            <h6>Cosmetics brands used</h6>
                            <p>Mac, Lakme, Lancome</p>
                            
                            <h6>Specialties</h6>
                            <p>Bridal, Photo & Fashion, Artistic</p>
                            
                             <ul class="social-links">
                                <li class="pt-icon"><a href="#"></i></a></li>
                                <li class="fb-icon"><a href="#"></i></a></li>
                                <li class="ig-icon"><a href="#"></i></a></li>
                             </ul>
                        </div>
                    </div><!-- /Result Item -->
                    
                    <div class="row result-item">
                        <div class="col-md-2 result-img">
                            <asset:image src="result-img.png" alt=""/>
                            <button class="portfolio-btn">portfolio</button>
                        </div>
                        
                        <div class="col-md-4 result-contact">
                            <h2 class="result-title selected">Makeup by Nida Nafes</h2>
                            
                            <h6>Location</h6>
                            <p>Lajpat Nagar, New Delhi</p>
                            
                            <h6>Phone</h6>
                            <p>741-221-5402</p>
                            
                            <h6>Email</h6>
                            <p>prk@gmail.com</p>
                        </div>
                        
                        <div class="col-md-4 result-meta">                            
                            <h6>Cosmetics brands used</h6>
                            <p>Mac, Lakme, Lancome</p>
                            
                            <h6>Specialties</h6>
                            <p>Bridal, Photo & Fashion, Artistic</p>
                            
                             <ul class="social-links">
                                <li class="pt-icon"><a href="#"></a></li>
                                <li class="fb-icon"><a href="#"></a></li>
                                <li class="ig-icon"><a href="#"></a></li>
                             </ul>
                        </div>
                    </div><!-- /Result Item -->
                    
                     <div class="row result-item">
                        <div class="col-md-2 result-img">
                            <asset:image src="result-img.png" alt=""/>
                            <button class="portfolio-btn">portfolio</button>
                        </div>
                        
                        <div class="col-md-4 result-contact">
                            <h2 class="result-title">Roop Bridal</h2>
                            
                            <h6>Location</h6>
                            <p>Great Kailash -2, New Delhi</p>
                            
                            <h6>Phone</h6>
                            <p>741-221-5402</p>
                            
                            <h6>Email</h6>
                            <p>prk@gmail.com</p>
                        </div>
                        
                        <div class="col-md-4 result-meta">                            
                            <h6>Cosmetics brands used</h6>
                            <p>Mac, Lakme, Lancome</p>
                            
                            <h6>Specialties</h6>
                            <p>Bridal, Photo & Fashion, Artistic</p>
                            
                             <ul class="social-links">
                                <li class="pt-icon"><a href="#"></i></a></li>
                                <li class="fb-icon"><a href="#"></i></a></li>
                                <li class="ig-icon"><a href="#"></i></a></li>
                             </ul>
                        </div>
                    </div><!-- /Result Item -->
                    
                    <div class="row result-item">
                        <div class="col-md-2 result-img">
                            <asset:image src="result-img.png" alt=""/>
                            <button class="portfolio-btn">portfolio</button>
                        </div>
                        
                        <div class="col-md-4 result-contact">
                            <h2 class="result-title">Preeti Rille</h2>
                            
                            <h6>Location</h6>
                            <p>Great Kailash -2, New Delhi</p>
                            
                            <h6>Phone</h6>
                            <p>741-221-5402</p>
                            
                            <h6>Email</h6>
                            <p>prk@gmail.com</p>
                        </div>
                        
                        <div class="col-md-4 result-meta">                            
                            <h6>Cosmetics brands used</h6>
                            <p>Mac, Lakme, Lancome</p>
                            
                            <h6>Specialties</h6>
                            <p>Bridal, Photo & Fashion, Artistic</p>
                            
                             <ul class="social-links">
                                <li class="pt-icon"><a href="#"></i></a></li>
                                <li class="fb-icon"><a href="#"></i></a></li>
                                <li class="ig-icon"><a href="#"></i></a></li>
                             </ul>
                        </div>
                    </div><!-- /Result Item -->
                    
                    <div class="row result-item">
                        <div class="col-md-2 result-img">
                            <asset:image src="result-img.png" alt=""/>
                            <button class="portfolio-btn">portfolio</button>
                        </div>
                        
                        <div class="col-md-4 result-contact">
                            <h2 class="result-title">Preeti Rilley</h2>
                            
                            <h6>Location</h6>
                            <p>Great Kailash -2, New Delhi</p>
                            
                            <h6>Phone</h6>
                            <p>741-221-5402</p>
                            
                            <h6>Email</h6>
                            <p>prk@gmail.com</p>
                        </div>
                        
                        <div class="col-md-4 result-meta">                            
                            <h6>Cosmetics brands used</h6>
                            <p>Mac, Lakme, Lancome</p>
                            
                            <h6>Specialties</h6>
                            <p>Bridal, Photo & Fashion, Artistic</p>
                            
                             <ul class="social-links">
                                <li class="pt-icon"><a href="#"></i></a></li>
                                <li class="fb-icon"><a href="#"></i></a></li>
                                <li class="ig-icon"><a href="#"></i></a></li>
                             </ul>
                        </div>
                    </div><!-- /Result Item --> 

                    <div class="row result-item">
                        <div class="col-md-2 result-img">
                            <asset:image src="result-img.png" alt=""/>
                            <button class="portfolio-btn">portfolio</button>
                        </div>
                        
                        <div class="col-md-4 result-contact">
                            <h2 class="result-title">Preeti Rilley</h2>
                            
                            <h6>Location</h6>
                            <p>Great Kailash -2, New Delhi</p>
                            
                            <h6>Phone</h6>
                            <p>741-221-5402</p>
                            
                            <h6>Email</h6>
                            <p>prk@gmail.com</p>
                        </div>
                        
                        <div class="col-md-4 result-meta">                            
                            <h6>Cosmetics brands used</h6>
                            <p>Mac, Lakme, Lancome</p>
                            
                            <h6>Specialties</h6>
                            <p>Bridal, Photo & Fashion, Artistic</p>
                            
                             <ul class="social-links">
                                <li class="pt-icon"><a href="#"></i></a></li>
                                <li class="fb-icon"><a href="#"></i></a></li>
                                <li class="ig-icon"><a href="#"></i></a></li>
                             </ul>
                        </div>
                    </div><!-- /Result Item -->
                
                </div>
            </div><!-- /Row -->
        </div><!-- /Container -->
        
    </div><!-- /Page Content Wrapper -->

    <!-- jQuery -->
    <asset:javascript src="jquery.js"/>

    <!-- Bootstrap Core JavaScript -->
    <asset:javascript src="bootstrap.min.js"/>
    
</body>

</html>
