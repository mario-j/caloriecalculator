class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def index
    render "/index.html.erb"
  end
  
  def about
  	render "/application/about.html.erb"
  end
end
