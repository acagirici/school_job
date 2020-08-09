class SchoolJob::Job
    attr_accessor :name, :url
    
    @@all = []

    def initialize(name, url)
        @name = name
        @url = "https://njschooljobs.com" + url
        @@all << self
    end
    
    def self.all
        #SchoolJob::Scraper.scrape_jobs if @@all.empty?
        @@all
    end

    def add_job(job)
        self.jobs << job
    end

end


