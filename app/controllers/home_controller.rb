class HomeController < ApplicationController
  def index
    # calculate min and max hours for each day
    #@hour_min = (Course.where('time_start > 400').minimum('time_start') / 100).floor
    #@hour_max = (Course.maximum('time_end') / 100).ceil + 1
    @hour_min = 7
    @hour_max = 8 + 12
    @hours = (@hour_min..@hour_max).to_a
    @days = {
        :M => 'Monday',
        :T => 'Tuesday',
        :W => 'Wednesday',
        :R => 'Thursday',
        :F => 'Friday',
        :S => 'Saturday',
        :U => 'Sunday',
    }

    # javascript course list (array of course.name)
    @js_courses = []
    Section.select('DISTINCT(name), fullname').each do |course|
      @js_courses.push(course.name + ' - ' + course.fullname)
    end
    @js_courses.sort! {|a,b| /[0-9]+/.match(a).to_s.to_i <=> /[0-9]+/.match(b).to_s.to_i}

    # last updated
    @lastupdated = ((Time.now - Section.first.updated_at) / 60).ceil
    #@lastupdated = @lastupdated.to_s + ' ' + 'minute'.pluralize(@lastupdated)
  end
end
