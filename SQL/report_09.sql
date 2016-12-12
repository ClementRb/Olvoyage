
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON HEAD "<TITLE>Report_09</TITLE> <style>th {background-color: #7FCF00;} td {background-color:#FFEE9F;}</style>"  
BODY "><div>Mon premier rapport</div" 
spool c:\report_09.html 
  
TTITLE "- Vitesse moyenne d'un train -" 




SELECT t.train_id "N° train", dpt.city ||' - '|| arv.city "Nom du train", ROUND(distance/((arrival_time - departure_time)*60), 2) ||' km/h' "Vitesse moyenne"
FROM t_train t 
	JOIN t_station dpt ON t.departure_station_id = dpt.station_id
	JOIN t_station arv ON t.arrival_station_id = arv.station_id
ORDER BY train_id
/


SET markup html off spool off 
spool off