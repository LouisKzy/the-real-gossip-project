class SessionsController < ApplicationController
  
  before_action :authenticate_user, only: [:destroy]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Connexion réussie, stockez l'ID de l'utilisateur dans la session
      log_in(user)
      flash.now[:success] = " Vous êtes bien connecté ! "
      redirect_to root_url
    else
      # Erreur de connexion, affichez un message d'erreur
      flash.now[:alert] = " erreur !"
      render 'new'
    end
  end

  def destroy
    log_out
    flash.now[:alert] = "Déconnecté. A bientôt !"
    redirect_to root_path
  end

  private 

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
