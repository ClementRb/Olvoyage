SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_04</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_04.html 
  

TTITLE "- Titres d'abonnement -" 



SELECT UPPER(c.last_name)||' '||c.first_name "Clients", p.pass_name "Titre d'abonnement",
CASE 
	WHEN MONTHS_BETWEEN('30/11/16', c.pass_date) >= 12 THEN 'Perimé !'
	WHEN pass_date IS NULL THEN 'Aucun'
END "Abonnement"
FROM t_customer c LEFT OUTER JOIN t_pass p ON c.pass_id = p.pass_id
ORDER BY last_name, first_name
/

SET markup html off spool off 
spool off