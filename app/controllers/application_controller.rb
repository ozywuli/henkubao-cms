class ApplicationController < ActionController::Base
  before_action :getSettings

  protect_from_forgery with: :exception
  include SessionsHelper

  protected

    def getSettings
      @setting = Setting.first
    end
end
