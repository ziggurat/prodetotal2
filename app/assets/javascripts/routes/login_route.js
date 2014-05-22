Prodetotal2.LoginRoute = Ember.Route.extend({
	activate: function() {
		var loginController = this.controllerFor('login');
	    (function(d, s, id) {
	        var js, fjs = d.getElementsByTagName(s)[0];
	        if (d.getElementById(id)) return;
	        js = d.createElement(s); js.id = id;
	        js.src = "//connect.facebook.net/en_US/sdk.js";
	        fjs.parentNode.insertBefore(js, fjs);
	      }(document, 'script', 'facebook-jssdk'));

	      window.fbAsyncInit = function() {
	        FB.init({
	          appId      : '531110126986719',
	          cookie     : true,  // enable cookies to allow the server to access 
	                              // the session
	          xfbml      : false,  // parse social plugins on this page
	          version    : 'v2.0' // use version 2.0
	        });

	      	FB.getLoginStatus(function(response) {
		      loginController.check_fb_login(response);
		    });  
	      };	    
	}
});