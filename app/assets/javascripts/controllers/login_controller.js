Prodetotal2.LoginController = Ember.Controller.extend({
	check_fb_login: function(response) {
		console.log(response);
	    // The response object is returned with a status field that lets the
	    // app know the current login status of the person.
	    // Full docs on the response object can be found in the documentation
	    // for FB.getLoginStatus().
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
	      console.log("Logged in!!!!")
	    } else if (response.status === 'not_authorized') {
	      // The person is logged into Facebook, but not your app.
	      $('#fb_login_btn').removeClass("disabled");
	    } else {
	      // The person is not logged into Facebook, so we're not sure if
	      // they are logged into this app or not.
	      // document.getElementById('fb_login_btn').innerHTML = 'Please log ' + 'into Facebook.';
	      $('#fb_login_btn').removeClass("disabled");
	    }
	},
	actions: {
		login: function() {
			console.log('Login function in LoginController');
			FB.login(this.check_fb_login);
		}
  	}
});