Prodetotal2.ApiAdapter = Ember.Object.extend({
	getCompetitions: function() {
		return $.getJSON('/api/v1/competitions').then(function(result){
			return result.competitions;
		});
	},
	getUser: function(fb_id) {
		return $.getJSON('/api/v1/users/' + fb_id);	
	},
	getMatches: function(competition_id) {
		return $.getJSON('/api/v1/competitions/' + competition_id + '/matches');	
	}
});

Prodetotal2.register('api-adapter:main', Prodetotal2.ApiAdapter);
Prodetotal2.inject('controller', 'adapter', 'api-adapter:main');
Prodetotal2.inject('route', 'adapter', 'api-adapter:main');