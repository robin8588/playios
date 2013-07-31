//
//  LEOViewController.m
//  SinglePageView
//
//  Created by Wang Leo on 13-7-31.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import "LEOViewController.h"

@interface LEOViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *text;
- (IBAction)greeting:(id)sender;

@end

@implementation LEOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)greeting:(id)sender {
    self.userName=self.text.text;
    NSString *nameString=self.userName;
    if([nameString length]==0){
        nameString=@"hello";
    }
    NSString *greeting=[[NSString alloc] initWithFormat:@"you %@",nameString];
    self.label.text=greeting;
    [self.text resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField{
    if(theTextField==self.text){
        [theTextField resignFirstResponder];
    }
    return YES;
}
@end
