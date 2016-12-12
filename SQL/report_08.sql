SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_08</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_08.html 
  
TTITLE "- Meilleur employée -" 

SELECT UPPER(last_name)||' '||first_name "Clients", address "Adresse"
FROM t_customer
WHERE pass_id IS NULL
ORDER BY last_name , first_name
/

SET markup html off spool off 
spool off