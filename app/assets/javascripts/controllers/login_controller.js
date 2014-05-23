Prodetotal2.LoginController = Ember.Controller.extend({
  loginDisabled: true,
  actions: {
    login: function() {
      console.log('Login function in LoginController');
      FB.login(function(response) {				
        this.check_fb_login(response);
      }.bind(this));
    }
  },
  check_fb_login: function(response) {
    var loginController = this;
    if (response.status === 'connected') {
      $.ajaxSetup({
        beforeSend: function(xhr) {
            xhr.setRequestHeader('Facebook-User-Id', response.authResponse.userID);
            xhr.setRequestHeader('Facebook-User-Token', response.authResponse.accessToken);
        }
      });
      this.store.find('user', response.authResponse.userID).then(
        function(user) {
          console.log(user);
          Prodetotal2.currentUser = user;
          loginController.transitionToRoute('home');
        },
        function(error) {
          loginController.enableLogin();  
        }
      );
    } else if (response.status === 'not_authorized') {
      loginController.enableLogin();
    } else {
      loginController.enableLogin();
    }
  },
  enableLogin: function() {
    this.set('loginDisabled', false);
  }
});