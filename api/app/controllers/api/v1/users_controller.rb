class Api::V1::UsersController < ApplicationController
  def index
    render json: { status: 200, users: User.all, message: "success" }
  end
end
