class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event
  validations :comment, length: { maximum:30 }, allow_blank: true
end
