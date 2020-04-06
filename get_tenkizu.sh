#!/bin/csh -f
#--------------------------------------------
#  sub       :: get_tenkizu.sh
#  purpose   :: you can get tenkizu
#  
#                           coded by Toyooka
#                            @2018.10.8
#                           copied by Kumagai
#                            @2019.04.21 
#--------------------------------------------

 set s_yy = 2020
 set e_yy = 2020
 while ( ${s_yy} <= ${e_yy} ) 

 	set s_mm = 1
 	set e_mm = 1
 	while ( ${s_mm} <= ${e_mm} )
		 	
		set m0 = ${s_mm}
		if( ${s_mm} <= 9 ) set m0 = 0${s_mm}
		set s_dd = 1
		set e_dd = 13
		while ( ${s_dd} <= ${e_dd} )
			set d0 = ${s_dd}
	 		if( ${s_dd} <= 9 ) set d0 = 0${s_dd}
			
			cd tenkizu 
			mkdir -p ${s_yy}${m0}${d0}
			set i_dir = /work3/reo0403/weather/tenkizu/${s_yy}${m0}${d0}
 		
			sleep 1 
	
			set s_hh = 0 
			set e_hh = 21 
			while ( ${s_hh} <= ${e_hh} )
				set h0 = ${s_hh}
				if( ${s_hh} <= 9 ) set h0 = 0${s_hh}

				wget http://www.hbc.co.jp/tecweather/archive/pdf/SPAS_${s_yy}${m0}${d0}${h0}.pdf -P ${i_dir}
 

				@ s_hh = ${s_hh} + 3
			end
			convert -loop 0 -delay 150 ${i_dir}/*.pdf ${i_dir}/${s_yy}${m0}${d0}.gif
 			@ s_dd = ${s_dd} + 1
 			cd /work3/reo0403/weather
 		end
 		@ s_mm = ${s_mm} + 1
 	end
 	@ s_yy = ${s_yy} + 1
 end


exit
