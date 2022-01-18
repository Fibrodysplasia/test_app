class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    #here I am adding to the previously created table
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
    #naming it created_at etc makes rails automatically track it for us
  end
end
