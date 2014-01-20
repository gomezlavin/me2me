class Letter < ActiveRecord::Base
  attr_accessible :subject, :body, :delivery_date

  belongs_to :user

  # Method that returns the users' letters
  def self.getLetters(current_user)
    result = []

    u = User.find_by_id(current_user.id)
    archived_letters = Letter.where(["delivery_date <= ?", Time.now])
    due_letters = Letter.where(["delivery_date > ?", Time.now])

    result[0] = archived_letters
    result[1] = due_letters
    return result
  end

  # Method to add a new letter to the user's DB
  def self.newLetter(params,current_user)
    date = DateTime.new(params[:year].to_i,params[:month].to_i,params[:day].to_i,10,0,0)
    u = User.find_by_id(current_user.id)
    l = Letter.create(
      subject: params[:subject],
      body: params[:body],
      delivery_date: date)
    u.letters << l
  end

end
