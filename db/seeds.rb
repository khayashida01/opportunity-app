# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#AdminUser.find_or_create_by!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Relation
Relation.find_or_create_by(id: 1, relation_name: "Father")
Relation.find_or_create_by(id: 2, relation_name: "Mother")
Relation.find_or_create_by(id: 3, relation_name: "Husband")
Relation.find_or_create_by(id: 4, relation_name: "Wife")
Relation.find_or_create_by(id: 5, relation_name: "Brother")
Relation.find_or_create_by(id: 6, relation_name: "Sister")
Relation.find_or_create_by(id: 7, relation_name: "Son")
Relation.find_or_create_by(id: 8, relation_name: "Daughter")
Relation.find_or_create_by(id: 9, relation_name: "Other")

# State
State.find_or_create_by(id: 1, state_name: "Alabama")
State.find_or_create_by(id: 2, state_name: "Alaska")
State.find_or_create_by(id: 3, state_name: "Arizona")
State.find_or_create_by(id: 4, state_name: "Arkansas")
State.find_or_create_by(id: 5, state_name: "California")
State.find_or_create_by(id: 6, state_name: "Colorado")
State.find_or_create_by(id: 7, state_name: "Connecticut")
State.find_or_create_by(id: 8, state_name: "Delaware")
State.find_or_create_by(id: 9, state_name: "Florida")
State.find_or_create_by(id: 10, state_name: "Georgia")
State.find_or_create_by(id: 11, state_name: "Hawaii")
State.find_or_create_by(id: 12, state_name: "Idaho")
State.find_or_create_by(id: 13, state_name: "Illinois")
State.find_or_create_by(id: 14, state_name: "Indiana")
State.find_or_create_by(id: 15, state_name: "Iowa")
State.find_or_create_by(id: 16, state_name: "Kansas")
State.find_or_create_by(id: 17, state_name: "Kentucky")
State.find_or_create_by(id: 18, state_name: "Louisiana")
State.find_or_create_by(id: 19, state_name: "Maine")
State.find_or_create_by(id: 20, state_name: "Maryland")
State.find_or_create_by(id: 21, state_name: "Massachusetts")
State.find_or_create_by(id: 22, state_name: "Michigan")
State.find_or_create_by(id: 23, state_name: "Minnesota")
State.find_or_create_by(id: 24, state_name: "Mississippi")
State.find_or_create_by(id: 25, state_name: "Missouri")
State.find_or_create_by(id: 26, state_name: "Montana")
State.find_or_create_by(id: 27, state_name: "Nebraska")
State.find_or_create_by(id: 28, state_name: "Nevada")
State.find_or_create_by(id: 29, state_name: "New Hampshire")
State.find_or_create_by(id: 30, state_name: "New Jersey")
State.find_or_create_by(id: 31, state_name: "New Mexico")
State.find_or_create_by(id: 32, state_name: "New York")
State.find_or_create_by(id: 33, state_name: "North Carolina")
State.find_or_create_by(id: 34, state_name: "North Dakota")
State.find_or_create_by(id: 35, state_name: "Ohio")
State.find_or_create_by(id: 36, state_name: "Oklahoma")
State.find_or_create_by(id: 37, state_name: "Oregon")
State.find_or_create_by(id: 38, state_name: "Pennsylvania")
State.find_or_create_by(id: 39, state_name: "Rhode Island")
State.find_or_create_by(id: 40, state_name: "South Carolina")
State.find_or_create_by(id: 41, state_name: "South Dakota")
State.find_or_create_by(id: 42, state_name: "Tennessee")
State.find_or_create_by(id: 43, state_name: "Texas")
State.find_or_create_by(id: 44, state_name: "Utah")
State.find_or_create_by(id: 45, state_name: "Vermont")
State.find_or_create_by(id: 46, state_name: "Virginia")
State.find_or_create_by(id: 47, state_name: "Washington")
State.find_or_create_by(id: 48, state_name: "West Virginia")
State.find_or_create_by(id: 49, state_name: "Wisconsin")
State.find_or_create_by(id: 50, state_name: "Wyoming")

# Country
Country.find_or_create_by(id: 1, country_name: "United States")

