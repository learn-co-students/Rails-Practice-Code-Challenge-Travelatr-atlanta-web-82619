class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    validates :name, uniqueness: true

    def most_liked_post
        self.posts.each { |p| p.likes }.max
    end

    def average_age
        array = self.bloggers.map { |blogger| blogger.age }.uniq
        array.sum / array.count
    end
end
