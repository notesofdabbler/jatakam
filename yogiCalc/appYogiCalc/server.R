library(shiny)

source("yogiCalc_setup.R")

shinyServer(function(input,output){
  
  yogiCalc = reactive({
    ## Inputs
    suryan_house = input$suryan_house
    suryan_house_idx = match(suryan_house,houselist)
    suryan_long_deg = input$suryan_long_deg
    suryan_long_deg = (suryan_house_idx - 1) * 30 + suryan_long_deg
    suryan_long_min = input$suryan_long_min
    
    chandran_house = input$chandran_house
    chandran_house_idx = match(chandran_house,houselist)
    chandran_long_deg = input$chandran_long_deg
    chandran_long_deg = (chandran_house_idx - 1) * 30 + chandran_long_deg
    chandran_long_min = input$chandran_long_min
    
    if(input$yogitype == "Yogi"){
      extra_deg = 93
      extra_min = 20      
    } else {
      extra_deg = 280
      extra_min = 0
    }

    
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
    
    return(list(gethouse = gethouse,getstar = getstar,
                gethouseplanet = gethouseplanet,
                getstarplanet = getstarplanet,
                tot_deg = tot_deg,
                tot_min = tot_min))
    
  })
  
  output$getstarhouse = renderUI({
    houseinfo = paste0("<h1> House </h1><h3>",yogiCalc()$gethouse,"</h3></br>")
    starinfo = paste0("<h1> Star </h1><h3> ",yogiCalc()$getstar,"</h3></br>")
    
    uiout = paste0(houseinfo,starinfo)
    HTML(uiout)
  })
  
  output$getstarhouseplanet = renderUI({
    
    houseplanetlabel = "Duplicate Yogi"
    
    if(input$yogitype == "Yogi"){
      starplanetlabel = "Yogi"
    } else {
      starplanetlabel = "Avayogi"
    }
    
    houseinfo = paste0("<h1>",houseplanetlabel,"</h1><h3>",yogiCalc()$gethouseplanet,"</h3></br>")
    starinfo = paste0("<h1>",starplanetlabel,"</h1><h3> ",yogiCalc()$getstarplanet,"</h3></br>")
    
    if(input$yogitype == "Yogi"){
      uiout = paste0(houseinfo,starinfo)
    } else {
      uiout = starinfo
    }
    
    HTML(uiout)
  })
  
  output$totdegmin = renderText({
    uiout = paste0(yogiCalc()$tot_deg," degrees ",yogiCalc()$tot_min," minutes")
    uiout
  })
  
  
})