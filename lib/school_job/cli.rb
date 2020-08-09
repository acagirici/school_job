class SchoolJob::CLI
    @@muted="\e[1;31m"
    @@grn="\e[1;32m"
    @@blu="\e[1;34m"
    @@mag="\e[1;35m"
    @@cyn="\e[1;36m"
    @@white="\e[0m"

    def call
        puts "#{@@grn}\nWelcome to NJ Job\n#{@@white}"
        get_jobs
        list_jobs
        get_user_job
        #menu
        #goodbye
    end
    
   def get_jobs
        @jobs = SchoolJob::Scraper.scrape_jobs_and_url
    end

    def list_jobs
        puts "\nChoose a Job to see details!\n"
        @jobs.each.with_index(1) do |job, i|
            puts "#{i}. #{job.url}"
        end
    end

    def get_user_job
        chosen_job = gets.strip.to_i
        show_description(chosen_job) if valid_input(chosen_job, @jobs)
            
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_description(chosen_job)
        job = @jobs[chosen_job - 1]
        puts "This is the description for #{job.name}"
            #SchoolJob::Job.all.each.with_index(1) do | job |
            #puts job.name
        #end
        #get_user_job
    end
end