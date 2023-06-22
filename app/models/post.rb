# class Post < ApplicationRecord
#     # validates :title, presence: true, clickbait: true
#     # # validates :content, length: { minimum: 250 }
#     # # validates :summary, length: { maximum: 250 }
#     # # validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
# end
class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  
    validate :title_contains_clickbait_phrases
  
    private
  
    def title_contains_clickbait_phrases
      unless title&.match?(/(Won't Believe|Secret|Top \d|Guess)/)
        errors.add(:title, "must be clickbait-y")
      end
    end
  end
  
