
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_11</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_11.html 
  
TTITLE "- Trains pour Paris -" 


SELECT DISTINCT t.train_id "N° train" , dpt.city ||' - '|| arv.city "Nom du train", pass_name "Titre d'abonnement",
CASE 
	WHEN TO_CHAR(TO_DATE(departure_time, 'DD/MM/YYYY'), 'D') BETWEEN 1 AND 5 THEN t.price - t.price*(discount_pct/100)
	WHEN  TO_CHAR(TO_DATE(departure_time, 'DD/MM/YYYY'), 'D') BETWEEN 6 AND 7 THEN t.price - t.price*(discount_we_pct/100)
END "Prix avec réduction"
FROM t_train t
	JOIN t_station dpt ON t.departure_station_id = dpt.station_id
	JOIN t_station arv ON t.arrival_station_id = arv.station_id
	JOIN t_wagon_train w ON t.train_id =w.train_id
	JOIN t_ticket tkt ON w.wag_tr_id = tkt.wag_tr_id
	JOIN t_reservation r ON tkt.reservation_id = r.reservation_id
	JOIN t_customer c ON r.buyer_id = c.customer_id
	JOIN t_pass p ON c.pass_id = p.pass_id
WHERE dpt.city LIKE 'Paris'
ORDER BY t.train_id
/

SET markup html off spool off 
spool off