SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_16</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_16.html 
  
TTITLE "- Augmentation des coordinateurs -"



SELECT employee_id "Num�ro de l'employ�", UPPER(last_name)||' '||first_name "Employ�", salary + 100 ||' $' "Salaire augment�"
FROM t_employee 
WHERE manager_id =
				(SELECT employee_id
				FROM t_employee
				WHERE manager_id IS NULL)
/

SET markup html off spool off 
spool off