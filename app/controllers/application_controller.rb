class ApplicationController < ActionController::Base
    include SessionsHelper
    add_flash_types :info, :error, :warning, :success, :notice

end
