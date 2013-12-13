class Letter < ActiveRecord::Base
  attr_accessible :subject, :body, :delivery_date

  belongs_to :user
end
