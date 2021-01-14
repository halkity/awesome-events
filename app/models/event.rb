class Event < ApplicationRecord
  has_many :tickets
  # has_many :join_users, through: :tickets, source: :user
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  validates :name, length: {maximum: 50}, presence:true
  validates :place, length: {maximum: 50}, presence:true
  validates :content, length: {maximum: 50}, presence:true
  validates :start_at, presence:true
  validates :end_at, presence:true
  validate :start_at_shouldbe_before_end_at

  def created_by?(user)
    return false unless user # ログインしていない場合は
    owner_id == user.id
  end

  private

  def start_at_shouldbe_before_end_at
    return unless start_at && end_at
    if start_at >= end_at
      errors.add(:start_at, "は終了時間よりも前に設定してください")
    end
  end

end
