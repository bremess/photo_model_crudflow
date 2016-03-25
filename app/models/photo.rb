class Photo < ActiveRecord::Base
    validates :caption, presence: true
    validates :photo, presence: true
end
