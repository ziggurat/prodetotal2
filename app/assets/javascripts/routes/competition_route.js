Prodetotal2.CompetitionRoute = Ember.Route.extend({
  model: function(params) {
    console.log("CompetitionRoute model");
    return competitions[params.post_id];
  }
});