module InlineHelper
  def svg(name)
    file_path = "#{Rails.root}/public/assets/svg/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    "(not found) #{file_path}"
  end
end
