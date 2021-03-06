//
//  DraggableViewBackground.m
//  testing swiping
//
//  Created by Richard Kim on 8/23/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "DraggableViewBackground.h"
#import "HRManager.h"

@implementation DraggableViewBackground
{
    HRManager *shared; //instance of our model
    
    NSInteger cardsLoadedIndex; //%%% the index of the card you have loaded into the loadedCards array last
    NSMutableArray *loadedCards; //%%% the array of card loaded (change max_buffer_size to increase or decrease the number of cards this holds)
    
    CGFloat xFromCenter;
    CGFloat yFromCenter;
}

//this makes it so only 3 cards are loaded at a time to avoid performance and memory costs
static const int MAX_BUFFER_SIZE = 3; //%%% max number of cards loaded at any given time, must be greater than 1

@synthesize exampleCardLabels; //%%% all the labels I'm using as example data at the moment
@synthesize allCards;//%%% all the cards

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [super layoutSubviews];
//        [self setupView];
        
        shared = [HRManager sharedManager];
        
        exampleCardLabels = shared.potentialApartments;
        loadedCards = [[NSMutableArray alloc] init];
        allCards = [[NSMutableArray alloc] init];
        cardsLoadedIndex = 0;
        [self loadCards];
    }
    return self;
}

//%%% sets up the extra buttons on the screen
-(void)setupView
{
#warning customize all of this.  These are just place holders to make it look pretty
//    xButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 485, 59, 59)];
//    [xButton setImage:[UIImage imageNamed:@"xButton"] forState:UIControlStateNormal];
//    [xButton addTarget:self action:@selector(swipeLeft) forControlEvents:UIControlEventTouchUpInside];
//    checkButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 485, 59, 59)];
//    [checkButton setImage:[UIImage imageNamed:@"checkButton"] forState:UIControlStateNormal];
//    [checkButton addTarget:self action:@selector(swipeRight) forControlEvents:UIControlEventTouchUpInside];
    
}

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)


#warning include own card customization here!
//%%% creates a card and returns it.  This should be customized to fit your needs.
// use "index" to indicate where the information should be pulled.  If this doesn't apply to you, feel free
// to get rid of it (eg: if you are building cards from data from the internet)
- (DraggableView *)createDraggableViewWithDataAtIndex:(NSInteger)index
{
    DraggableView *draggableView = [[DraggableView alloc]initWithFrame:CGRectMake(0,0, self.frame.size.width-70, self.frame.size.height - 230)];
    draggableView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2+30);
    draggableView.information.text = [exampleCardLabels objectAtIndex:index]; //%%% placeholder for card-specific information
    draggableView.delegate = self;
    draggableView.panGestureRecognizer.enabled = NO;
    
    double rads = DEGREES_TO_RADIANS(0);
    
    if (index%3==1)
        rads = DEGREES_TO_RADIANS(5);
    if (index%3==2)
        rads = DEGREES_TO_RADIANS(-5);

    CGAffineTransform transform = CGAffineTransformRotate(CGAffineTransformIdentity, rads);
    draggableView.transform = transform;

    return draggableView;
}

//%%% loads all the cards and puts the first x in the "loaded cards" array
-(void)loadCards
{
    if([exampleCardLabels count] > 0) {
        NSInteger numLoadedCardsCap =(([exampleCardLabels count] > MAX_BUFFER_SIZE)?MAX_BUFFER_SIZE:[exampleCardLabels count]);
        //%%% if the buffer size is greater than the data size, there will be an array error, so this makes sure that doesn't happen
        
        //%%% loops through the exampleCardsLabels array to create a card for each label.  This should be customized by removing "exampleCardLabels" with your own array of data
        for (int i = 0; i<[exampleCardLabels count]; i++) {
            DraggableView* newCard = [self createDraggableViewWithDataAtIndex:i];
            [allCards addObject:newCard];
            
            if (i<numLoadedCardsCap) {
                //%%% adds a small number of cards to be loaded
                [loadedCards addObject:newCard];
            }
        }
        
        //%%% displays the small number of loaded cards dictated by MAX_BUFFER_SIZE so that not all the cards
        // are showing at once and clogging a ton of data
        for (int i = 0; i<[loadedCards count]; i++) {
            if (i>0) {
                [self insertSubview:[loadedCards objectAtIndex:i] belowSubview:[loadedCards objectAtIndex:i-1]];
            } else {
                DraggableView *card = [loadedCards objectAtIndex:i];
                card.panGestureRecognizer.enabled = YES;
                [self addSubview:card];
                
            }
            cardsLoadedIndex++; //%%% we loaded a card into loaded cards, so we have to increment
        }
    }
}

#warning include own action here!
//%%% action called when the card goes to the left.
// This should be customized with your own action
-(void)cardSwipedLeft:(UIView *)card;
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    
    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
        
    }

    [self fixRotationOfAllLoadedCards];
}

#warning include own action here!
//%%% action called when the card goes to the right.
// This should be customized with your own action
-(void)cardSwipedRight:(UIView *)card
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    
    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
        
        
    }
    
    [self fixRotationOfAllLoadedCards];

}

//%%% when you hit the right button, this is called and substitutes the swipe
-(void)swipeRight
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeRight;
//    [UIView animateWithDuration:0.2 animations:^{
//        dragView.overlayView.alpha = 1;
//    }];
    [dragView rightClickAction];
}

//%%% when you hit the left button, this is called and substitutes the swipe
-(void)swipeLeft
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeLeft;
//    [UIView animateWithDuration:0.2 animations:^{
//        dragView.overlayView.alpha = 1;
//    }];
    [dragView leftClickAction];
}

#pragma mark - draggable card elegate

- (void)cardIsBeingDraggedWithGesture:(UIPanGestureRecognizer *)gesture
{
    //%%% this extracts the coordinate data from your swipe movement. (i.e. How much did you move?)
    xFromCenter = [gesture translationInView:self].x; //%%% positive for right swipe, negative for left
    yFromCenter = [gesture translationInView:self].y; //%%% positive for up, negative for down
    
//    NSLog(@"%@",CGAffineTransformIdentity);

}

#pragma mark - helper methods

- (void)fixRotationOfAllLoadedCards
{
    DraggableView *newCard;
    if (loadedCards.count>1)
        newCard = [loadedCards lastObject];
    DraggableView *secondCard = [loadedCards firstObject];
    secondCard.panGestureRecognizer.enabled = YES;
    
    DraggableView *thirdsCard;
    if (loadedCards.count>2)
        thirdsCard = [loadedCards objectAtIndex:1];
    
    [UIView animateWithDuration:0.5 animations:^{
        secondCard.transform  = CGAffineTransformMakeRotation(0);
        if (newCard)
            newCard.transform  = CGAffineTransformRotate(CGAffineTransformIdentity, DEGREES_TO_RADIANS(-5));
        if (thirdsCard)
            thirdsCard.transform  = CGAffineTransformRotate(CGAffineTransformIdentity, DEGREES_TO_RADIANS(5));
        
    }];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
