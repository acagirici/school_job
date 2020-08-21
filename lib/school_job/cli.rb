class SchoolJob::CLI
    @@muted="\e[1;31m"
    @@grn="\e[1;32m"
    @@blu="\e[1;34m"
    @@mag="\e[1;35m"
    @@cyn="\e[1;36m"
    @@white="\e[0m"

    def call
        puts "#{@@grn}\nWelcome to NJ Job - Your Daily Job Listings for School Jobs in New Jersey\n#{@@white}"
        menu
    end
    
    def menu
        puts "Below is a list of the most recent job listings"
        get_jobs
        list_jobs
        puts "#{@@cyn}\nChoose the number of the job to get more information\n#{@@white}"
        get_user_job
    end

   def get_jobs
        jobs = SchoolJob::Scraper.scrape_jobs_and_url
    end

    def list_jobs
        SchoolJob::Job.all.each.with_index(1) do |job, i|
            puts "#{i}. #{job.name}"
        end
    end

    def get_user_job
        chosen_job = gets.strip.to_i
        max = SchoolJob::Job.all.length
        if chosen_job.between?(1,max)
            job = SchoolJob::Job.all[chosen_job-1]
            show_details(job)
        else 
            puts "Please put in a valid input"
            get_user_job
        end
    end

    def scrape_details
        details = SchoolJob::Scraper.scrape_job_details(job)
    end

    def show_details(job)
        SchoolJob::Scraper.scrape_job_details(job)
        puts "Here are the details for #{job.name}"
        job.details.each do |detail|
            puts "#{@@muted} + Job Location: #{detail.location} | Employer: #{detail.company}#{@@white}"
            puts "#{@@blu} + Job Post Date: #{detail.post_date} | Deadline to Apply: #{detail.apply_by_date} #{@@white}"

            puts "#{@@grn}\n To read the description? Type 'Y'"
            puts "\n To return to the main menu, Type 'B'"
            puts "\n If you would like to exit, Type 'E' #{@@white}"
            input = gets.strip.upcase
                if input == "Y"
                    puts "\n DETAILS \n #{detail.description}"
                    puts "TO APPLY GO TO #{job.url}"
                    second_menu
                elsif input == "B"
                    menu
                elsif input == "E"
                    puts "Thank you for using School Job. Goodbye!"
                else
                    puts "Sorry, I could not understand that command"
                    second_menu
                end
        end
    end

    def second_menu
            puts "#{@@mag}\nWhat would you lke to do next? Type 'M' for Menu or 'E' to Exit#{@@white}"
                input = gets.strip.upcase
                if input == "M"
                    menu
                elsif input == "E"
                    puts "Thank you for using School Job. Goodbye!"
                else
                    puts "Sorry, I could not understand that command. Redirecting to Menu!"
                end
    end

end