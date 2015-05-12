module Admin
  class ApplicationController < ActionController::Base
    layout '/admin/layouts/application.html.haml'
    protect_from_forgery with: :exception
  end

end