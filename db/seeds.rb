# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Relation.create(relation_name: "Father")
Relation.create(relation_name: "Mother")
Relation.create(relation_name: "Husband")
Relation.create(relation_name: "Wife")
Relation.create(relation_name: "Brother")
Relation.create(relation_name: "Sister")
Relation.create(relation_name: "Son")
Relation.create(relation_name: "Daughter")
Relation.create(relation_name: "Other")