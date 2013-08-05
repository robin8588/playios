//
//  LEOViewController.h
//  SinglePageView
//
//  Created by Wang Leo on 13-7-31.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEOViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *myWebView;
@property (nonatomic,strong) UIActivityIndicatorView *myindicator;
@end
