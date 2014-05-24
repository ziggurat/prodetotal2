Prodetotal2.HomeRoute = Prodetotal2.AuthenticatedRoute.extend({
    model: function() {
      return this.store.findById('user', localStorage.userId);
    }
});