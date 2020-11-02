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
    # @user = User.new(password:params['password'], password_confirmation:params['password_confirmation'], first_name: params['first_name'], last_name: params['last_name'], description: params['description'], city_id: params['city_id'],email: params['email'])
    
    # if @user.save
    #     # log_in(@user)
    #     redirect_to ('/')
    #   else
    #     redirect_to new_user_path, warning: "Les info sont incomplètes"
    #   end
    # end
    @user = User.find_by(email: email_dans_ton_params)
      if user && user.authenticate(password_dans_ton_params)
        login(user)
    
        # on va cuisiner le cookie pour l'utilisateur
        remember(user)
    
        # redirige où tu veux, avec un flash ou pas
    
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  
  end

  def update
  end

  def edit
  end

  def destroy
  end

end

