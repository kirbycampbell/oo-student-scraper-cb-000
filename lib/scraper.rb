require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    webpage = Nokogiri::HTML(html)
    persons = []

    webpage.css(".student-card").each do |person|
      name = person.css("h4").text
      location = person.css("p").text
      profile_url = person.css("a").attribute("href").value

        persons.push(
        name: name,
        location: location,
        profile_url: profile_url
      )
    end
    persons
  end

  def self.scrape_profile_page(profile_url)
      info = {}
      html = open(profile_url)
      profile = Nokogiri::HTML(html)

      profile.css(".social-icon-container a").each do |link|
        if link.attribute("href").value.include?("twitter")
          info[:twitter] = social.attribute("href").value
        elsif link.attribute("href").value.include?("linkedin")
          info[:linkedin] = social.attribute("href").value
        elsif link.attribute("href").value.include?("github")
          info[:github] = social.attribute("href").value
        else
          info[:blog] = social.attribute("href").value
        end
      end
      info[:profile_quote] = profile.css(".profile-quote").text
      info[:bio] = profile.css("p").text

      info
  end


end
