view: orders {
  sql_table_name: `looker_store.orders`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;

  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: price {
    type:  number
    sql:  products.price ;;
  }
  measure: count {
    type: count
    drill_fields: [id, customers.last_name, customers.id, customers.first_name, items.count]
  }
}
