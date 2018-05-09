class ApplicationController < ActionController::Base
  before_action :getSettings, :getData

  protect_from_forgery with: :exception
  include SessionsHelper

  protected

    def getData
      @menu = JSON.parse(File.read(Rails.root + 'app/data/menu.json'))
    end

    def getSettings
      @setting = Setting.first
    end
end
