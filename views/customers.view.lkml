view: customers {
  sql_table_name: `looker_store.customers`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: additionals {
    type: string
    sql: ${TABLE}.additionals ;;
  }

  dimension: cell_phone {
    type: string
    sql: ${TABLE}.cell_phone ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    #sql:  ${TABLE}.country ;;
    sql: case when ${TABLE}.country = 'Brasil' then 'BRA' else ${TABLE}.country end;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name;;
    link: {
    label: "Mais sobre a pessoa..."
    url: "https://ipnet.sa.looker.com/dashboards/48"
    }
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
    link: {
      label: "Mais sobre a pessoa..."
      url: "https://ipnet.sa.looker.com/dashboards/48"
    }
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, orders.count]
  }

  dimension: state1 {
    type:  string
    map_layer_name: brazilian_state
    sql: ${TABLE}.state ;;
  }
}
