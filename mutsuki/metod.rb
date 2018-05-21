#require 'gviz'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'uri'
require 'cgi'
require 'fileutils'




def gazou(food)

q = CGI.escape(food)

#uri = URI.escape("https://www.bing.com/images/search?q=#{q}")
#uri = URI.escape("https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=#{q}&count=1")
url = "https://www.bing.com/images/search?q=#{q}"
res = open(url)
doc = Nokogiri.HTML(res)



image_urls = Array.new
doc.css('div#b_content a.thumb').each do |a|
  image_urls.push(a[:href])
end
p image_urls



File.open("./image.jpg", 'wb') do |f|
  f.write(open(image_urls.first).read)
end

name = food + ".jpg"

File.rename("./image.jpg", name)

end 


food = ""
gazou(food)