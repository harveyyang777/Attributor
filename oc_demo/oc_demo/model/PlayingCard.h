//
//  PlayingCard.h
//  oc_demo
//
//  Created by Harvey Yang on 2018/3/3.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong,nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;
+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;
+ (NSUInteger) maxRank;
@end
