# heofon_mini.rb - Simple Ruby Search Engine

# Our "database" - you can add more pages later
pages = {
  "welcome" => {
    title: "Welcome to Heofon",
    content: "Heofon is a private search engine founded by Liam in 2026. Privacy first.",
    url: "https://heofonsearch.zite.so"
  },
  "about" => {
    title: "About Liam",
    content: "Norwegian-American developer, coin collector, and pickleball player.",
    url: "https://github.com/LiamProsser77"
  },
  "ruby" => {
    title: "Learning Ruby",
    content: "Ruby is beautiful and fun to learn. Great for building tools and web apps.",
    url: "https://ruby-lang.org"
  }
}

puts "🔍 Heofon Mini Search Engine"
puts "=" * 40

# Get search query from user
print "Search global hub...? "
query = gets.chomp.downcase.strip

# Search logic
results = []

pages.each do |slug, page|
  if page[:title].downcase.include?(query) || page[:content].downcase.include?(query)
    results << page
  end
end

# Show results
if results.empty?
  puts "😕 No results found for '#{query}'"
else
  puts "\n✅ Found #{results.size} result(s):\n\n"
  results.each_with_index do |result, index|
    puts "#{index + 1}. #{result[:title]}"
    puts "   #{result[:content][0..100]}..." if result[:content].length > 100
    puts "   🔗 #{result[:url]}"
    puts
  end
end
