# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId
  resourcify
  friendly_id :title, use: %i[slugged finders]

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user

  def author?(user)
    self.user.eql? user
  end
end
