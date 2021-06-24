# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'yaml'

@seed_data = YAML.load_file(File.join(__dir__, 'seed_data.yml'))

@seed_data['labels'].each do |name|
	l = Label.create(name: name)
	# puts l
end

@seed_data['topics'].each do |topic|
	t = Topic.new(status:'unseen')

	topic.each do |message|
		t.messages.build(
			sender: message["sender"],
			subject: message["subject"],
			body: message["body"],
			time_received: DateTime.parse(message["time_received"]),
		)
	end

	t.save
end