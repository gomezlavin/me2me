class Quote < ActiveRecord::Base
  attr_accessible :author, :quote, :category

  has_many :user_quotes
  has_many :users, through: :user_quotes
end
