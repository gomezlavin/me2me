class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:index, :new, :create]

  def show
    #@user = User.find(params[:id])
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.errors.empty?
      sign_in(@user)
      # UserMailer.welcome_email(@user).deliver
      redirect_to user_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages  #con esto estás guardando en flash los errores, y los estamos desplegando en el application view
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
