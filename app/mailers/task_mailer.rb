class TaskMailer < ActionMailer::Base
  default from: "admin@kreatio.com"

  def newtask(task)
  @task = task
  @url =  "http://192.168.18.23:3000/clients/#{@task.client_id}/projects/#{@task.project_id}/tasks/#{@task.id}"
  mail(to: @task.task_assigned_to, subject: 'New task created')
  end
end
