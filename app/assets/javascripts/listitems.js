// model class 
var TripItem = Backbone.Model.extend({
  urlRoot: '/trips/'+tripId+'/items'
});

// view class
var TripView = Backbone.View.extend({
  tagName: 'li', 
  className: 'item',
  initialize: function() {
    this.model.on('hide', this.remove, this);
  },
  remove: function() {
    this.$el.remove();
  },
  template: _.template('Item: <%= name %>' + ' ' + 'Description: <%= description %>' + ' ' + 'Claimed? <%= is_claimed %>'),
  // note: h3 event below is scoped to particular el, meaning only the h3 clicked in this particular el will trigger alert
  events: {
    "click h3": "alertStatus"
  },
  alertStatus: function(event) {
    alert("hey you clicked an h3")
  },
  render: function() {
    var attributes = this.model.toJSON();
    this.$el.html(this.template(attributes));
    return this;
  }
});

// collection class
var TripList = Backbone.Collection.extend({
  el: '#items-list',
  tagName: 'ul',
  url: '/trips/'+tripId+'/items',
  model: TripItem,
  initialize: function() {
    this.on('remove', this.hideModel);
  },
  hideModel: function(model) {
    model.trigger('hide');
  }
})

// collection view class
var TripListView = Backbone.View.extend({
  initialize: function() {
    this.collection.on('add', this.addOne, this);
  },
  render: function() {
    this.collection.forEach(this.addOne, this);
  },
  addOne: function(tripItem) {
      var tripView = new TripView({ model: tripItem });
      this.$el.append(tripView.render().el);
  }
});

// model instance
var tripItem = new TripItem();

// view instance
var tripView = new TripView({ model: tripItem })




// collection instance
var tripList = new TripList();
tripList.fetch();


// collection view instance
var tripListView = new TripListView({ collection: tripList });
tripListView.render();
$("#items-list").append(tripListView.el)
