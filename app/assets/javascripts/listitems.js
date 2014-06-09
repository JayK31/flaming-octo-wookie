// model
var ListItem = Backbone.Model.extend({
  urlRoot: '/trips/'+tripId+'/items'
});

// view
var ListView = Backbone.View.extend({
  template: _.template('<h3><%= name %></h3>'),
  // note: h3 event below is scoped to particular el, meaning only the h3 clicked in this particular el will trigger alert
  events: {
    "click h3": "alertStatus"
  },
  alertStatus: function(event) {
    alert("hey you clicked an h3")
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});

// collection
var ItemList = Backbone.Collection.extend({
  url: '/trips/'+tripId+'/items',
  model: ListItem
})

// collection view
var ItemListView = Backbone.View.extend({
  initialize: function() {
    this.collection.on('add', this.addOne, this);
  },
  render: function() {
    this.collection.forEach(this.addOne, this);
  },
  addOne: function(listItem) {
      var listView = new ListView({ model: listItem });
      this.$el.append(listView.render().el);
  }
});

// model instance
var listItem = new ListItem();

// view instance
var listView = new ListView({ model: listItem })




// collection instance
var itemList = new ItemList();
itemList.fetch();


// collection view instance
var itemListView = new ItemListView({ collection: itemList });
itemListView.render();
$(".items-list").append(itemListView.el)
// console.log(itemListView.el);  
