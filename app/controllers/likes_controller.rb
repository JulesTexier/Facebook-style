class LikesController < ApplicationController
    before_action :find_gossip
    before_action :find_like, only: [:destroy]
    before_action :authenticate_user
  
    def new
  
    end
  
    def create
      if already_liked?
        flash[:notice] = "Vous ne pouvez pas liker plusieurs fois le même gossip !"
      else
        @gossip.likes.create(user_id: current_user.id)
      end
      redirect_to gossip_path(@gossip)
    end
  
    def destroy
      if !(already_liked?)
        flash[:notice] = "Impossible de unlike !"
      else
        @like.destroy
      end
      redirect_to gossip_path(@gossip)
    end
  
    private
  
    def authenticate_user
      unless current_user
        flash[:danger] = "Connecte-toi"
        redirect_to new_session_path
      end
    end
  
    def find_gossip
      @gossip = Gossip.find(params[:gossip_id])
    end
  
    def find_like
      @like = @gossip.likes.find(params[:id])
    end
  
    def already_liked?
      Like.where(user_id: current_user.id, gossip_id: params[:gossip_id]).exists?
    end
 end