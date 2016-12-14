# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :sub_id, :author_id, presence: true
  validates :posts, presence: true
  
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :sub

  has_many :post_subs

  has_many :posts, through: :post_subs, source: :sub
end
