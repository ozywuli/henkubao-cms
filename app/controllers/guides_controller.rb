class GuidesController < ApplicationController
  # https://stackoverflow.com/questions/28484226/serve-a-file-from-public-in-a-controller-action
  def index
    render file: "public/guides/index.html", layout: false
  end
end
