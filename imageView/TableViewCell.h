//
//  TableViewCell.h
//  imageView
//
//  Created by JAY on 2015/10/29.
//  Copyright © 2015年 Huijun.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLablel;

@property (weak, nonatomic) IBOutlet UIImageView *BigImageView;


@end
