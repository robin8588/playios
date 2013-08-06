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
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.dataSource=self;
    self.myTableView.delegate=self;
    self.myTableView.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger result=0;
    if([tableView isEqual:self.myTableView]){
        result=3;
        
    }
    return result;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger result=0;
    if([tableView isEqual:self.myTableView]){
        switch (section) {
            case 0:
                result=3;
                break;
            case 1:
                result=5;
                break;
            case 2:
                result=8;
                break;
            default:
                break;
        }
    }
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *result=nil;
    if([tableView isEqual:self.myTableView]){
        static NSString *tableViewCellIdentifier=@"MyCell";
        result=[tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
        
        if(result==nil) {
            result=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
        }
        result.textLabel.text=[NSString stringWithFormat:@"Section %ld,Cell %ld",(long)indexPath.section,(long)indexPath.row];
        result.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    }
    return result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView isEqual:self.myTableView]){
        NSLog(@"%@",[NSString stringWithFormat:@"Cell %ld in Section %ld is selcet",(long)indexPath.row,(long)indexPath.section]);
    }
}

/*- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *result=nil;
    if([tableView isEqual:self.myTableView]){
        UILabel *label =[[UILabel alloc] initWithFrame:CGRectZero];
        label.text=[[NSString alloc] initWithFormat:@"Section %ld Header",(long)section];
        label.backgroundColor=[UIColor clearColor];
        [label sizeToFit];
        
        label.frame=CGRectMake(label.frame.origin.x+10.f, 5.0f, label.frame.size.width, label.frame.size.height);
        CGRect resultFrame=CGRectMake(0.0f, 0.0f, label.frame.size.width+10.0f, label.frame.size.height);
        result=[[UIView alloc] initWithFrame:resultFrame];
        [result addSubview:label];
    }
    return result;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UILabel *result=nil;
    if([tableView isEqual:self.myTableView]){
        result=[[UILabel alloc] initWithFrame:CGRectZero];
        result.text=[[NSString alloc] initWithFormat:@"Section %ld Footer",(long)section];
        result.backgroundColor=[UIColor clearColor];
        [result sizeToFit];
    }
    return result;
}*/

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat result=0.0f;
    if([tableView isEqual:self.myTableView]){
        result=30.f;
    }
    return result;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat result=0.0f;
    if([tableView isEqual:self.myTableView]){
        result=30.f;
    }
    return result;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *result=nil;
    if([tableView isEqual:self.myTableView]){
        result=[[NSString alloc]initWithFormat:@"SectionLabel %ld Header",(long)section];
    }
    return result;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSString *result=nil;
    if([tableView isEqual:self.myTableView]){
        result=[[NSString alloc]initWithFormat:@"SectionLabel %ld Footer",(long)section];
    }
    return result;
}

-(BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    NSLog(@"%@",NSStringFromSelector(action));
    if(action == @selector(copy:)){
    return YES;
    }
    
    return NO;
}

-(void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    if(action==@selector(copy:)){
        UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        UIPasteboard *pasteBoard=[UIPasteboard generalPasteboard];
        [pasteBoard setString:cell.textLabel.text];
    }
}
@end