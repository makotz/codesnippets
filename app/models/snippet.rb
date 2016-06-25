class Snippet < ActiveRecord::Base
  validates :title, presence: true
  validates :code_type, presence: true
  validates :work, presence: true
end
