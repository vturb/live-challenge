# Live Challenge - Ruby on Rails Interview Project

This is a pre-configured Rails application designed for technical interviews. It provides a realistic blog platform where candidates can demonstrate their Rails skills in a time-constrained environment.

## Features

✅ **Zero Setup Required** - Ready to use with GitHub Codespaces
✅ **Production-like Environment** - PostgreSQL, Redis, Docker
✅ **Pre-seeded Data** - Users, posts, and comments for testing
✅ **Authentication System** - Devise integration
✅ **Multiple Task Options** - 10-15 minute coding challenges
✅ **Realistic Codebase** - Follows Rails conventions and best practices

## Quick Start with GitHub Codespaces

1. **Open in Codespaces**: Click the green "Code" button → "Open with Codespaces"
2. **Wait for Setup**: Environment configures automatically (2-3 minutes)
3. **Start Development**: Run `rails server` and start coding!

### Test Credentials
- **Email**: admin@example.com
- **Password**: password123

Additional test users: john@example.com, jane@example.com, bob@example.com, alice@example.com (all with password: password123)

## Technology Stack

- **Rails** 8.0+
- **Ruby** 3.3+
- **PostgreSQL** 16
- **Redis** 7
- **Devise** (Authentication)
- **RSpec** (Testing framework)
- **Bootstrap**-inspired CSS (No external dependencies)

## Project Structure

```
app/
├── controllers/
│   └── posts_controller.rb     # CRUD for blog posts
├── models/
│   ├── user.rb                 # Devise user with Devise
│   ├── post.rb                 # Blog post with search scope
│   └── comment.rb              # Comments with approval system
└── views/
    ├── layouts/
    │   └── application.html.erb # Navigation and flash messages
    └── posts/                   # Post CRUD views
```

## Key Models and Relationships

### User
- Devise authentication
- `has_many :posts, :comments`
- Full name method

### Post
- Belongs to user
- `has_many :comments`
- Published/draft system
- Search functionality
- Validation for title and content

### Comment
- Belongs to user and post
- Approval system (approved/pending)
- Content validation

## Available Scopes and Methods

### Post Scopes
```ruby
Post.published          # Only published posts
Post.recent             # Ordered by creation date
Post.search(term)       # Search title and content
Post.by_user(user)      # Posts by specific user
```

### Comment Scopes
```ruby
Comment.approved        # Only approved comments
Comment.recent          # Ordered by creation date
```

## Development Commands

```bash
# Setup (automatic in Codespaces)
bundle install
rails db:create db:migrate db:seed

# Start development server
rails server

# Run tests
rspec

# Rails console
rails console

# Check routes
rails routes
```

## Docker Development (Alternative)

```bash
# Start services
docker-compose up

# Run Rails commands
docker-compose exec app rails console
docker-compose exec app rails db:migrate
```

## Environment Configuration

### Development
- PostgreSQL database: `interview_development`
- Mailer: localhost:3000
- Cache: Memory store
- Assets: Live reloading

### Test
- PostgreSQL database: `interview_test`
- RSpec configuration
- Factory Bot for test data

## Seed Data

The application comes with realistic seed data:
- 5 users (including admin)
- 6 blog posts (mix of published/draft)
- Multiple comments per post
- Approved and pending comments

## Interview Guidelines

### For Interviewers
1. Choose appropriate task based on candidate level
2. Allow 10-15 minutes for implementation
3. Focus on Rails conventions and best practices
4. Observe problem-solving approach

### For Candidates
1. Read task requirements carefully
2. Ask clarifying questions
3. Follow Rails conventions
4. Test your implementation
5. Explain your approach

## Troubleshooting

### Common Issues
- **Codespace loading**: Wait for full initialization
- **Database connection**: PostgreSQL may take time to start
- **Asset issues**: Run `rails assets:precompile`
- **Gem conflicts**: Run `bundle update`

### Reset Database
```bash
rails db:drop db:create db:migrate db:seed
```

## Contributing

This project is designed for interview purposes. To suggest improvements:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request with clear description

## License

MIT License - See LICENSE file for details.