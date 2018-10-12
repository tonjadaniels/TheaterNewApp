json.array! @roles.each.sort_by{|o| o[:id]} do |role|
  json.id role.id
  json.production_id role.production_id
  json.professional_id role.professional_id
  json.title role.title
  json.show_title role.production.title
  json.professional_name role.professional.name
end
