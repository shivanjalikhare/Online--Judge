class Scoreboard < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :team, presence: true
  validates :correctness, presence: true
  validates :creativity, presence: true
  validates :relevance, presence: true
  validates :sustainability, presence: true
  validates :userExperience, presence: true
  
end
