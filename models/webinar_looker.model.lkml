connection: "webinar_looker"

# include all the views
include: "/views/**/*.view"

datagroup: webinar_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: webinar_looker_default_datagroup

explore: categories {}

explore: customers {}

explore: items {
  join: products {
    type: left_outer
    sql_on: ${items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: categories {
    type:  left_outer
    sql_on:  ${products.category_id} =${categories.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: products {}
