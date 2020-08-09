Program Flow
    User - Starts the application
    Presented school jobs available in New Jersey
    Chooses 1 and is given description of job
    Asked what user wants (apply or go back)
        Apply led to application page
        Go back is taken back to list
        Exit to leave application

Classes
    Jobs Class - to know and store the jobs
    CLI Class - Interact with my code
    Scrape Class
        
        =begin

    def self.scrape_location
        doc = Nokogiri::HTML(open("https://www.njschooljobs.com/search"))
        location = doc.css("div.listColumn.company [3]")
        
        location.each do |l|
            location = l.text.strip
            SchoolJob::Job.new(location)
        end

    end



    company = j.css("div.listColumn.company [1]").text.strip
    location = j.css("div.listColumn company [3]").text.strip
    description = j.css("div.listColumn.abstract").text.strip
    #url = j.search("a#lnkRowId").attr("href")

 =end

 def 
        loc.each do |l|
            location = l.text.strip
            SchoolJob::Scraper.new(location)
        end

        desc.each do |d|
            description = d.text.strip
            SchoolJob::Scraper.new(description)
        end
    end
    