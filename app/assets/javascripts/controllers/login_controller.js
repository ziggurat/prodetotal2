Prodetotal2.LoginController = Ember.Controller.extend({
	actions: {
		login: function() {
			console.log('Login function in LoginController');
			FB.login(function(response) {
				var not_logged_in = function() {
					redirectTo('');
				};
				Prodetotal2.Facebook.check_fb_login(response, not_logged_in);
			});
		}
  	}
});