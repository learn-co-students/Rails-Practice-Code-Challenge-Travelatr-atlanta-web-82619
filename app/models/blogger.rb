class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.sum { |post| post.likes }
    end

    def most_popular_post
        self.posts.max_by { |post| post.likes}
    end

    def top_destinations
        total = self.destinations.group_by{ |x| x }.map { |x, y| [y.size, x] }
        total.sort.reverse
    end
end
