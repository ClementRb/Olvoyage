SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_13</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_13.html 
  
TTITLE "- Billets de moins de 25 ans -" 





SELECT tkt.ticket_id "Numéro du billet", UPPER(c.last_name)||' '||c.first_name "Clients", 
dpt.city ||' ('|| departure_time ||' '||TO_CHAR(departure_time, 'HH24:MI')||') - '|| arv.city ||' ('|| arrival_time||' '||TO_CHAR(arrival_time, 'HH24:MI')||') ' "Trajet",
 w.class_type "Classe", r.creation_date, t.departure_time
FROM t_ticket tkt
	JOIN t_customer c ON tkt.customer_id = c.customer_id
	JOIN t_wagon_train wt ON tkt.wag_tr_id = wt.wag_tr_id
	JOIN t_wagon w ON wt.wagon_id = w.wagon_id
	JOIN t_train t ON  wt.train_id = t.train_id
	JOIN t_station dpt ON t.departure_station_id = dpt.station_id
	JOIN t_station arv ON t.arrival_station_id = arv.station_id
	JOIN t_reservation r ON tkt.reservation_id = r.reservation_id
WHERE w.class_type = 1 
	AND TRUNC((SYSDATE - birth_date)/365, 0) < 25
	AND t.departure_time BETWEEN '15/01/17' AND '26/01/17'
	AND r.creation_date BETWEEN t.departure_time - 20 AND t.departure_time
ORDER BY r.creation_date
/



SET markup html off spool off 
spool off