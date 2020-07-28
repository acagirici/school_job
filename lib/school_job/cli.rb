class SchoolJob::CLI
    
    def call
        puts "\nWelcome to NJ Job\n"
        get_jobs
        list_jobs
        get_user_job
        #menu
        #goodbye
    end
    
    def get_jobs
        @jobs = SchoolJob::Job.all
    end

    def list_jobs
        puts "\nChoose a Job to see details!\n"
        @jobs.each.with_index(1) do |job, i| 
            puts "#{i}. #{job.name}"
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
        puts "This is the description for #{job}"
            #SchoolJob::Job.all.each.with_index(1) do | job |
            #puts job.name
        #end
        #get_user_job
    end
 #   def job_list
  #      puts "Recently Posted School Job Listings:"
   #     @jobs = SchoolJob::Scraper.scrape_jobs
    #    @jobs.each.with_index(1) do |job, i| 
     #       puts "#{i}. #{job.name} - #{job.location}"
      #  end
       
   # end
   
end