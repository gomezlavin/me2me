class UserQuote < ActiveRecord::Base
  attr_accessible :delivery_date, :delivery_time, :last_sent, :times_sent

  belongs_to :users
  belongs_to :quotes
end
