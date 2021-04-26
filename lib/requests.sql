
/*The number of unique requests (ContactId) grouped by Month (Creation Date)*/
amount_of_contact_request_per_month = 
    select month(creation_date),count(contact_id)
    from fact_contact
    group by month(creation_date)
    order by month(creation_date);


/*The number of unique requests (QuoteId) grouped by Month (Creation Date)*/
amount_of_bid_request_per_month =
    select month(creation_date),count(quote_id)
    from fact_quotes
    group by month(creation_date)
    order by month(creation_date);


/*The number of elevators (ElevatorId) contained in the buildings belonging to each customer*/
amount_of_elevator_per_customer =
    select count(serial_number), building_id, full_name_company_name_contact
    from fact_elevators
    group by building_id; 