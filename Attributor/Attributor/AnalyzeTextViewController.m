//
//  AnalyzeTextViewController.m
//  Attributor
//
//  Created by harvey on 2018/3/24.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "AnalyzeTextViewController.h"

@interface AnalyzeTextViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;



@end

@implementation AnalyzeTextViewController
- (void) setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window){
        [self updateUI];
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // [self updateUI];
}



-(NSAttributedString *) charactersWithAttribute:(NSString *) attributeName{
    NSMutableAttributedString * characters = [[NSMutableAttributedString alloc]init];
    long index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:(index) effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.length + range.location;
        }else{
            index++;
        }
        
    }
    return characters;
}


-(void) updateUI{
    NSLog(@"update UI in analyze view control");
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters",(unsigned long)[[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu otlined",(unsigned long)[[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}
-(void) viewDidLoad{
    
    NSLog(@"viewDidload");
    [super viewDidLoad];
   // self.textToAnalyze = [[NSAttributedString alloc]initWithString:@"test" attributes:@{NSForegroundColorAttributeName : [UIColor greenColor],NSStrokeWidthAttributeName:@-3}];
    [self updateUI];
}

@end
