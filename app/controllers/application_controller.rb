class ApplicationController < ActionController::Base
skip_for_action :verify_authenticity_token
end
