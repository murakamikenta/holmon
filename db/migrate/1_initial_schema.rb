class InitialSchema < ActiveRecord::Migration
  def change
    create_table :posts, force: true do |t|
      t.integer :user_id,              null: false
      t.string :title,    limit: 140
      t.text :body
      t.integer :quantity,  default: 0
      t.string :unit,    limit: 70
      t.integer :price,  default: 0
      t.integer :amount,  default: 0
      t.string :place,    limit: 140
      t.string :category,    limit: 140
      t.integer :category_id, default: 0
      t.text :remarks
      t.binary :image
      t.string :url
      t.datetime :closed_at
      
      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, [:user_id, :category]
    add_index :posts, [:user_id, :category_id]
    
    create_table :comments, force: true do |t|
      t.integer :post_id,              null: false
      t.integer :user_id,              null: false
      t.string :title,    limit: 140
      t.text :body
      t.boolean :unread, default: true
      
      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
    add_index :comments, [:post_id, :user_id]
    
    create_table :users, force: true do |t|
      t.string :name,    limit: 140,              null: false
      t.string :email, limit: 50,              null: false
      t.boolean :admin, default: false
      t.text :description
      t.string :tel,    limit: 20
      t.string :password_digest
      t.string :remember_token
      t.string :access_token
      t.text :address
      t.string :url
      t.string :facebook
      t.string :twitter
      t.integer :reputation
      t.string :image
      t.string :facebook_id
      t.string :twitter_id
      t.binary :image
      
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :tel, unique: true
    add_index :users, :remember_token
    add_index :users, :access_token
    add_index :users, :facebook_id
    add_index :users, :twitter_id
    
  end
end
