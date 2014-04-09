Prodetotal2.Competition = DS.Model.extend({  
  name: DS.attr('string'),
  image: DS.attr('string')
});

Prodetotal2.Competition.FIXTURES = [
 {
   id: 1,
   name: 'UEFA Champions League',
   image: 'http://prodetotal.herokuapp.com/assets/competitions/UEFA_Champions_League_logo_128-c7703a3651a5cf01bc3a989aa0e536d0.png'
 },
 {
   id: 2,
   name: 'FIFA World Cup - Brasil 2014',
   image: ''
 },
 {
   id: 3,
   name: 'Copa Libertadores de America',
   image: ''
 }
];