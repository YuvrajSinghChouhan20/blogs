class User < ApplicationRecord
  rolify

  before_create :set_role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :articles, after_add: :set_author, dependent: :destroy

  private

  def set_author(article)
    add_role :author, @article
  end

  def set_role
    add_role :user
  end
end
