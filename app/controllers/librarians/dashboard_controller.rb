class Librarians::DashboardController < ApplicationController
  before_action :authenticate_librarian!

  def show
    dashboard = LibrarianDashboard.new

    render json: dashboard, status: 200
  end
end