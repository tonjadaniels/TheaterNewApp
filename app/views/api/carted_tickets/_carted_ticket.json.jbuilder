json.id carted_ticket.id
json.performance do
 json.partial! carted_ticket.performance,
 partial: "api/performances/performance", as: :performance
end

json.member_id carted_ticket.member_id
json.order_id carted_ticket.order_id
json.performance_id carted_ticket.performance_id
json.quantity carted_ticket.quantity
json.status carted_ticket.status