//
//  imageListTableViewController.h
//  imageView
//
//  Created by JAY on 2015/10/31.
//  Copyright © 2015年 Huijun.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageListTableViewController : UITableViewController

@property  (copy, nonatomic) NSMutableArray *greekLetters;
@property (nonatomic, strong) NSMutableArray * JsonData;
@property (nonatomic, strong) NSMutableArray * ImageListData;

@end
