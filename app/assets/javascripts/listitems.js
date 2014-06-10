$(document).ready(function() {

// model class 
  var TripItem = Backbone.Model.extend({
    urlRoot: '/trips/'+tripId+'/items'
  });

  // view class
  var TripView = Backbone.View.extend({
    // el: "#items-list",
    tagName: 'tr',
    className: 'item',
    events: {
      "click .item-name": "addItem"
    },
    addItem: function() {
      debugger;
      var item = $("#new-item").val()
      var description = $("#new-item-desc").val()
      var quantity = $("#new-item-quantity").val()
      var newTripItem = new TripItem()
      newTripItem.set({ name: item, description: description, quantity: quantity })
    },
    initialize: function() {
      // _.bindAll(this, this.render)
      // console.log(this.$el)
      // this.model.on('hide', this.remove, this);
    },
    remove: function() {
      this.$el.remove();
    },
    template: _.template('<td class="item-name">'+'<%= name %>' + '</td> ' + '<td class="item-desc">' + '<%= description %>' + '</td> ' + '<td class="item-claimed">' + '<%= is_claimed %>' + '</tr>'),
    // note: h3 event below is scoped to particular el, meaning only the h3 clicked in this particular el will trigger alert
 
    render: function() {
      var attributes = this.model.toJSON();
      this.$el.html(this.template(attributes));
      return this;
    }
  });

  // collection class
  var TripList = Backbone.Collection.extend({
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
    el: "#items-list",
    events: {
      // "click .item-name": "addOne",
      // "click .item-name": "hiThere"
    },
    // hiThere: function(event) {
    //   event.preventDefault();
    //   alert('hi')
    // },
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
  $("#items").append(tripListView.el)
});
