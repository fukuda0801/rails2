class User < ApplicationRecord
    validates :title, presence: true, length: {maximum:20}
    validates :start_day, presence: true
    validates :end_day,presence: true
    validate :not_before

    def not_before
        errors.add(:end_day,"starting date 以降にして下さい") if end_day.nil? || end_day < start_day
    end 

    validates :memo, length: {maximum:500}
end
