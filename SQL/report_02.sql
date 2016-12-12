SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_02</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  

spool c:\report_02.html 

TTITLE "- Acheteurs réservistes sans billet -" 

SELECT DISTINCT UPPER(c.last_name) ||' '|| c.first_name "A acheté pour quelqu'un"
FROM t_customer c 
	JOIN t_reservation r ON r.buyer_id = c.customer_id
	JOIN t_ticket tkt ON r.reservation_id = tkt.reservation_id
WHERE r.buyer_id != tkt.customer_id
ORDER BY UPPER(c.last_name) ||' '|| c.first_name
/

SET markup html off spool off 
spool off