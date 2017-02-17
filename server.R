library(shiny)


## Defining global parameters
moneybag<-510
n<-0
NumberHist<-as.vector(rep(0,37))
names(NumberHist)<-c(0:36)
StatsHist<-data.frame(red=c(0,0),black=c(0,0),odd=c(0,0),even=c(0,0))
RedBlack<-c('red','black','red','black','red','black','red','black','red','black',
            'black','red','black','red','black','red','black','red',
            'red','black','red','black','red','black','red','black','red','black',
            'black','red','black','red','black','red','black','red')
BetNr<-""
Bet<-""


shinyServer(function(input, output) {

## Reactive functions
    BetText<- reactive( {
        Bet<<-input$Choice
        if(Bet!="Number"){
            Bet
        } else {
            paste(Bet,input$Number, sep=" ")
        }
        })

    BetAmount<- reactive( {
        XX<-input$Action
        BetAm<<-input$Amount
        BetAm
    })

    BetNumber<- reactive( {
        BetNr<<-input$Number
        BetNr
    })

    RouletteNumber <- reactive( {
        XX<-input$Action
        nn<<-floor(runif(1,min=0,max=37))
        nn
    })

    Factor <- reactive( {
        XX<-input$Action
        F<-33
        if(Bet!="Number")
            {
            if(nn==0) {F<-0}
            else if ((nn %% 2)==0 & (Bet=='Even')){F<-2}
            else if ((nn %% 2)==1 & (Bet=='Odd')){F<-2}
            else if (RedBlack[nn]=='black' & (Bet=='Black')){F<-2}
            else if (RedBlack[nn]=='red' & (Bet=='Red')){F<-2}
            else {F<-0}
       }
        else if (Bet=="Number" & BetNumber()==nn){F<-35}
        else {F<-0}
        F
    })

    BetMoneybag <- reactive( {
        XX<-input$Action
        moneybag<<-moneybag-BetAm+Factor()*BetAm
        moneybag
    })

    Bars <- reactive( {
        XX<-input$Action
        NumberHist[nn+1]<<-NumberHist[nn+1]+1
        NumberHist
    })

    N <- reactive( {
        XX<-input$Action
        n<<-n+1
        n
    })

    Statistics <- reactive( {
        XX<-input$Action
        if (nn!=0){
            if ((nn %% 2)==0){StatsHist[1,"even"]<<-StatsHist[1,"even"]+1}
            if ((nn %% 2)==1){StatsHist[1,"odd"]<<-StatsHist[1,"odd"]+1}
            if (RedBlack[nn]=='black'){StatsHist[1,"black"]<<-StatsHist[1,"black"]+1}
            if (RedBlack[nn]=='red'){StatsHist[1,"red"]<<-StatsHist[1,"red"]+1}
        }
        StatsHist[2,]<-StatsHist[1,]/N()
        StatsHist
    })


    output$outTable<-renderTable(data.frame(Last_number=RouletteNumber(),Bet=BetText(),Amount=BetAmount(),Cash=BetMoneybag()),digits=0)
    output$StatHist <- renderTable(Statistics())
    output$plot<- renderPlot(barplot(Bars()))

})
