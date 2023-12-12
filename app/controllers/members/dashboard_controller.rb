class Members::DashboardController < ApplicationController
  before_action :authenticate_member!

  def show
    dashboard = MemberDashboard.new(current_member)

    render json: dashboard, status: 200
  end
end
