Prodetotal2.CompetitionRoute = Ember.Route.extend({
  model: function(params) {
    console.log("CompetitionRoute model");
    return this.store.find('competition', params.competition_id);
  }
});