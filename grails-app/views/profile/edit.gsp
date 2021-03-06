<!DOCTYPE html>
<%@page import="org.ravishingme.CosmeticBrand"%>
<html>
<head>
<meta name="layout" content="main" />
<title>Ravishing.me</title>
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

	<g:link mapping="aboutus"> About us</g:link>
	|
	<oauth:disconnected provider="facebook">
		<oauth:connect provider="facebook" id="facebook-connect-link" class="facebookLogin">Login</oauth:connect>
	|
	<oauth:connect provider="facebook" id="facebook-connect-link" class="facebookLogin">Sign up</oauth:connect>
	</oauth:disconnected>
	<oauth:connected provider="facebook">
		<g:link controller="user" action="logout" id="facebook">Logout</g:link>
	</oauth:connected>

	</br> Test Profile edit
	</br>
	</br>
	==========================================================================================
	</br>
	Search results:
	</br>
	<div id="searchResults">
	</div>
		
	<g:form>
		<g:each in="${CosmeticBrand.list(sort: 'id', order: 'asc')}" var="cosmeticBrand" status="i">
		    <g:checkBox name="cosmeticBrands" value="${cosmeticBrand.id}" checked="${profile.cosmeticBrands.contains(cosmeticBrand)}" />
		    <label for="cosmeticBrands">${cosmeticBrand.name}</label>
		</g:each>
		<g:textField name="bridalPrice" />
	    <g:submitToRemote url="[controller: 'profile', action:'search']" update="searchResults" value="Search"/>
	</g:form>
	==========================================================================================
	</br>
	</br>
	Profile pic: </br></br>
		  <img class="profilePic" src="${createLink(action:'profilePic')}" />
		  
    </br></br>Cover pic:</br></br>
		  <img class="coverPic" src="${createLink(action:'coverPic')}" />
	</br></br>Portfolio pics</br></br>
		
		<g:each in="${profile.albums}" var="album">
   			<g:each in="${album.images}" var="image">
   				<img class="coverPic" src="${createLink(controller: 'image', action:'view', id: image?.id)}" />
   			</g:each>
		</g:each>
		</br></br>
	</br>
	<g:form method="post">
		<g:hiddenField name="username" value="${profile?.username}" />
		<g:hiddenField name="id" value="${profile?.id}" />
	About You: <g:textField name="aboutYou" value="${profile.aboutYou}" />
		</br>
	Locations Served: <g:textField name="locationsServed"
			value="${profile.locationsServed}" />
		</br>
	Base Location: <g:textField name="baseLocation"
			value="${profile.baseLocation}" />
		</br>
	Cosmetic Brands:
		<g:each in="${CosmeticBrand.list(sort: 'id', order: 'asc')}" var="cosmeticBrand" status="i">
		    <g:checkBox name="cosmeticBrands" value="${cosmeticBrand.id}" checked="${profile.cosmeticBrands.contains(cosmeticBrand)}" />
		    <label for="cosmeticBrands">${cosmeticBrand.name}</label>
		</g:each>
	</br>
	
	Specialties: <g:select name="specialities"
			from="${org.ravishingme.Speciality.list()}"
			value="${profile?.specialities}" optionValue="name" optionKey="id"
			multiple="multiple" />
		</br>
	
	Modes of payment: <g:textField name="modesOfPayment"
			value="${profile.modesOfPayment}" />
		</br>
	Phone number: <g:textField name="phoneNumber"
			value="${profile.phoneNumber}" />
		</br>
	Business hours: <g:textField name="businessHours"
			value="${profile.businessHours}" />
		</br>
	Starting price: <g:textField name="startingPrice"
			value="${profile.startingPrice}" />
		</br>
	Accomplishments: <g:textField name="accomplishments"
			value="${profile.accomplishments}" />
		</br>
	Years of experience: <g:textField name="yearsOfExperience"
			value="${profile.yearsOfExperience}" />
		</br>
	Is Artist: <g:textField name="isArtist" value="${profile.isArtist}" />
		</br>
	Social networks: <g:textField name="socialNetworks"
			value="${profile.socialNetworks}" />
		</br>
		</br>Services:</br>
		
		<div id="profileServices">
			<g:render template="/profile/service" collection="${profile.services}"/>
		</div>
		
		<g:each in="${profile.favorites}" var="favorite">
			<tr>
				<td><g:link action="removeFavorite" id="${profile?.id}"
						params="['favoriteId': favorite.id]">
    				Remove favorite
    			</g:link></td>
				<td>Favorite - username: ${favorite.username}</br>
				</td>
			</tr>
		</g:each>
		</br>
		<g:actionSubmit action="save"
			value="${message(code: 'default.button.update.label', default: 'Update')}" />
	</g:form>

	</br>
	</br>
	<g:form>
		<g:hiddenField name="id" value="${profile?.id}" />
		<label for="serviceGroup">Service Group</label><g:textField name="serviceGroup"/><br/>
		</br>
		<label for="serviceName">Service Name</label><g:textField name="serviceName"/><br/>
		</br>
		<label for="price">Price</label><g:textField name="price"/><br/>
		</br>
	    <g:submitToRemote url="[action:'addService']" update="profileServices" value="Add Service"/>
	</g:form>
	<g:form>
		<g:hiddenField name="id" value="${profile?.id }" />
		<g:actionSubmit action="addFavorite" value="Add Favorite" />
	</g:form>
	
	<%--<g:form>
		<g:hiddenField name="id" value="${profile?.id }" />
		Photo: <input name="photo" type="file" />
		<g:actionSubmit action="uploadAvatarPic" value="Upload" />
	</g:form>
	--%>
	</br>------------------------------------------------------</br>
	<fieldset>
	  <legend>Avatar Upload</legend>
	  <g:uploadForm action="uploadProfilePic">
	    <label for="avatar">Avatar (16K)</label>
	    <input type="file" name="avatar" id="avatar" />
	    <div style="font-size:0.8em; margin: 1.0em;">
	      For best results, your avatar should have a width-to-height ratio of 4:5.
	      For example, if your image is 80 pixels wide, it should be 100 pixels high.
	    </div>
	    <input type="submit" class="buttons" value="Upload" />
	  </g:uploadForm>
	</fieldset>
	
	<fieldset>
	  <legend>Portfolio pics upload</legend>
	  <g:uploadForm action="addPortfolioPicsToAlbum">
	    <label for="files">Portfolio pics(16K)</label>
	    <input type="file" name="files" id="files" multiple="multiple"/>
	    <div style="font-size:0.8em; margin: 1.0em;">
	      For best results, your portfolio pics should have a width-to-height ratio of 4:5.
	      For example, if your image is 80 pixels wide, it should be 100 pixels high.
	    </div>
	    <input type="submit" class="buttons" value="Upload" />
	  </g:uploadForm>
	</fieldset>
	

</body>
</html>
