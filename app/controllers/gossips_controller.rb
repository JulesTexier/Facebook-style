class GossipsController < ApplicationController
  
  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :creator_user, only: [:edit, :update, :destroy]
  

  def show
    @gossip = Gossip.find(params[:id])
  end
  

  def edit
    @gossip = Gossip.find(params[:id])
    
  end
  
  def update
      @gossip = Gossip.find(params[:id])
      gossip_params = params.require(:gossip).permit(:title, :content)
      if @gossip.update(gossip_params)
        redirect_to @gossip
        else 
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end


  def new
    @gossip = Gossip.new
  end  
  
  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user: current_user)
    
    if @gossip.save
      redirect_to @gossip
      
    else
      render ('new')
      end  
    end  


  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def creator_user
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
    flash[:danger] = "Action Impossible"
    redirect_to @gossip
    end
  end

end


