class Post < ApplicationRecord
  validates :title,
  presence: true,
  length: { minimum: 5 }

  before_save :parameterize_slug

  def parameterize_slug
    self.slug = self.slug.to_s.gsub(/\s+/, '-')
  end

  # def to_param
  #   self.slug.parameterize
  # end




end
