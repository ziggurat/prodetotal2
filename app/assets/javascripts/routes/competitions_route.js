Prodetotal2.CompetitionsRoute = Prodetotal2.AuthenticatedRoute.extend({
    model: function() {      
      return this.store.find('competition');
    }
});