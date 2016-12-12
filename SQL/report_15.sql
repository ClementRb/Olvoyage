SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_15</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_15.html 
  
TTITLE "- Organigramme -" 



SELECT DISTINCT LPAD(UPPER(e.last_name)||' '||e.first_name, LENGTH(UPPER(e.last_name)||' '||e.first_name)+(LEVEL*3)-3, '_') "Employé", COUNT(r.reservation_id) "Nombre de réservations" 
FROM t_employee e LEFT OUTER JOIN t_reservation r ON (e.employee_id = r.employee_id)
START WITH manager_id = (SELECT employee_id
						FROM t_employee
						WHERE manager_id IS NULL)
CONNECT BY PRIOR e.employee_id = e.manager_id
GROUP BY LPAD(UPPER(e.last_name)||' '||e.first_name, LENGTH(UPPER(e.last_name)||' '||e.first_name)+LEVEL*3-3, '_')
/

SET markup html off spool off 
spool off