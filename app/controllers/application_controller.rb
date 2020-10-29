class ApplicationController < ActionController::Base
    include SessionsHelper
    add_flash_types :info, :error, :danger, :warning, :success, :notice

end
