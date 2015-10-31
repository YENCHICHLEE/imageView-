//
//  ImageTableViewController.h
//  imageView
//
//  Created by JAY on 2015/10/29.
//  Copyright © 2015年 Huijun.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TableViewCell.h"


@interface ImageTableViewController : UITableViewController


@property (nonatomic, strong) NSMutableArray * JsonData;
@property (nonatomic, strong) NSMutableArray * ImageListData;

@end
