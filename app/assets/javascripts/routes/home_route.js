Prodetotal2.HomeRoute = Prodetotal2.AuthenticatedRoute.extend({
    model: function() {
      return {
        competitions: competitions,
        user: this.store.findById('user', localStorage.userId) 
      }
    }
});