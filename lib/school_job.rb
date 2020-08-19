require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "./school_job/version"
require_relative "./school_job/cli"
require_relative "./school_job/scraper"
require_relative "./school_job/job"
require_relative "./school_job/detail"

module SchoolJob
  class Error < StandardError; end
  # Your code goes here...
end
