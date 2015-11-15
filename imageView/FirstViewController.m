//
//  FirstViewController.m
//  imageView
//
//  Created by JAY on 2015/11/9.
//  Copyright © 2015年 Huijun.org. All rights reserved.
//

#import "FirstViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    // Add a custom login button to your app
    UIButton *FBLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    FBLoginButton.backgroundColor=[UIColor blueColor];
    FBLoginButton.frame=CGRectMake(0,0,180,40);
    FBLoginButton.center = self.view.center;
    [FBLoginButton setTitle: @"FB Login " forState: UIControlStateNormal];
    
    [FBLoginButton
     addTarget:self
     action:@selector(FBLoginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:FBLoginButton];
    
    
}
-(void)FBLoginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             //[self performSegueWithIdentifier:<#(nonnull NSString *)#> sender:<#(nullable id)#>]
             [self performSegueWithIdentifier:@"gotoImage" sender:login];
         }
     }];
}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
