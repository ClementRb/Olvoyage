
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_06</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_06.html 

TTITLE "- Statistiques -" 





SELECT *
FROM (SELECT COUNT(DISTINCT employee_id) "Nombre d'employés"
	FROM t_employee),
	(SELECT COUNT(customer_id) "Nombre de clients" 
    FROM t_customer),
	(SELECT ROUND(((SELECT COUNT(customer_id)
					FROM t_customer
					WHERE ADD_MONTHS(pass_date,12)>=SYSDATE)/(SELECT COUNT(customer_id)
															FROM t_customer)*100), 2)||' %' "Pourcentage d'abonnés"
    FROM (SELECT COUNT(customer_id)
		FROM t_customer)),
	(SELECT COUNT(DISTINCT train_id ) "Nombre de trains"
	FROM t_train),
	(SELECT COUNT(DISTINCT station_id ) "Nombre de gares"
	FROM t_station),
	(SELECT COUNT(DISTINCT reservation_id) "Nombre de réservations"
	FROM t_reservation),
	(SELECT COUNT(DISTINCT ticket_id ) "Nombre de billets"
	FROM t_ticket)
/

SET markup html off spool off 
spool off