json.id carted_ticket.id
json.performance do
 json.partial! carted_ticket.performance,
 partial: "api/performances/performance", as: :performance
end

json.member_id carted_ticket.member_id
json.order_id carted_ticket.order_id
json.performance_id carted_ticket.performance_id
json.title carted_ticket.performance.production.title
json.quantity carted_ticket.quantity
json.total carted_ticket.total
json.status carted_ticket.status