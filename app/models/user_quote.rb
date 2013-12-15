class UserQuote < ActiveRecord::Base
  attr_accessible :delivery_date, :delivery_time, :last_sent, :times_sent

  belongs_to :user
  belongs_to :quote
end
