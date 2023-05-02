class Subscriber < ApplicationRecord
  EMAIL_REGEXP = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

  validates :email, uniqueness: true
  validates :email, format: { with: EMAIL_REGEXP }

  after_create_commit -> {
    broadcast_replace_to "subscribers-count", target: "subscribers-target", partial: "subscribers/subscribers_count", locals: { subscribers_count: Subscriber.all.size }
  }
end
