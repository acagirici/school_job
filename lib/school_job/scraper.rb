class SchoolJob::Scraper

    def self.job_scrape
        doc = Nokogiri::HTML(open("https://www.njschooljobs.com/search"))
        results = doc.css("div.listContainer")
        
        job = self.new
        job.name = results.css("div.title").text
        job.company = results.css("listColumn.company [1]").text.strip
        job.location = results.css("listColumn.company [3]").text.strip
        job.description = results.css("listColumn.abstract").text.strip
        job.url = "https://njschooljobs.com" + results.css("a")[0].attribute("href").value
            
        job
    
    end

end
