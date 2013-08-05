//
//  LEOViewController.m
//  SinglePageView
//
//  Created by Wang Leo on 13-7-31.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import "LEOViewController.h"

@implementation LEOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor blackColor];
    self.myWebView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    self.myWebView.scalesPageToFit=YES;
    self.myWebView.delegate=self;
    [self.view addSubview:self.myWebView];
    
    NSURL *url=[NSURL URLWithString:@"http://crs.tourantrip.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
    
    self.myindicator =[[UIActivityIndicatorView alloc] initWithFrame:self.view.bounds];
    [self.myindicator setColor:[UIColor blackColor]];
    [self.view addSubview:self.myindicator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self.myindicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self.myindicator stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    UIAlertView *uialert=[[UIAlertView alloc] initWithTitle:@"加载错误" message:@"页面无法打开" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [uialert show];
    [self.myindicator stopAnimating];
}

@end