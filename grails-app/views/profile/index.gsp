<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Ravishing.me</title>
</head>

<body>
Test Profile view</br>
${profile.name}

<g:link mapping="aboutus"> About us</g:link>
|
<oauth:connect provider="facebook" id="facebook-connect-link">Login</oauth:connect>
|
<oauth:connect provider="facebook" id="facebook-connect-link">Sign up</oauth:connect>
</body>
</html>
