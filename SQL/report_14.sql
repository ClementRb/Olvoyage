SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_14</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_14.html 
  
TTITLE "- Places disponibles -"


SELECT t.train_id "N° du train", dpt.city ||' - '|| arv.city "Nom du train", SUM(w.nb_seat - tkt.seat) "Places disponibles"
FROM t_train t 
	JOIN t_station dpt ON t.departure_station_id = dpt.station_id
	JOIN t_station arv ON t.arrival_station_id = arv.station_id
	JOIN t_wagon_train wt ON t.train_id = wt.train_id
	JOIN t_wagon w ON wt.wagon_id = w.wagon_id
	JOIN t_ticket tkt ON wt.wag_tr_id = tkt.wag_tr_id
WHERE t.distance > 300
AND t.departure_time LIKE '22/01/17'
AND tkt.reservation_id IS NOT NULL
GROUP BY t.train_id, dpt.city ||' - '|| arv.city
ORDER BY t.train_id
/

SET markup html off spool off 
spool off