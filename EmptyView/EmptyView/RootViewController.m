//
//  RootViewController.m
//  EmptyView
//
//  Created by Wang Leo on 13-8-8.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Root Controller";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithTitle:@"主页" style:UIBarButtonItemStylePlain target:self action:@selector(performAdd:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)pushMainController{
    MainViewController *mainController=[[MainViewController alloc] initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:mainController animated:YES];
}

-(void)performAdd:(id)sender{
    [self performSelector:@selector(pushMainController) withObject:nil];
}
@end
