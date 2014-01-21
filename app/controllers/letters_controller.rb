class LettersController < ApplicationController

  def show
  # Retrieves user's archived and due letters from the DB
    data = Letter.getLetters(current_user)
    render json: data
  end

  def update
    # Add a new letter to the user's profile
    Letter.newLetter(params,current_user)
    render json: ["Success!"]
  end

  def archived
    # Returns a specific letter from the user
    data = Letter.returnArchivedLetter(params,current_user)
    render json: data
  end

end
