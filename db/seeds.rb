# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create test users for interview candidates
puts "Creating test users..."

# Admin user
admin = User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.first_name = 'Admin'
  user.last_name = 'User'
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Regular users
users = [
  { email: 'john@example.com', first_name: 'John', last_name: 'Doe' },
  { email: 'jane@example.com', first_name: 'Jane', last_name: 'Smith' },
  { email: 'bob@example.com', first_name: 'Bob', last_name: 'Johnson' },
  { email: 'alice@example.com', first_name: 'Alice', last_name: 'Williams' }
]

created_users = []
users.each do |user_attrs|
  user = User.find_or_create_by!(email: user_attrs[:email]) do |u|
    u.first_name = user_attrs[:first_name]
    u.last_name = user_attrs[:last_name]
    u.password = 'password123'
    u.password_confirmation = 'password123'
  end
  created_users << user
end

puts "Created #{created_users.count + 1} users"

# Create sample posts
puts "Creating sample posts..."

posts_data = [
  {
    title: "Welcome to Our Blog",
    content: "This is the first post on our blog. We're excited to share our thoughts and ideas with you. This post serves as an introduction to what you can expect from our content.",
    published: true
  },
  {
    title: "Getting Started with Ruby on Rails",
    content: "Ruby on Rails is a powerful web application framework that makes it easy to build robust applications quickly. In this post, we'll cover the basics of setting up a Rails application and explore some of its key features.",
    published: true
  },
  {
    title: "Building RESTful APIs",
    content: "RESTful APIs are the backbone of modern web applications. Learn how to design and implement clean, maintainable APIs using Rails. We'll cover routing, controllers, serialization, and authentication.",
    published: true
  },
  {
    title: "Database Design Best Practices",
    content: "A well-designed database is crucial for application performance and maintainability. This post covers normalization, indexing strategies, and common pitfalls to avoid when designing your database schema.",
    published: true
  },
  {
    title: "Testing Your Rails Application",
    content: "Testing is an essential part of software development. Learn about different testing strategies, from unit tests to integration tests, and how to implement them effectively in your Rails application.",
    published: false
  },
  {
    title: "Performance Optimization Tips",
    content: "As your application grows, performance becomes increasingly important. This post covers caching strategies, database optimization, and other techniques to keep your Rails application running smoothly.",
    published: true
  }
]

all_users = [admin] + created_users

posts_data.each_with_index do |post_data, index|
  user = all_users[index % all_users.count]

  post = Post.find_or_create_by!(title: post_data[:title]) do |p|
    p.content = post_data[:content]
    p.published = post_data[:published]
    p.user = user
  end

  # Add some comments to published posts
  if post.published? && post.comments.empty?
    comment_count = rand(2..5)
    comment_count.times do |i|
      commenting_user = all_users.sample

      comments = [
        "Great post! Thanks for sharing this information.",
        "This is very helpful. I learned something new today.",
        "I have a question about this topic. Could you elaborate?",
        "Excellent explanation! Looking forward to more content like this.",
        "This solved a problem I was having. Much appreciated!"
      ]

      Comment.create!(
        content: comments.sample,
        user: commenting_user,
        post: post,
        approved: [true, true, true, false].sample # Most approved, some pending
      )
    end
  end
end

puts "Created #{Post.count} posts with comments"

puts "\n" + "="*50
puts "SEED DATA SUMMARY"
puts "="*50
puts "Users created: #{User.count}"
puts "Posts created: #{Post.count}"
puts "Comments created: #{Comment.count}"
puts "Published posts: #{Post.published.count}"
puts "Approved comments: #{Comment.approved.count}"
puts "\nTest credentials:"
puts "Email: admin@example.com"
puts "Password: password123"
puts "\nOther test users: john@example.com, jane@example.com, bob@example.com, alice@example.com"
puts "All passwords: password123"
puts "="*50
