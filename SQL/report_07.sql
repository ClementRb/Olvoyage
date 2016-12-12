
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_07</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_07.html 
  
TTITLE "- Top-5 des trains -" 





SELECT *
FROM  (SELECT t.train_id "Numéro du train", dpt.city ||' - '|| arv.city "Top 5 des trains"
		FROM t_train t
			JOIN t_station dpt ON t.departure_station_id = dpt.station_id
			JOIN t_station arv ON t.arrival_station_id = arv.station_id
			JOIN t_wagon_train wt ON t.train_id = wt.train_id
			JOIN t_ticket tkt ON wt.wag_tr_id = tkt.wag_tr_id
		GROUP BY t.train_id, dpt.city ||' - '|| arv.city
		ORDER BY COUNT(tkt.ticket_id) DESC)
WHERE ROWNUM <=5 
/
SET markup html off spool off 
spool off