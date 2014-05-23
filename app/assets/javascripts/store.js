// http://emberjs.com/guides/models/using-the-store/

Prodetotal2.Store = DS.Store.extend({
  adapter: 'DS.RESTAdapter'
});

DS.RESTAdapter.reopen({
  namespace: 'api/v1'
});

