# Post(id: :integer, title: :string, body: :text, published_at: :datetime)
# class Post < ApplicationRecord
#   has_many :comments
# end

# Comment(id: :integer, body: :string, author_id: :integer, removed: :boolean)
# class Comment < ApplicationRecord
#   belongs_to :post
#   belongs_to :author
# end

# Author(id: :integer, first_name: :string, last_name: :string)
# class Author < ApplicationRecord
#   has_many :comments
# end

# W aplikacji zostały zdefiniowane następujące modele
# Napisz serwis, który:
# 1. Przyjmie w paramterach numer strony i limit na stronę
# 2. Ograniczy maksymalny limit do 100
# 3. Wyciągnie tylko opublikowane posty i posortuje je malejąco po dacie publikacji
# 4. Zwróci hash o podanej strukturze:
# - id, tytuł i treść posta,
# - kolekcje komentarzy: id, body i imię i naziwsko autora ( bez komentarzy oznaczonych jako usuniete )

class FetchPosts
  PAGE_LIMIT = 100

  def initialize(page_number, page_limit)
    @page_number = page_number
    @page_limit = page_limit > PAGE_LIMIT ? PAGE_LIMIT : page_limit
  end

  def call
    all_pages_with_posts = pages_with_posts(all_published_posts)
    selected_page_with_posts = collect_posts_from_page(all_pages_with_posts)
    build_hash(selected_page_with_posts)
  end

  private

  def all_published_posts
    Post.order(published_at: :desc).includes(:author, :comments)
  end

  def pages_with_posts(posts)
    arr = []
    posts.each_slice(@page_limit.to_i) { |c| arr << c }
    arr
  end

  def collect_posts_from_page(all_pages)
    @page_number > all_pages.count + 1 ? all_pages.last : all_pages[@page_number - 1]
  end

  def build_hash(page)
    hsh = { posts: [] }
    page.each do |post|
      current_post = { id: post.id, title: post.title, body: post.body, comments: [] }
      author = post.author

      post.comments.where(removed: false).each do |comment|
        current_post[:comments] << { id: comment.id, body: comment.body, author: "#{author.first_name} #{author.last_name}" }
      end

      hsh[:posts] << current_post
    end

    hsh
  end
end
