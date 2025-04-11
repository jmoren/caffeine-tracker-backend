# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = [ 'jmoren@example.com', 'david@example.com', 'matias@example.com' ]
password = '123qwe'

users.each do |email|
  User.find_or_create_by!(email: email) do |user|
    user.username = email.split("@").first
    user.password = password
  end
end


drinks = [
  {
    name: 'Monster Ultra Sunrise',
    description: 'A refreshing orange beverage that has 75mg of caffeine per serving. Every can has two servings.',
    size: nil,
    caffeine: 75,
    image_url: 'https://imgs.search.brave.com/IsPqfTS7ZLVGbf3caIFl_nXavddsAAILG0OUWse4U5A/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9kMmlp/YWhnMGlwNWFmbi5j/bG91ZGZyb250Lm5l/dC9tZWRpYS9tb25z/dGVyLXVsdHJhL2lt/YWdlcy8yMTQwNzI4/NjcubW9uc3Rlci0x/Nm96LTIwMjAtZW5l/cmd5LXplcm9zdWdh/ci11bHRyYXN1bnJp/c2UtZnJvbnQuanBn'
  },
  {
    name: 'Black Coffee',
    description: 'The classic, the average 8oz. serving of black coffee has 95mg of caffeine.',
    size: nil,
    caffeine: 95,
    image_url: 'https://imgs.search.brave.com/gODBepnDK1EgDTVv_WsHCHHPtbeDl8XwD8C-i8cO2Is/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bmV4dGRheWNvZmZl/ZS5jby51ay9pbWFn/ZXMvdmlydHVlbWFy/dC9wcm9kdWN0L3Jl/c2l6ZWQvOG96LURX/LW1hdHQtYmxhY2st/Y3Vwcy1DVU1CMDAx/LTAwMVQud2VicA'
  },
  {
    name: 'Americano',
    description: 'Sometimes you need to water it down a bit... and in comes the americano with an average of 77mg. of caffeine per serving.',
    size: nil,
    caffeine: 77,
    image_url: 'https://imgs.search.brave.com/gODBepnDK1EgDTVv_WsHCHHPtbeDl8XwD8C-i8cO2Is/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bmV4dGRheWNvZmZl/ZS5jby51ay9pbWFn/ZXMvdmlydHVlbWFy/dC9wcm9kdWN0L3Jl/c2l6ZWQvOG96LURX/LW1hdHQtYmxhY2st/Y3Vwcy1DVU1CMDAx/LTAwMVQud2VicA'
  },
  {
    name: 'Sugar free NOS',
    description: 'Another orange delight without the sugar. It has 130 mg. per serving, and each can have two servings.',
    size: nil,
    caffeine: 130,
    image_url: 'https://imgs.search.brave.com/X8P4lrGNb-Y3UJokdopqHQudgHujt4rUElblv0hcey0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLm1j/dGltZy5jb20vY2Ru/LWNnaS9pbWFnZS93/PTQwMCxoPTQwMCxm/aXQ9cGFkL2h0dHBz/Oi8vaS5tY3RpbWcu/Y29tL2ZpbGUvZGZh/MDdiZjlhYTQ2ZDc3/MGE2ZTIzMDViN2U4/ZTVmMzJjZDVlMjdj/Ny8zMWVjYzk4Mzgz/ZTJkYjU0ZTZkYTUy/OTRmNDI0MTljYWYy/OGE5N2Y4ODdhNmJl/NDVjNjFmMDk3MzUw/OGQ0YjY4.jpeg'
  },
  {
    name: '5 Hour Energy',
    description: 'And amazing shot of get up and go! Each 2 fl. oz. container has 200mg of caffeine to get you going.',
    size: nil,
    caffeine: 200,
    image_url: 'https://imgs.search.brave.com/a5ChpBQrWo_RhDiCaqKFYwNRq2Yvsj72jpOSUGQUa6s/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NzFQYkFzenJQVEwu/anBn'
  }
]

drinks.each do |drink|
  Drink.create(drink)
end
