class User < ApplicationRecord
    def self.search(search)
        where('category LIKE ?', "#{search}")
    end

    scope :unique_by_category, lambda { select('DISTINCT(category)') }
end
