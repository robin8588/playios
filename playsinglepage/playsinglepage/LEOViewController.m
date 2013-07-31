//
//  LEOViewController.m
//  playsinglepage
//
//  Created by Wang Leo on 13-7-30.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import "LEOViewController.h"

@interface LEOViewController ()

- (IBAction)greating:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *testField;
@property (weak, nonatomic) IBOutlet UILabel *saying;

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

- (IBAction)greating:(id)sender {
}
@end
