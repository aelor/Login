class PagesController < ApplicationController
  def home
  end
  
  def determinetask
    @task = $task
  end
end
