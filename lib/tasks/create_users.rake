#Save the following code in {rails-project}/lib/tasks/*.rake
#Change the filename to the location of your file. It is attached here.
#Run "/{rails-project}-$ rake db:populate" from console after making the above changes.

  namespace :db do
    desc "Fill the database with something"
    task populate: :environment do
      File.open("/home/rituraj/Desktop/few_emails") do |file|
        a = 0
        while line = file.gets
          line =line.chomp
          a += 1
          user_password = get_password
          puts "email : #{line} : password: #{user_password}"
          @user = User.new(email: line, password: user_password, password_confirmation: user_password)
          @user.add_role "normaluser"
          @user.save
          UserMailer.registration_confirmation(@user).deliver
          end
             puts "Created #{a} users with random passwords.\nSee above for the more info."
          end
    end
  end

  def get_password
    o = [('a'..'z'),('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
    return (0..8).map{ o[rand(o.length)]}.join
  end 