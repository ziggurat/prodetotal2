Prodetotal2.CompetitionsController = Ember.ArrayController.extend({
  actions: {
    test: function() {
      this.transitionToRoute('competition', 1);
    }
  }
});