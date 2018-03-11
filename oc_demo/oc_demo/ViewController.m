//
//  ViewController.m
//  oc_demo
//
//  Created by Harvey Yang on 2018/2/24.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "ViewController.h"
#import "PlayingDeck.h"
#import "Deck.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *fliplabel;
//@property (nonatomic) int flip_count;
@property (nonatomic,strong) Deck * deck;
@property (nonatomic,strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;
@property (strong, nonatomic) IBOutlet UILabel *score;

@end

@implementation ViewController

-(CardMatchingGame *) game{
   
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.CardButtons count] usingDeck:[self deck]];
  
    return _game;
}

- (Deck *) createDeck{
    return [[PlayingDeck alloc] init];
}

- (Deck *) deck{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

/*
- (void)setFlip_count:(int)flip_count{
    _flip_count = flip_count;
    self.fliplabel.text = [NSString stringWithFormat:@"Flipped: %d",self.flip_count];
  //  NSLog(@"flipped:%d",self.flip_count);
}
 */


- (IBAction)click_new:(UIButton *)sender {
    
    
    NSUInteger cardIndex = [self.CardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
    /*
 //   NSLog(@"select card!");
    if ([sender.currentTitle length]){
        UIImage *card_image = [UIImage imageNamed:@"card_back"];
        [sender setBackgroundImage:card_image forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        Card * card = [self.deck drawRandomCard];
        if(card) {
            UIImage *card_image = [UIImage imageNamed:@"card_front"];
            [sender setBackgroundImage:card_image forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
        }
     }
 //   self.flip_count++;
     */
}
-(void)updateUI{
    
    for(UIButton *cardButton in self.CardButtons){
        
        int cardIndex1 = [self.CardButtons indexOfObject:cardButton];
        Card * card = [self.game cardAtIndex:cardIndex1];
        cardButton.enabled = !card.isMathced;
        [cardButton setTitle: [self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        [self.score setText:[NSString stringWithFormat:@"score:%ld",[self.game score]]];
        
        
    }
    
}

-(NSString *)titleForCard:(Card *)card{
    
    return card.isChosen?card.contents:@"";
}
-(UIImage *)backgroundImageForCard:(Card*)card{
    return [UIImage imageNamed:card.isChosen?@"card_front":@"card_back"];
}




@end
