class SessionsController < ApplicationController
  def new
  end

  def create
      # cherche s'il existe un utilisateur en base avec l’e-mail
      user = User.find_by(email: params[:email])

      # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, success: 'Vous êtes connecté'
      else
        redirect_to new_session_path , danger: 'Invalid email/password combination'
      end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end


# id = session[:user_id]
# @user = User.find(id)