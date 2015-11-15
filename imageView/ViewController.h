//
//  ViewController.h
//  imageView
//
//  Created by JAY on 2015/11/5.
//  Copyright © 2015年 Huijun.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@property (nonatomic, strong) NSString *FBmessdamage;
@end
