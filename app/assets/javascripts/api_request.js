APIRequest = {
	get: function(url, done) {
		$.ajax({
		  url: url,
		  beforeSend: function(xhr){
		  	xhr.setRequestHeader('Facebook-User-Id', response.authResponse.userID);
		  	xhr.setRequestHeader('Facebook-User-Token', response.authResponse.accessToken);
		  },
		  statusCode: {
		    401: function() {
		      alert( "page not found" );
		    }
		  }
		})
		.done(done)
		.fail(function() {
			alert("Failed");
		});
	}
}