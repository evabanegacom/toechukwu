class User < ApplicationRecord
    def self.search(search)
        where('category LIKE ?', "#{search}")
    end

    before_validation :strip_blanks

    def strip_blanks
        self.first_name = self.first_name.strip
        self.last_name = self.last_name.strip
      end

    scope :unique_by_category, lambda { select('DISTINCT(category)') }

    validates :first_name, presence: true
    validates_uniqueness_of :first_name, scope: :last_name
    validates :last_name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :category, presence: true
end
