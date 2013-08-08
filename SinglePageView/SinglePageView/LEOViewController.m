//
//  LEOViewController.m
//  SinglePageView
//
//  Created by Wang Leo on 13-7-31.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import "LEOViewController.h"
#import "CJSONDeserializer.h"

@implementation LEOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.alert=[[UIAlertView alloc] initWithTitle:@"登陆" message:@"输入登陆信息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登陆", nil];
    [self.alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    [self.alert show];
    self.label=[[UILabel alloc] initWithFrame:self.view.bounds];
    self.button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setFrame:CGRectMake(20.0f, 80.0f, 280.0f, 44.0f)];
    [self.button setTitle:@"Send" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(sendSMS:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if([self.alert isEqual:alertView]){
        if(buttonIndex==1){
            NSString *username=[[alertView textFieldAtIndex:0] text];
            NSString *password=[[alertView textFieldAtIndex:1] text];
            
            NSURL *url=[[NSURL alloc] initWithString:@"http://192.168.1.88/tourantrip/Account/Logon"];
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL: url];
            [request setHTTPMethod:@"POST"];
            NSString *body=[[NSString alloc] initWithFormat:@"UserName=%@&Password=%@",username,password];
            [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
            
            NSURLResponse *response=nil;
            NSError *error=nil;
        
            NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            if ([data length] > 0 &&
                error == nil){
                
                NSHTTPURLResponse *httpRespone=(NSHTTPURLResponse *)response;
                NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                
                NSDictionary *headers=[httpRespone allHeaderFields];
                NSLog( @"data: %@" , result ) ;
                NSLog( @"header: %@" , headers ) ;
                NSLog(@"statusCode : %d",[httpRespone statusCode]);
                
            }
            else if ([data length] == 0 &&
                     error == nil){
                NSLog(@"No data was returned.");
            }
            else if (error != nil){
                NSLog(@"Error happened = %@", error);
            }
        }
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView{
    [[alertView textFieldAtIndex:0]setText:@""];
    [[alertView textFieldAtIndex:1]setText:@""];
}

-(void)sendSMS:(id)sender{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURL *url=[[NSURL alloc] initWithString:@"http://192.168.1.88/tourantrip/Account/sendsms"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSURLResponse *response=nil;
    NSError *error=nil;
    
    
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if ([data length] > 0 &&
        error == nil){
                
        NSHTTPURLResponse *httpRespone=(NSHTTPURLResponse *)response;
        
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSDictionary *dicresult=[[CJSONDeserializer deserializer] deserializeAsDictionary:data error:&error];
        NSString *logonresult=[dicresult valueForKey:@"Error"];
        
        NSDictionary *headers=[httpRespone allHeaderFields];
        NSLog( @"data: %@" , result ) ;
        NSLog( @"header: %@" , headers ) ;
        NSLog( @"statusCode : %d",[httpRespone statusCode]);
        [self.label setText:logonresult];
        
    }
    else if ([data length] == 0 &&
             error == nil){
        NSLog(@"No data was returned.");
    }
    else if (error != nil){
        NSLog(@"Error happened = %@", error);
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
@end