Prodetotal2.LoginController = Ember.Controller.extend({
	loginDisabled: true,
	actions: {
		login: function() {
			console.log('Login function in LoginController');
			FB.login(function(response) {				
				this.check_fb_login(response);
			}.bind(this));
		}
	},
	check_fb_login: function(response) {
		console.log(response);
		if (response.status === 'connected') {
			this.userID = response.authResponse.userID;
			this.userToken = response.authResponse.accessToken;
			$.ajax({
				url: "/api/v1/users/" + response.authResponse.userID,
				beforeSend: function(xhr){
					xhr.setRequestHeader('Facebook-User-Id', response.authResponse.userID);
					xhr.setRequestHeader('Facebook-User-Token', response.authResponse.accessToken);
				}
			}).done(function(data) {
				console.log(data);
				this.transitionToRoute('home');
			}.bind(this)).fail(function() {
				this.set('loginDisabled', false);
			}.bind(this));
		} else if (response.status === 'not_authorized') {
			this.set('loginDisabled', false);
		} else {
			this.set('loginDisabled', false);
		}
	}
});