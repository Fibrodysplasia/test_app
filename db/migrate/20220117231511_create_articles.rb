class CreateArticles < ActiveRecord::Migration[6.0]
  #the numbers in the filename are a timestamp slapped in there by the 
  #rails generate function
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
    end
  end
end
