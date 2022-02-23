class Feeling < ApplicationRecord
  belongs_to :user
  attachment :image
end
