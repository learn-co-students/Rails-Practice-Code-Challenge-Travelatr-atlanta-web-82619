class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    def add_like
        self.likes += 1
    end
end
