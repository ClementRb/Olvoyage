SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_03</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_03.html 

TTITLE "- Première réservation effectuée -" 


SELECT r.reservation_id "N° réservation", r.creation_date "Date",  UPPER(e.last_name)|| ' ' || e.first_name "Employé", UPPER(c.last_name)|| ' ' || c.first_name "Acheteur"
FROM (SELECT *
      FROM t_reservation
      ORDER BY creation_date) r 
		JOIN t_employee e ON r.employee_id = e.employee_id
		JOIN t_customer c ON c.customer_id = r.buyer_id
WHERE ROWNUM = 1
/

SET markup html off spool off 
spool off