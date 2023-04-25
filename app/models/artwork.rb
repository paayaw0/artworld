class Artwork < ApplicationRecord
    has_one_attached :media do |attachable|
        attachable.variant :medium, resize_to_limit: [250, 250]
    end
end
