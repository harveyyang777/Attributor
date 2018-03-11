//
//  Card.h
//  oc_demo
//
//  Created by Harvey Yang on 2018/2/25.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString * contents;
@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMathced) BOOL mathced;

- (int) match: (NSArray *) otherCards;

@end
