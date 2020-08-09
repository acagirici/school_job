class SchoolJob::Job
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        SchoolJob::Scraper.scrape_jobs if @@all.empty?
        @@all
    end

end


