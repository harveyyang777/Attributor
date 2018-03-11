//
//  ViewController.m
//  Attributor
//
//  Created by Harvey Yang on 2018/3/11.
//  Copyright © 2018年 Harvey Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *headline;
@property (strong, nonatomic) IBOutlet UITextView *body;

@end

@implementation ViewController

- (IBAction)change_selected_part_to_color_of_button:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
    
}


- (IBAction)outlineBodySelection:(UIButton *)sender {
    
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName:@3,NSStrokeColorAttributeName:[UIColor blackColor]} range:self.body.selectedRange];
}


- (IBAction)unoutline:(id)sender {
    [self.body
     .textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}









- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



@end
