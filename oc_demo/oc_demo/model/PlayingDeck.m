//
//  PlayingDeck.m
//  oc_demo
//
//  Created by Harvey Yang on 2018/3/3.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "PlayingDeck.h"
#import "PlayingCard.h"
@implementation PlayingDeck
-(instancetype) init{
    self = [super init];
    
    if (self){
        for (NSString* suit in [PlayingCard validSuits] )
            for (NSInteger rank =1;rank <= [PlayingCard maxRank];rank++){
                PlayingCard * card = [[PlayingCard alloc] init];
                card.suit=suit;
                card.rank=rank;
                [self addCard:card];
            }
    }
    
    return self;
}
@end
