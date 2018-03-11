//
//  CardMatchingGame.h
//  oc_demo
//
//  Created by Harvey Yang on 2018/3/4.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "Deck.h"

@interface CardMatchingGame : Deck
- (instancetype)initWithCardCount:(NSUInteger) count usingDeck:(Deck*) deck;

@property (nonatomic,readonly) NSInteger score;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card*)cardAtIndex:(NSUInteger)index;

@end
