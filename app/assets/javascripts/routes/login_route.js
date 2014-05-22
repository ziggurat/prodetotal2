Prodetotal2.LoginRoute = Ember.Route.extend({
	activate: function() {
		Prodetotal2.Facebook.init();
		var not_logged_in = function() {
			redirectTo('');
		};
	}
});