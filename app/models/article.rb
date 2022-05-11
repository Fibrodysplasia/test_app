# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  # make sure the following fields are present
  # for an article to be saved
  # google ActiveRecord validations for more
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  # now if we save an article with blank fields it will do nothing, so make
  # error message next
end