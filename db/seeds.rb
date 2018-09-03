# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "questionnaires/questionnaire_from_yaml"

#Questionnaires::Questionnaire.destroy_all
#User.destroy_all

q = Questionnaires::Questionnaire.create! title: "Tierwohl von Mastschweinen"
puts "# created questionnaire: #{q.title}"
qfy = Questionnaires::QuestionnaireFromYaml.new questionnaire: q
qfy.add_group_from_yaml file: Rails.root.join("db/questionnaires/sample.yml")
puts "## added group e"
