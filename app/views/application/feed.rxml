# index.rss.builder
xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{ORGANIZATION} at work"
    xml.description "Recent updates from #{ORGANIZATION} employees about what they are up to"
    xml.link "http://#{request.host}/"
    xml.pubDate @articles.first.created_at.to_s(:rfc822) if @articles.any?

    for article in @articles
      xml.item do
        xml.title article.user.first_name + ": " + article.accomplishment
        xml.description article.user.first_name + ": " + article.accomplishment
        xml.pubDate article.created_at.to_s(:rfc822)
		    xml.link "http://#{request.host}/#{article.id}"
		    xml.guid "http://#{request.host}/#{article.id}"
      end
    end
  end
end