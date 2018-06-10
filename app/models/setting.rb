class Setting < ApplicationRecord
  has_many :socialAddresses, inverse_of: :setting
  accepts_nested_attributes_for :socialAddresses
  
  has_one :socialUrl
end
