//
//  imageListTableViewController.m
//  imageView
//
//  Created by JAY on 2015/10/31.
//  Copyright © 2015年 Huijun.org. All rights reserved.
//

#import "imageListTableViewController.h"
#import "TableViewCell.h"
#import "AFNetworking.h"

#import "UIImage+AFNetworking.h"

#import "UIImageView+AFnetworking.h"
@interface imageListTableViewController ()

@end

@implementation imageListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self JsonDataPhotos];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    NSDictionary * imgdata =self.ImageListData[indexPath
                                               .row];
    
    
    //取出Data裡的陣列
    NSString *img_id = imgdata[@"id"];
    NSString *img_owner = imgdata[@"owner"];
    NSString *img_server =imgdata[@"server"];
    NSString *img_farm = imgdata[@"farm"];
    NSString *img_secret =imgdata[@"secret"];
    NSString *img_title =imgdata[@"title"];
    NSLog(@"!!!!!!!!!!!!!!!!!!ID:%@Owner:%@",img_id,img_owner);
    NSString *img_url = [NSString stringWithFormat:@"https://c2.staticflickr.com/%@/%@/%@_%@.jpg",img_farm,img_server,img_id,img_secret];
    NSLog(@"URLLLLLLLLLLLL:%@",img_url);
    
    
    
    // Configure the cell...
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",img_title];
    cell.descLablel.text = [NSString stringWithFormat:@"%li",(long)indexPath.row];
    
    
    //非同步下載方式
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: img_url]];
        if ( imageData == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            cell.BigImageView.image = [UIImage imageWithData:imageData];
            
        
        });
    });



    /*
    //在網路上的圖還沒載入前，先顯示 loading
    UIImage *placeholderImage = [UIImage imageNamed:@"loading.png"];
    //取得陣列 img_list 裡的第一個縮圖網址，轉為 NSURLRequest
    NSString *imgUrlString = img_url;
    NSURL *url = [NSURL URLWithString:imgUrlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //載入網路上的縮圖，並設定到 cell 的 ImageView
    
    __weak TableViewCell *weakCell = cell;
    [cell.BigImageView setImageWithURLRequest:request
                               placeholderImage:placeholderImage
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                            weakCell.BigImageView.image = image;
                                            [weakCell setNeedsLayout];
                                            
                                        } failure:nil
     ];
    
    
    */
    
    return cell;
}
-(void)JsonDataPhotos
{
    // 設定成員變數 JsonData 的初始大小為20，用來存抓下來的列表
    //self.JsonData = [NSMutableArray arrayWithCapacity:2];
    self.ImageListData =[NSMutableArray arrayWithCapacity:35];
    NSString *urlString = @"https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=d279a8729ecfd521867cea192e8b8971&per_page=100&format=json&nojsoncallback=1";
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //存到緩沖區
    NSData* jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    //NSLog(@"%@", dic);
    NSDictionary* DataPhotos =[dic objectForKey:@"photos"];
    
    //NSLog(@"%@", DataPhotos);
    self.ImageListData =[DataPhotos objectForKey:@"photo"];
   
  

[self.tableView reloadData];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
