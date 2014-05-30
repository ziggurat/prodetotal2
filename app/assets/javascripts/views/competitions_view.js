Prodetotal2.CompetitionsView = Ember.View.extend({
  didInsertElement: function() {
    $('#content').slimScroll({      
      height: '450px',
      size: '6px',
      position: 'right',
      color: '#AAAAAA',
      alwaysVisible: true,
      distance: '3px',
      railVisible: true,
      railColor: '#333333',
      railOpacity: 0.9,
      wheelStep: 5,
      allowPageScroll: false,
      disableFadeOut: false
    });
  }
});