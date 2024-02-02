# frozen_string_literal: true

class User < ApplicationRecord # rubocop:disable Style/Documentation
  rolify

  before_create :set_role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :articles, after_add: :add_author, dependent: :destroy

  private

  def add_author(article)
    add_role :author, article
  end

  def set_role
    add_role :user
  end
end
