SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_10</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_10.html 
  
TTITLE "- Réservations "Séniors" de janvier 2017 -" 


SELECT COUNT(DISTINCT c.last_name||c.first_name) "Nombre de clients « Sénior »"
FROM t_customer c
	JOIN t_pass p ON c.pass_id = p.pass_id
	JOIN t_ticket tkt ON c.customer_id = tkt.customer_id
	JOIN t_reservation r ON tkt.reservation_id = r.reservation_id
	JOIN t_wagon_train wt ON tkt.wag_tr_id = wt.wag_tr_id
	JOIN t_train t ON wt.train_id = t.train_id
WHERE t.departure_time LIKE '%/01/17'
AND c.pass_id = 2
AND r.price IS NOT NULL
/

SET markup html off spool off 
spool off