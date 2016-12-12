SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_01</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_01.html 
  
TTITLE "- Meilleur employée -" 


SELECT UPPER(last_name)|| ' ' || first_name "Employé", COUNT(reservation_id) "Nombre de réservation"
FROM t_employee e JOIN t_reservation r
ON e.employee_id = r.employee_id
GROUP BY UPPER(last_name)|| ' ' || first_name
HAVING COUNT(reservation_id) >= ALL
	(SELECT COUNT(reservation_id)
	FROM t_employee e JOIN t_reservation r
	ON e.employee_id = r.employee_id
	GROUP BY e.employee_id)
/

SET markup html off spool off 
spool off