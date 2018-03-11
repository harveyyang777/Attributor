//
//  PlayingCard.m
//  oc_demo
//
//  Created by Harvey Yang on 2018/3/3.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

+ (NSArray *) validSuits{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}
+ (NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"j",@"Q",@"K"];
}

+(NSUInteger) maxRank{
    return [[self rankStrings] count]-1;
}

-(NSString * ) contents{
    NSArray *rankString = [PlayingCard rankStrings];
   // return [rankString[self.rank] stringByAppendingString:self.suit];
    return [self.suit stringByAppendingString:rankString[self.rank] ];
}

-(void) setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(void) setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

-(NSString *) suit{
    return _suit?_suit:@"?";
    
}

-(int) match:(NSArray *) otherCards
{
    int score = 0;
    
    if([otherCards count]==1){
        id card = [otherCards firstObject];
        if([card isKindOfClass:[PlayingCard class]]){
            PlayingCard * otherCard = (PlayingCard *) card;
            if([self.suit isEqualToString:otherCard.suit]){
                score = 1;
            }else if(self.rank ==otherCard.rank){
                score = 4;
            }
        }
    }
     return score;
    /*
    for (PlayingCard * card in otherCards){
        if([card.suit isEqualToString:(self.suit)]){
            score=1;
        }
    }*/
}


@end
