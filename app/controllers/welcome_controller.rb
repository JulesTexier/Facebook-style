class WelcomeController < ApplicationController
  def first_name
    @name = params[:first_name]
  end
end
