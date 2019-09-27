class PagesController < ApplicationController
  def support
    render 'pages/support'
  end


  def index
    render 'app/index'
  end
end
