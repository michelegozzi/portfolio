class IconImagemagick
  ICONS = [["pinterest","iconim-pinterest"],["dropbox","iconim-dropbox"],["plus","iconim-plus"],["jolicloud","iconim-jolicloud"],["yahoo","iconim-yahoo"],["blogger","iconim-blogger"],["picasa","iconim-picasa"],["amazon","iconim-amazon"],["tumblr","iconim-tumblr"],["wordpress","iconim-wordpress"],["instapaper","iconim-instapaper"],["evernote","iconim-evernote"],["xing","iconim-xing"],["zootool","iconim-zootool"],["dribbble","iconim-dribbble"],["deviantart","iconim-deviantart"],["later","iconim-later"],["in","iconim-in"],["forrst","iconim-forrst"],["pinboard","iconim-pinboard"],["behance","iconim-behance"],["github","iconim-github"],["youtube","iconim-youtube"],["skitch","iconim-skitch"],["4square","iconim-4square"],["quora","iconim-quora"],["badoo","iconim-badoo"],["spotify","iconim-spotify"],["stumbleupon","iconim-stumbleupon"],["readability","iconim-readability"],["facebook","iconim-facebook"],["twitter","iconim-twitter"],["instagram","iconim-instagram"],["spaces","iconim-spaces"],["vimeo","iconim-vimeo"],["flickr","iconim-flickr"],["fm","iconim-fm"],["rss","iconim-rss"],["skype","iconim-skype"],["e-mail","iconim-e-mail"],["vine","iconim-vine"],["myspace","iconim-myspace"],["goodreads","iconim-goodreads"],["apple","iconim-apple"],["windows","iconim-windows"],["yelp","iconim-yelp"],["playstation","iconim-playstation"],["xbox","iconim-xbox"],["android","iconim-android"],["ios","iconim-ios"]]

  PAGE_SIZE = 6

  def self.pages
    ICONS.count / PAGE_SIZE + ((ICONS.count % PAGE_SIZE) > 0 ? 1 : 0)
  end

  def self.elements_per_page(page)
    ICONS.slice(((page-1) * PAGE_SIZE), PAGE_SIZE)
  end
end