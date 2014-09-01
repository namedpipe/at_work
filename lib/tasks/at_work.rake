namespace :at_work do
	desc "Setup database by clearing out existing database and adding admin user"
	task :setup => :environment do
		# Make sure migrations have run
		Rake::Task["db:migrate:reset"].invoke

		# Create initial user
		password = Digest::SHA1.hexdigest("--#{Time.now.to_s}--")[0..6]
    user = User.new({ :first_name => "Admin", :email => 'admin@company.com', :password => password, :password_confirmation => password})
    if user.save
    	puts "  Username: #{user.email}"
    	puts "  Password: #{password}\n\n"
			puts "Start up the server by typing bundle exec rails s and then visit http://localhost:3000"
		end
	end
	
	desc "Add a new user to the database. Supply variables of FIRST_NAME, EMAIL, and PASSWORD on command line."
	task :add_user => :environment do
    first_name, email, password = ENV["FIRST_NAME"], ENV["EMAIL"], ENV["PASSWORD"]
		
		if email && password && first_name
	    user = User.new({ :first_name => first_name, :email => email, :password => password, :password_confirmation => password})
	    user.save
			puts "New user #{email} created"
		else
			puts "Please supply environment variables of EMAIL, PASSWORD and FIRST_NAME to setup a new user"
		end
	end
end