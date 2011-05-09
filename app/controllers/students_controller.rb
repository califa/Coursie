class StudentsController < ApplicationController

  require 'table_builder'
  require 'table_builder/calendar_helper'
  layout 'dashboard'

  def index
    @student = Student.find(session[:user_id])
    @date = Time.now
    get_tasks
  end

  def get_tasks
    @tasks = []
    @student.courses.each do |course|
      course.assignments.each do |assignment|
        @tasks << Event.new(course.name, assignment.title, assignment.due_date)
      end
    end
  end

#  <% tasks.each do |hw| %>
#      <% hw.each do |h,w| %>
#        <%= w %> ++++
#      <%end %>     <br/>
#  <%end %>
#
#
#   <% homework.each do |hw| %>
#      <%= hw['title'] %><br />
#  endclass Event < Struct.new(:id, :name, :date); end
end


class Event < Struct.new(:class, :name, :date); end