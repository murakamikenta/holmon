(function(){
	"use strict";
	
	var Post = Backbone.Model.extend({
		idAttribute: "id",
		defaults: {
			"title": "",
			"body": ""
		},
		validate: function(attributes){
			if(attributes.content === "" || attributes.title === ""){
				return "title and content must be not empty.";
			}
		}
	});
	
	var PostList = Backbone.Collection.extend({
		model: Post,
		url: "../api/posts" // Collectionに格納する場合はモデルのurl設定は不要
	});
	
	var ItemView = Backbone.View.extend({
		tmpl: _.template($("#tmpl-itemview").html()),
		events: {
			"click .delete": "onDelete"
		},
		initialize: function(){
			_.bindAll(this, 'onDelete', 'onDestroy', 'render');
			this.listenTo(this.model, "change", this.render);
			this.listenTo(this.model, "destroy", this.onDestroy);
		},
		onDelete: function(){
			this.model.destroy();
		},
		onDestroy: function(){
			this.remove();
		},
		render: function(){
			this.$el.html(this.tmpl(this.model.toJSON()));
			return this;
		}
	});
	
	var ListView = Backbone.View.extend({
		initialize:function () {
			this.listenTo(this.collection, "add", this.addItemView);
			var _this = this;
			this.collection.fetch({reset: true}).done(function(){
				_this.render();
			});
		},
		render: function(){
			this.collection.each(function (item) {
				this.addItemView(item);
			}, this);
			return this;
		},
		addItemView: function(item){
			this.$el.append(new ItemView({model: item}).render().el);
		}
	});
	
	var AppView = Backbone.View.extend({
		events:{
			"click #addBtn": "onAdd"
		},
		initialize: function () {
			_.bindAll(this, 'render', 'onAdd');
			
			this.$title = $("#addForm [name='title']");
			this.$body = $("#addForm [name='body']");
			
			this.collection = new PostList();
			
			this.listView = new ListView({el: $("#postList"), collection: this.collection});
			
			this.render();
		},
		render: function () {
			this.$title.val('');
			this.$body.val('');
		},
		onAdd: function () {
			this.collection.create({title: this.$title.val(), body: this.$body.val()}, {
	            headers:{
	                //"Authorization":'Basic ' + btoa("eeb672c1077457e706413edada9a3f2f6bf28cf2:")
	            	"Authorization":"4885fe49032a3af91fd6cedb5a2f850629aa778c"
	            }, wait: true }  );
			this.render();
		}
	});
	
	var appView = new AppView({el: $("#main")});
	
})();
