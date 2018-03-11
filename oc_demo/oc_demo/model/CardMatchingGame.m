//
//  CardMatchingGame.m
//  oc_demo
//
//  Created by Harvey Yang on 2018/3/4.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray* cards;
@end

@implementation CardMatchingGame
-(NSMutableArray*)cards{
    if(!_cards) _cards=[[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger) count usingDeck:(Deck*) deck{
    NSLog(@"init with count");
    self = [super init];
    if(self){
        for(int i=0;i<=count;i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                continue;
            }
        }
    }
  
    return self;
}

-(Card*) cardAtIndex:(NSUInteger)index{
    
    return (index<[self.cards count]? self.cards[index]:nil);
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    //choose caed and get score
    
    Card * card = [self cardAtIndex:index];
    if(!card.isMathced){
        if(card.isChosen){
            card.chosen = NO;
            self.score -= COST_TO_CHOOSE;
        }else{
            //match against another cards
            for (Card * otherCard in self.cards) {
                if(otherCard.chosen&&!otherCard.mathced){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore*MATCH_BONUS;
                        card.mathced = YES;
                        otherCard.mathced = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            card.chosen = YES;
        }
        
    }
   
    
    
}


@end
