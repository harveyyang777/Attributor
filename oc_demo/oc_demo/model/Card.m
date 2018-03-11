//
//  Card.m
//  oc_demo
//
//  Created by Harvey Yang on 2018/2/25.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card
-(int) match:(NSArray *) otherCards
{
    int score = 0;
    for (Card * card in otherCards){
        if([card.contents isEqualToString:(self.contents)]){
            score=1;
        }
    }
    return score;

}

@end
