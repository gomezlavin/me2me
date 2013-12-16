class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:index, :new, :create]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    #Create user and send welcome email
    @user = User.create(params[:user])
    if @user.errors.empty?
      sign_in(@user)
      EmailWorker.perform_async(@user.id)
      redirect_to user_path(@user.id)
    else
      # flash[:errors] stores an array of errors in the application
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def current
    render json: [current_user]
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
