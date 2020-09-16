class SchoolJob::Job
    attr_accessor :name, :url, :location, :company, :description, :post_date, :apply_by_date
    
    @@all = []

    def initialize(name, url)
        @name = name
        @url = "https://njschooljobs.com" + url
        @@all << self
    end
    
    def self.all
        @@all
    end

end


