class SchoolJob::Scraper

    def self.scrape_jobs
        site = "https://www.njschooljobs.com/search"
        doc = Nokogiri::HTML(open(site))
        job_results = doc.css('div.title')  
        job_results.each do |result|
                name = result.text.strip
                SchoolJob::Job.new(name)
        end
    end

=begin
    def self.scrape_locations
        doc = Nokogiri::HTML(open("https://www.njschooljobs.com/search"))
        locations = doc.css("div.listColumn.company")
    
        location: result.css('.listColumn.company [3]').text,
                company: result.css('.listColumn.company [1]').text,
                description: result.css('.listColumn.abstract').text,
                #url: result.css('a#lnkRowId')[0].attr("href").value

        locations.each do |l|
            job.location = l("[3]").text.strip
            job.company = l("[1]").text.strip
            SchoolJob::Scraper.new(location, company)
        end
    end

    def self.scrape_descriptions
        doc = Nokogiri::HTML(open("https://www.njschooljobs.com/search"))
        desc = doc.css(".listColumn.abstract")
    
        desc.each do |d|
            job.description = d.text.strip
            SchoolJob::Scraper.new(description)
        end
    end
=end
 #location = job.css("div.listColumn.company [3]").text.strip
            #job.company = job.css(".listColumn.company [1]")
            #job.description = job.css(".listColumn.abstract")
            #job.url = job.css(".a#lnkRowId").attr("href").value
        
end
