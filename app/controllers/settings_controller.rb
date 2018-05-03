class SettingsController < ApplicationController

  def index
    @setting = Setting.first
  end

  def create
    @setting = Setting.new(test_params)
    if @setting.save
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @setting = Setting.first

    if @setting.update(setting_params)
      # Reload the page after successful update
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def test_params
      params.permit(:metaTitle, :metaAuthor, :metaDescription, :metaKeywords, :social)
    end
  
    def setting_params
      params.require(:setting).permit(:metaTitle, :metaAuthor, :metaDescription, :metaKeywords, :social)
    end


end
