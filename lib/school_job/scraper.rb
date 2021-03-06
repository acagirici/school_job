class SchoolJob::Scraper

    def self.scrape_jobs_and_url
        site = "https://www.njschooljobs.com/search"
        doc = Nokogiri::HTML(open(site))
        jobs_and_urls = doc.css("div.title a")
        location_company = doc.css('div.listColumn.company')
        description = doc.css('div.listColumn.abstract')

        jobs_and_urls.map do |link|
            SchoolJob::Job.new(link.text, link.attributes["href"].value)
        end
        
    end

    def self.scrape_job_details(job)
        site = Nokogiri::HTML(open(job.url))
        details = site.css('div.formContainer')

        job.location = details.css("h2 span")[2].text.strip
        job.company = details.css("h2 span")[1].text.strip
        job.description = details.css("span.formDataLabel")[3].text
        job.post_date = details.css("span.formDataLabel")[1].text
        job.apply_by_date = details.css("span.formDataLabel")[2].text

    end

end
