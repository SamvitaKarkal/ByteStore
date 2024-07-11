class AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :set_current_admin

  def index
  end

  private

  def set_current_admin
    @current_admin = current_admin
  end
end
