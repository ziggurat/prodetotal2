// For more information see: http://emberjs.com/guides/routing/

Prodetotal2.Router.map(function() {
  this.resource('login');
  this.resource('competitions', function() {
    this.resource('competition', { path: ':competition_id' }, function() {
      this.route('matches');
      this.route('new_challenge');
    });
  });
});
