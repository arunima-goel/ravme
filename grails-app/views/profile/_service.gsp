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