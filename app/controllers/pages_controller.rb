class PagesController < ApplicationController

  # todas las acciones de este controlador son publicas
  skip_before_action :require_login


  def home
  end

  def about
  end

  def contact
  end
end
