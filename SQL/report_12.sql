SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_12</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_12.html 
  
TTITLE "- Popularité des abonnements -" 





SELECT p.pass_name "Titre abonnement", c.pass_id "N° abonnement", COUNT(c.pass_id) "Total abonnements vendus"
FROM t_pass p JOIN t_customer c
ON p.pass_id = c.pass_id
GROUP BY p.pass_name, c.pass_id
ORDER BY "Total abonnements vendus" DESC
/


SET markup html off spool off 
spool off