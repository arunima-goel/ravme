<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Ravishing.me</title>
</head>

<body>
<g:link mapping="aboutus"> About us</g:link>
|
<oauth:disconnected provider="facebook">
	<oauth:connect provider="facebook" id="facebook-connect-link">Login</oauth:connect>
	|
	<oauth:connect provider="facebook" id="facebook-connect-link">Sign up</oauth:connect>
</oauth:disconnected>
<oauth:connected provider="facebook">
	<g:link controller="user" action="logout" id="facebook">Logout</g:link>
</oauth:connected>
</body>
</html>
