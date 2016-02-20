class Users::BaseController < ApplicationController
  before_filter :authenticate_user!
end
