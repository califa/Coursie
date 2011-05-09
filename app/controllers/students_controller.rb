class StudentsController < ApplicationController

  require 'table_builder'
  require 'table_builder/calendar_helper'
  layout 'dashboard'

  def index
    @student = Student.find(39)
  end

end
