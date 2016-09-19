class Question < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 40}, uniqueness: true
  validates :description, presence: true, length: {minimum: 150}
end
