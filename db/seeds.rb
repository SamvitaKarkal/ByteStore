# Create Admin user:
Admin.create!(first_name: 'Oliver', last_name: 'Twist', email: 'olivertwist@example.com', password: 'oliveOliver')
puts "======== Admin Oliver created ============"

# create Categories:
Category.create!(name: 'Sports', description: 'Men\'s and Women\'s sports wear')
Category.create!(name: 'Books', description: 'Fiction/Financial/Horror books')
Category.create!(name: 'Music', description: 'Pop/Rock/Rap music')
Category.create!(name: 'Home decor', description: 'Plants/dream catcher..etc')
puts "======== Categories Sports, Books and Music created ========"
