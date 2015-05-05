//
//  InfoTableViewController.m
//  CustomCellHeight
//
//  Created by ryt on 15/5/4.
//  Copyright (c) 2015年 ryt. All rights reserved.
//

#import "InfoTableViewController.h"
#import "InfoCell.h"
#import "InfoFrame.h"
#import "Information.h"

@interface InfoTableViewController ()
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation InfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _statusFrames = [self statusFrames];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InfoCell * cell = [InfoCell cellWithTableView:tableView];
    cell.infoFrame = _statusFrames[indexPath.row];
    
    return cell;
}

-(NSArray*)statusFrames{
    if (_statusFrames == nil) {
        NSString * fullPath = [[NSBundle mainBundle] pathForResource:@"infomation.plist" ofType:nil];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray * models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            Information * info = [Information infomationWithDict:dict];
            InfoFrame * infoF = [[InfoFrame alloc]init];
            infoF.infomation = info;
            [models addObject:infoF];
        }
        _statusFrames = [models copy];
    }
    return _statusFrames;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    InfoFrame * infoF = _statusFrames[indexPath.row];
    return infoF.cellHeight;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
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
