class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
    render :edit
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Le profil a été mis à jour avec succès!'
    else
      render 'edit'
    end
  end
  
  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "Bievenue sur votre nouvelle page d'utilisateur "
    else
      render 'new', notice: 'Echec de la création' # En cas d'échec de la sauvegarde, réafficher le formulaire d'inscription avec les erreurs.
    end
  end

  private

  def user_params
    # Mon meilleur pote
    params.require(:user).permit(:email, :password, :password_confirmation, :city_id, :age, :first_name, :last_name, :description)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
