//
//  Deck.m
//  oc_demo
//
//  Created by Harvey Yang on 2018/2/26.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards;
@end
@implementation Deck
- (NSMutableArray *)cards{
    //保证每次调用self.cards都不是nil，至少是一个空数组,首次调用的时候初始化
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}
- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
    
}
-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
    
}
-(Card*) drawRandomCard{
    Card * randomCard;
    if([self.cards count]){
        int index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end
