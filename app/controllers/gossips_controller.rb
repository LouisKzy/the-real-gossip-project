class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def index 
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user
    @gossip.user.city = current_user.city
    if @gossip.save
      redirect_to gossip_path(@gossip), notice: 'Le potin a été créé avec succès!'
    else
      render 'new', notice: 'Il y a eu un problème'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip), notice: 'Le potin a été mis à jour avec succès!'
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to "/", notice: 'Le potin a été supprimer!'
  end

  private

  def gossip_params
    # Mon meilleur pote
    params.require(:gossip).permit(:title, :content, :user_id)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez vous connecter pour accéder à cette fonctionnalité."
      redirect_to new_session_path
    end
  end

end
