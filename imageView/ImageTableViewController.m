//
//  ImageTableViewController.m
//  imageView
//
//  Created by JAY on 2015/10/29.
//  Copyright © 2015年 Huijun.org. All rights reserved.
//

#import "ImageTableViewController.h"
#import "TableViewCell.h"
#import "AFNetworking.h"

//#import "UIImage+AFNetworking.h"
#import "UIImageView+AFnetworking.h"
@interface ImageTableViewController ()


@end

@implementation ImageTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.greekLetters =@[@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei"] ;
    
    //[self JsonDataPhotos];
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

    return [self.greekLetters count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
//TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
   // cell.titleLabel.text = [NSString stringWithFormat:@"第個Row的title"];
    
    NSString *SimpleIdentifier =  @"SimpleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SimpleIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
    }
    cell.textLabel.text =self.greekLetters[indexPath.row];
    
    return cell;
    
    
    
    //cell.descLablel.text = [NSString stringWithFormat:@"第個Row的description"];
    
  /*
    NSDictionary * imgdata =self.ImageListData[indexPath.row];
    //取出Data裡的陣列
    NSString *img_id = imgdata[@"id"];
    NSString *img_owner = imgdata[@"owner"];
    NSString *img_farm = imgdata[@"farm"];
    NSLog(@"!!!!!!!!!!!!!!!!!!ID:%@Owner:%@",img_id,img_owner);
    NSString *img_url = [NSString stringWithFormat:@"https://www.flickr.com/photos/%@/%@/",img_owner,img_id];
    NSLog(@"URL:",img_url);
   */
  //cell.BigImageView.image = [UIImage imageNamed:@"loading.png"];
    return cell;
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
/*
-(void)JsonDataPhotos
{
    // 設定成員變數 JsonData 的初始大小為20，用來存抓下來的列表
    //self.JsonData = [NSMutableArray arrayWithCapacity:2];
    NSString *urlString = @"https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=d279a8729ecfd521867cea192e8b8971&per_page=20&format=json&nojsoncallback=1";
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //存到緩沖區
    NSData* jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    //NSLog(@"%@", dic);
    NSDictionary* DataPhotos =[dic objectForKey:@"photos"];
    
    NSLog(@"%@", DataPhotos);
    self.ImageListData =[DataPhotos objectForKey:@"photo"];
    
    
    
    //self.JsonData =[[DataPhoto objectAtIndex:2] objectForKey:@"id"];
}
*/

@end
