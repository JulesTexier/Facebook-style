class UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(password:params['password'], first_name: params['first_name'], last_name: params['last_name'], description: params['description'], city_id: params['city_id'],email: params['email'])
    if @user.save
      redirect_to ('/')
    else
      redirect_to new_user_path, warning: "Les info sont incomplètes"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
