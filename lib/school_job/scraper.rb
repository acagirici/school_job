class SchoolJob::Scraper

    def self.scrape_jobs_and_url
        site = "https://www.njschooljobs.com/search"
        doc = Nokogiri::HTML(open(site))
        jobs_and_urls = doc.css("div.title a")

        jobs_and_urls.map do |link|
            SchoolJob::Job.new(link.text, link.attributes["href"].value)
        end
    end

=begin
    def self.scrape_job_details
        site = "https://www.njschooljobs.com/search"
        doc = Nokogiri::HTML(open(site))
        job_results = doc.css('div')

        job_results.each do |result|

            job = SchoolJob::Job.new
            
            name = result.css('.title a')
            location_company = result.css('.listColumn.company').text.strip
            description = result.css('.listColumn.abstract')
            #url = result.css('a#lnkRowId')[0].attr("href")

            job.name = name.text.strip
            job.location = location_company[3]
            job.company = location_company[1]
            job.description = description.text.strip
            #job.url = url.value

            job.add_job(job)
        end
    end
=end

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
