Prodetotal2.CompetitionsRoute = Prodetotal2.AuthenticatedRoute.extend({
    model: function() {
      //var adapter = Prodetotal2.ApiAdapter.create();
      return this.adapter.getCompetitions();
    }
});