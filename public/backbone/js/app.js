(function(){
    console.log("Hello Backbone!");
    
    var obj = new Backbone.Model();
    
    obj.set({ name: "Murakami" });
    obj.set({ age: 30 });
    
    console.log("obj: " + JSON.stringify(obj));
    console.log("obj.name: " + obj.get("name"));
    
    var Staff = Backbone.Model.extend({
      defaults: {
        "name": "",
        "age": 0,
        "updateTime": new Date()
      },
      initialize: function() {
        console.log("Staff[" + this.cid + "]: " + JSON.stringify(this));
      }
    });
    
    var tmpStaff = new Staff();
    tmpStaff.set({ name: "Murakami", age: 15, id: 101});
    
    console.log("Staff[" + tmpStaff.cid + "]: " + JSON.stringify(tmpStaff));
    
    var tmpStaff2 = new Staff({ name: "Kenta", age: 30, id: 102});
})();
