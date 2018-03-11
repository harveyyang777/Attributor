//
//  Deck.h
//  oc_demo
//
//  Created by Harvey Yang on 2018/2/26.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *) card atTop:(BOOL) atTop;
-(void) addCard:(Card *) card;
-(Card*) drawRandomCard;

@end
