<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
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

	</br> Test Profile edit
	</br>
	Profile pic: </br></br>
		  <img class="profilePic" src="${createLink(action:'profilePic')}" />
		  
    </br></br>Cover pic:</br></br>
		  <img class="coverPic" src="${createLink(action:'coverPic')}" />
	</br></br>Portfolio pics</br></br>
		
		<g:each in="${profile.albums}" var="album">
   			<g:each in="${album.images}" var="image">
   				${image} ${raw(image)}
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
	Cosmetic Brands: <g:textField name="cosmeticBrands"
			value="${profile.cosmeticBrands}" />
		</br>
	Specialties: <g:select name="specialities"
			from="${org.ravishingme.Speciality.list()}"
			value="${profile?.specialities}" optionValue="name" optionKey="id"
			multiple="true" />
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
		<g:each in="${profile.services}" var="service">
			<tr>
				<td><g:link class="btn btn-small btn-inverse"
						controller="service" action="delete" id="${service.id}">
	                Delete
	            </g:link>/</td>
				<td>Service - Service group: ${service.serviceGroup}, Service
					name: ${service.serviceName}, Price: ${service.price} </br>
				</td>
			</tr>
		</g:each>
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
	Group name: <g:textField name="serviceGroup" />
		</br>
	Service name: <g:textField name="serviceName" />
		</br>
	Price: <g:textField name="price" />
		</br>
		<g:actionSubmit action="addService" value="Add Service" />
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
