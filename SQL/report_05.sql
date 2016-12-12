SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_05</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_05.html 

TTITLE "- Trajets effectués -" 


SELECT t.train_id "N° train", dpt.city ||' ('|| departure_time ||' '||TO_CHAR(departure_time, 'HH24:MI')||') - '|| arv.city ||' ('|| arrival_time||' '||TO_CHAR(arrival_time, 'HH24:MI')||') ' "Trajet", distance "Distance parcourue", price "Prix initial"
FROM t_train t 
	JOIN t_station dpt ON t.departure_station_id = dpt.station_id
	JOIN t_station arv ON t.arrival_station_id = arv.station_id
ORDER BY train_id
/


SET markup html off spool off 
spool off