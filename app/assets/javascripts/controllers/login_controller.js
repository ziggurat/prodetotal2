Prodetotal2.LoginController = Ember.Controller.extend({
	actions: {
		login: function() {
			console.log('Login function in LoginController');
			FB.login();
		},
		checkLoginState: function() {
    		FB.getLoginStatus(function(response) {
      			statusChangeCallback(response);
      		});
    	}
  	}
});