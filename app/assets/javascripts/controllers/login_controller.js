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
      localStorage.token = response.authResponse.accessToken;
      localStorage.userId = response.authResponse.userID;
      Ember.$.ajaxSetup({
        beforeSend: function(xhr) {
            xhr.setRequestHeader('Facebook-User-Id', localStorage.userId);
            xhr.setRequestHeader('Facebook-User-Token', localStorage.token);
        }
      });
      this.store.find('user', response.authResponse.userID).then(
        function(user) {
          localStorage.currentUser = JSON.stringify(user);
          loginController.transitionToRoute('competitions');
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
    localStorage.currentUser = null;
    localStorage.token = null;
    localStorage.userId = null;
    this.set('loginDisabled', false);
  }
});