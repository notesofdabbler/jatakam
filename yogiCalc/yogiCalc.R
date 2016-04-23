

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

## Inputs
suryan_long_deg = 100
suryan_long_min = 0

chandran_long_deg = 250
chandran_long_min = 0

extra_deg = 93
extra_min = 20

# calculate total of suryan, chandran and extra (in minutes)
tot = 60*(suryan_long_deg + chandran_long_deg + extra_deg) + 
         (suryan_long_min + chandran_long_min + extra_min)

# take remainder from 360 degrees
period = 360*60
tot = tot %% period

tot_deg = floor(tot/60)
tot_min = tot %% 60

# calculate house-qtr
houseqtr = ceiling(tot/minperqtr)
house = ceiling(houseqtr/qtrperhouse)
qtr = houseqtr %% qtrperhouse

gethouse = houselist[house]
getstar = star_qtr_map[houseqtr]
gethouseplanet = planet_house_map[gethouse]
getstarplanet = planet_star_map[getstar]
