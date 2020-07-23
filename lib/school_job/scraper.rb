class SchoolJob::Scraper
    attr_accessor :title, :location, :description, :url

    def self.scrape_jobs
        jobs = []
        jobs << self.scrape_jobs

        jobs
    end

    def self.scrape_njschooljobs
        doc = Nokogiri::HTML(open("https://www.njschooljobs.com/search"))
        results = doc.css('div.listRow')
        #puts results.count

        results.each do |p|
         puts p.css('div.title').text.strip
        end
    end

end
