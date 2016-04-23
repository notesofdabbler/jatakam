

# Star list
starlist = c("aswini","bharani","karthigai","rohini","mrigashirsham","thiruvadarai",
             "punarpoosam","poosam","ayilyam","makam","pooram","uthiram","hastham",
             "chithirai","swathi","visakam","anusham","kettai","moolam","pooradam",
             "uthiradam","thiruvonam","avittam","sadayam","pooratathi",
             "uthratathi","revathi")

# house list
houselist = c("mesham","rishabam","mithunam","katakam","simham","kanni",
              "thula","vrichikam","dhanusu","makaram","kumbam","meenam")

# planet list
planetlist = c("suryan","chandran","sevvai","budhan","guru","sukran","sani","rahu","ketu")

# planets associates with each house
planet_house_map = c("sevvai","sukran","budhan","chandran","suryan",
                     "budhan","sukran","sevvai","guru","sani","sani","guru")
names(planet_house_map) = houselist

# planets associated with each star
planet_star_map_sub = c("ketu","sukran","suryan","chandran",
                        "sevvai","rahu","guru","sani","budhan")
planet_star_map = rep(planet_star_map_sub,3)
names(planet_star_map) = starlist

# stars in each qtr of each house
star_qtr_map = rep(starlist,each = 4)

# minutes per qtr
minperqtr = 3*60 + 20
# qtrs per house
qtrperhouse = 9

