xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @application_name
    xml.author 'Sleeping-Lion'
    xml.description @meta_description
    xml.link 'http://www.antikb.site'
    xml.language I18n.locale.to_s

    for article in @reports
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ''
        end
        xml.author 'SleepingLion'
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link 'http://www.antikb.site/reports/' + article.id.to_s
        xml.guid article.id

        text = article.report_content.content
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.

        xml.description "<p>" + text + "</p>"

      end
    end

    for article in @compliments
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ''
        end
        xml.author 'SleepingLion'
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link 'http://www.antikb.site/compliments/' + article.id.to_s
        xml.guid article.id

        text = article.compliment_content.content
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.

        xml.description "<p>" + text + "</p>"

      end
    end

  end
end
