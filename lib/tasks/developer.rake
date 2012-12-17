desc "Setup the environment for development"
task :dev do
  # TODO: convenience stuff, like giving developer's user admin privileges
  # Rake::Task['dev:add_user_to_role'].invoke(user_email, :admin)
end
  
namespace :dev do  
  desc "Add user to role"
  task :add_user_to_role, [:email, :role] => [:environment] do |t,args|
    user = User.where(:email => args[:email]).first
    user.add_role args[:role]
  end
  
  desc "Remove user from role"
  task :remove_user_from_role, [:email, :role] => [:environment] do |t,args|
    user = User.where(:email => args[:email]).first
    user.remove_role args[:role]
  end
end
