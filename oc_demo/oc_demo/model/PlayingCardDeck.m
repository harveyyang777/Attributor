//
//  PlayingCardDeck.m
//  oc_demo
//
//  Created by harvey on 2018/2/28.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@implementation PlayingCardDeck
- (instancetype)init{
    
    self = [self init];
    if (self){
        for (NSString *suit in [PlayingCard validSuit]){
            for (NSUInteger rank =1;rank <= [PlayingCard maxRank];rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit =suit;
            }
        }
    }
    
    return self;
}

@end
