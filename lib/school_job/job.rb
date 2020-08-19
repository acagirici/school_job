class SchoolJob::Job
    attr_accessor :name, :url
    attr_reader :details

    @@all = []

    def initialize(name, url)
        @name = name
        @url = "https://njschooljobs.com" + url
        @details = []
        @@all << self
    end
    
    def self.all
        @@all
    end

    def add_detail(detail)
        self.details << detail
        detail.job = self
    end

end


