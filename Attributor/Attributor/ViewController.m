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
@property (strong, nonatomic) IBOutlet UIButton *outlineButton;

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
    NSLog(@"viewdidload");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{ NSStrokeWidthAttributeName:@-3,NSStrokeColorAttributeName:self.outlineButton.tintColor} range:(NSMakeRange(0, [title length]))];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

-(void) viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
    [  [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}

-(void) preferredFontChanged:(NSNotification *)notification{
    [self usePreferFont];
    
}

- (void)usePreferFont{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

-(void) viewWillDisappear:(BOOL)animated{
    NSLog(@"viewWillDisappear");
    [self viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}


@end