# LeadSource
LeadSource.find_or_create_by(id: 1, lead_source_name: "Cold Calling")
LeadSource.find_or_create_by(id: 2, lead_source_name: "Custom Referral")
LeadSource.find_or_create_by(id: 3, lead_source_name: "Word of Mouth (Non Customers)")
LeadSource.find_or_create_by(id: 4, lead_source_name: "Expo/Seminar (Events)")
LeadSource.find_or_create_by(id: 5, lead_source_name: "Direct Mail")
LeadSource.find_or_create_by(id: 6, lead_source_name: "Social Media (Facebook, LinkedIn, Twitter, etc)")
LeadSource.find_or_create_by(id: 7, lead_source_name: "Other")

# OpportunityStage
OpportunityStage.find_or_create_by(id: 1, opportunity_stage_name: "Stage 1: Approaching")
OpportunityStage.find_or_create_by(id: 2, opportunity_stage_name: "Stage 2: Lead")
OpportunityStage.find_or_create_by(id: 3, opportunity_stage_name: "Stage 3: Opportunity")
OpportunityStage.find_or_create_by(id: 4, opportunity_stage_name: "Stage 4: Negotiation/Review")
OpportunityStage.find_or_create_by(id: 5, opportunity_stage_name: "Stage 5: Engaged")
OpportunityStage.find_or_create_by(id: 6, opportunity_stage_name: "Stage 6: Order/Payment")
OpportunityStage.find_or_create_by(id: 7, opportunity_stage_name: "Stage 7: Production/Project")
OpportunityStage.find_or_create_by(id: 8, opportunity_stage_name: "Stage 8: Quality Inspection")
OpportunityStage.find_or_create_by(id: 9, opportunity_stage_name: "Stage 9: Closed")
OpportunityStage.find_or_create_by(id: 10, opportunity_stage_name: "Stage 10: Post Sale")
OpportunityStage.find_or_create_by(id: 11, opportunity_stage_name: "Failure to Engage")

# Grade
Grade.find_or_create_by(id: 1, grade_name: "A - RECEIVED ORDER")
Grade.find_or_create_by(id: 2, grade_name: "B - SUBMITTED PROPOSAL / EVALUATION")
Grade.find_or_create_by(id: 3, grade_name: "C - REQUIREMENT HEARING")
Grade.find_or_create_by(id: 4, grade_name: "D - SALES HEARING")
Grade.find_or_create_by(id: 5, grade_name: "E - OPEN ACTIVITY")
Grade.find_or_create_by(id: 6, grade_name: "N-1 - PRE-APPROACHING")
Grade.find_or_create_by(id: 7, grade_name: "N-2 - NO OPPORTUNITY")
Grade.find_or_create_by(id: 8, grade_name: "F - FAIL TO RECEIVE ORDER")

# Priority
Priority.find_or_create_by(id: 1, priority_name: "Low")
Priority.find_or_create_by(id: 2, priority_name: "Normal")
Priority.find_or_create_by(id: 3, priority_name: "High")

# LogType
LogType.find_or_create_by(id: 1, log_type_name: "Event/Info")
LogType.find_or_create_by(id: 2, log_type_name: "Meeting")
LogType.find_or_create_by(id: 3, log_type_name: "Internal Meeting")
LogType.find_or_create_by(id: 4, log_type_name: "Task")
LogType.find_or_create_by(id: 5, log_type_name: "Other")

# CommunicationType
CommunicationType.find_or_create_by(id: 1, communication_type_name: "Email")
CommunicationType.find_or_create_by(id: 2, communication_type_name: "Phone")
CommunicationType.find_or_create_by(id: 3, communication_type_name: "Face to Face")
CommunicationType.find_or_create_by(id: 4, communication_type_name: "Skype, Web & Teleconference")
CommunicationType.find_or_create_by(id: 5, communication_type_name: "Other")

# ActivityFeeling
ActivityFeeling.find_or_create_by(id: 1, activity_feeling_name: "Hot")
ActivityFeeling.find_or_create_by(id: 2, activity_feeling_name: "Warm")
ActivityFeeling.find_or_create_by(id: 3, activity_feeling_name: "Cold")

# TodoStatus
TodoStatus.find_or_create_by(id: 1, todo_status_name: "Open")
TodoStatus.find_or_create_by(id: 2, todo_status_name: "Closed")
TodoStatus.find_or_create_by(id: 3, todo_status_name: "Canceled")

# TodoPriority
TodoPriority.find_or_create_by(id: 1, todo_priority_name: "Low")
TodoPriority.find_or_create_by(id: 2, todo_priority_name: "Normal")
TodoPriority.find_or_create_by(id: 3, todo_priority_name: "High")



