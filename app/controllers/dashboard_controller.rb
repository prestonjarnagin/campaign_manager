class DashboardController < ApplicationController
  before_action :require_login

  def show
    @facade = DashboardFacade.new
  end
end
