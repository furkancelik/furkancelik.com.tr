class Article < ActiveRecord::Base
  has_and_belongs_to_many :category, dependent: :destroy
end
