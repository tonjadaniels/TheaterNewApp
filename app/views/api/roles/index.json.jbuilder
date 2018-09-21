json.array! @roles.each do |role|
  json.id role.id
  json.production_id role.production_id
  json.professional_id role.professional_id
  json.title role.title
end
