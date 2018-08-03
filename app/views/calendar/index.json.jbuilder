json.array! @activities do |activity|
    json.id activity.id
    json.title activity.description
    json.start activity.schedule_start_at
    json.end activity.schedule_start_at
  end