<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Subtract</title>
        <g:javascript library="jquery"/>
    </head>
    <body>
    <p>This text should remain and unaffected because the form below will use AJAX</p>
    <div id="subtraction">
        <h3>Subtract</h3>
		<g:formRemote name="subForm" url="[controller:'math', action:'difference']" update="subtraction">
		    <label for="a">First Number</label><g:textField name="a"/><br/>
		    <label for="b">Second Number</label><g:textField name="b"/><br/>
		    <g:submitButton name="Get The Difference"/>
		</g:formRemote>
    </div>
    </body>
</html>