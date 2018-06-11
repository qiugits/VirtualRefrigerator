#require 'gviz'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'uri'
require 'cgi'
require 'csv'
require 'fileutils'

$directory = Rails.root + 'app/assets/images/food_kinds'
already_done = Dir.entries($directory)

FoodKind.find_each do |kind|
  if already_done.include?('%04d.jpg' % kind.id)
    print '.'
    next
  end

  q = CGI.escape(kind.kindname)

  url = URI("https://search.yahoo.co.jp/image/search?n=60&p=#{q}&search.x=1")
  res = open(url)
  doc = Nokogiri.HTML(res)

  image_urls = Array.new
  doc.css('a[target="imagewin"]').each do |a|
    image_urls.push(a[:href])
  end

  image_urls.each do |img|
    if img[-3..-1].downcase == 'jpg'
      begin
        File.open($directory + "%04d.jpg" % kind.id, 'wb') do |f|
          f.write(open(URI.escape(img, "[]")).read)
        end
        print("Saved %s to %04d.jpg" % [kind.kindname, kind.id])
        break
      rescue => e
        print("Failured for some reason")
        p e
        next
      end
    end
  end

  sleep(1)
end 
