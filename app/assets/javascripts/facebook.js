Prodetotal2.Facebook = Ember.Object.create({
  init: function() {
    var _this = this;
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));

      window.fbAsyncInit = function() {
        FB.init({
          appId      : '531110126986719',
          cookie     : true,  // enable cookies to allow the server to access 
                              // the session
          xfbml      : false,  // parse social plugins on this page
          version    : 'v2.0' // use version 2.0
        });
      };
      FB.getLoginStatus(function(response) {
        Prodetotal2.Facebook.check_fb_login(response, not_logged_in);
      });
  },
  check_fb_login: function(response) {
    console.log(response);
      // The response object is returned with a status field that lets the
      // app know the current login status of the person.
      // Full docs on the response object can be found in the documentation
      // for FB.getLoginStatus().
      if (response.status === 'connected') {
        // Logged into your app and Facebook.
        this.userID = response.authResponse.userID;
        this.userToken = response.authResponse.accessToken;
        $.ajax({
          url: "/api/v1/user",
          beforeSend: function(xhr){
            xhr.setRequestHeader('Facebook-User-Id', response.authResponse.userID);
            xhr.setRequestHeader('Facebook-User-Token', response.authResponse.accessToken);
          },
          statusCode: {
            401: function() {
              alert( "Unauthorized!" );
            }
          }
        }).done(function(data) {
          console.log(data);
          not_logged_in();
          alert("Done!");
        }).fail(function() {
          alert("Failed");
        });
      } else if (response.status === 'not_authorized') {
        // The person is logged into Facebook, but not your app.
        $('#fb_login_btn').removeClass("disabled");
      } else {
        // The person is not logged into Facebook, so we're not sure if
        // they are logged into this app or not.
        // document.getElementById('fb_login_btn').innerHTML = 'Please log ' + 'into Facebook.';
        $('#fb_login_btn').removeClass("disabled");
      }
  }
});