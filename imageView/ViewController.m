//
//  ViewController.m
//  imageView
//
//  Created by JAY on 2015/11/5.
//  Copyright © 2015年 Huijun.org. All rights reserved.
// Add this to the header of your file
#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

// Add this to the body
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"railway" ofType:@"gif"];
    NSData *gif = [NSData dataWithContentsOfFile:filePath];
    
    UIWebView *webViewBG = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webViewBG loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    webViewBG.userInteractionEnabled = NO;
    [self.view addSubview:webViewBG];
    
    UIView *filter = [[UIView alloc] initWithFrame:self.view.frame];
    filter.backgroundColor = [UIColor blackColor];
    filter.alpha = 0.9;
    [self.view addSubview:filter];
    
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 100)];
    welcomeLabel.text = @"WELCOME";
    welcomeLabel.textColor = [UIColor whiteColor];
    welcomeLabel.font = [UIFont systemFontOfSize:50];
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:welcomeLabel];
    
    // Add a custom login button to your app
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor=[UIColor blueColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.center = self.view.center;
    [myLoginButton setTitle: @"My Login Button" forState: UIControlStateNormal];
    
    // Handle clicks on the button
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:myLoginButton];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



// Once the button is clicked, show the login dialog
-(void)loginButtonClicked
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
             
             
             [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
              startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                  
                  if (!error) {
                      NSString*message=[NSString stringWithFormat:@"fetched user:%@", result];
                      NSString*messageName=[NSString stringWithFormat:@"HI:%@", result[@"name"]];
                                         
                                         
                      UIAlertView* finalCheck = [[UIAlertView alloc]
                                                 initWithTitle:@"Welcome"
                                                 message:messageName
                                                 delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:@"Cancel",nil];
                      [finalCheck show];
                      
                      
                      NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
                      self.FBmessdamage=[NSString stringWithFormat:@"fetched user:%@", result];
                  }
              }];
             NSString *message=[NSString stringWithFormat:@"fetched user:%@", self.FBmessdamage];
           
             NSLog(@"Logged in");
             
             
             //[self performSegueWithIdentifier:<#(nonnull NSString *)#> sender:<#(nullable id)#>]
             
             
             
             
             [self performSegueWithIdentifier:@"go_Login" sender:login];
             
             
         }
     }];
}

@end