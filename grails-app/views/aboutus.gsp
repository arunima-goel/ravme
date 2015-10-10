
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
	                                    <oauth:connect provider="facebook" id="facebook-connect-link">login</oauth:connect>
	                                </li>
	                                <span class="vert hidden-xs">&vert;</span>
	                                <li>
	                                    <oauth:connect provider="facebook" id="facebook-connect-link">sign up</oauth:connect>
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
                       <asset:image src="search_bg.png" alt="search" />
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
            <div class="col-md-8 about-text">
                <h1>About us</h1>
                <p>Ravishing.me is a dedicated free service for locating and contacting professional makeup artists in India.
                    Conversely, it is also for makeup artist interested in reaching out to their potential clientele by listing their business
                    and posting their portfolios on our website. In other words, ravishing.me exists to serve those who are looking 
                    for makeup artist and makeup artist who want to get the word out about their makeup brush-wielding skills.</p>
                <p>And now for the icing on the cake: it's an absolutely <span>free service</span>!</p>
                <p>Simply create an account by logging in with your gmail, facebook or pinterest username and password.</p>
                <p>Our members' safety and privacy is our top priority. Your personal information will never be sold to or shared
                    with third-party marketers. Please visit our Privacy & Security page for details.</p>
            </div>
            
            <div class="col-md-4 about-contact">
                <h2>Contacts</h2>
                <h6>Location</h6>
                <p>B 3/6 Paschim Vihar,</p>
                <p>New Delhi</p>
                <p>Delhi 1110087, India</p>
                
                <h6>Email</h6>
                <p>support@ravishing.me</p>
                
                <ul class="social-links">
                    <li class="pt-icon"><a href="#"></a></li>
                    <li class="fb-icon"><a href="#"></a></li>
                </ul>
            </div>
        </div><!-- /Container -->
        
    </div><!-- /Page Content Wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
