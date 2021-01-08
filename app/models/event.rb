class Event < ApplicationRecord
  validates :name, length: {maximum: 50}, presence:true
  validates :place, length: {maximum: 50}, presence:true
  validates :content, length: {maximum: 50}, presence:true
  validates :stard_at, presence:true
  validates :end_at, presence:true
  validates :stard_at_shouldbe_before_end_at

  private

  def stard_at_shouldbe_before_end_at
    return unless stard_at && end_at

    if stard_at >= end_at
      errors.add(:stard_at, "は終了時間よりも前に設定してください")
    end
  end
end
