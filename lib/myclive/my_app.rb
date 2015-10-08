require 'clive'

module MyApp
  VERSION = "0.0.1"
  class CLI < Clive
    config name: 'myapp'

    opt :v, :version, 'Display the current verions' do
      puts MyApp::VERSION
      exit 0
    end

    desc 'Create a new project'
    command :new, :create, arg: '<dir>', as: Pathname do
      # Set the default type to use
      set :type, :basic

      desc 'Select type of template to use'
      opt :type, arg: '<choice>', in: %w(basic complex custom), as: Symbol

      bool :force, 'Force overwrite'

      action do
        puts "Creating #{get :type} in #{dir}"
        # do writing
      end
    end
  end
end

result = MyApp::CLI.run
