class SchoolJob::Job
    @@all = []
    attr_accessor :name, # :company, :location, :description, :url
    
    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end
