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
@property (strong, nonatomic) IBOutlet UISwitch *uswitch;

- (IBAction)greeting:(id)sender;

@end

@implementation LEOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.uswitch setOn:NO];
    [self.uswitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)greeting:(id)sender {
        
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"这是Alert" message:@"第一个消息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"O了", nil];
    
    [alertView show];
    [self.text resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField{
    if(theTextField==self.text){
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        NSLog(@"0 fired");
    };
    if(buttonIndex==1){
        self.userName=self.text.text;
        NSString *nameString=self.userName;
        if([nameString length]==0){
            nameString=@"hello";
        }
        NSString *greeting=[[NSString alloc] initWithFormat:@"you %@",nameString];
        self.label.text=greeting;

    }
}

-(void)switchChanged:(UISwitch *)sender{
    NSLog(@"sender is %@",sender);
    if([sender isOn]){
        self.text.text=@"Turn ON";
    }else{
        self.text.text =@"Turn Off";
    }
}
@end
