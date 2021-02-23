# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.anti-kb.site"
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #

  add users_path, :priority => 0.9

  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at
  end

  add reports_path, :priority => 0.8

  Report.find_each do |report|
    add report_path(report), :lastmod => report.updated_at
  end

  add compliments_path, :priority => 0.8

  Compliment.find_each do |compliment|
    add compliment_path(compliment), :lastmod => compliment.updated_at
  end

  add proposes_path, :changefreq => 'monthly'
  add models_path, :changefreq => 'monthly'

  Model.find_each do |model|
    add model_path(model), :lastmod => model.updated_at
  end

  add faqs_path, :changefreq => 'monthly'
  add kbsmind_path, :changefreq => 'monthly'
  add privacy_path, :changefreq => 'monthly'

  Faq.find_each do |faq|
    add faq_path(faq), :lastmod => faq.updated_at
  end

  add intro_index_path, :changefreq => 'monthly'
  add sitemap_index_path, :changefreq => 'monthly'
end
