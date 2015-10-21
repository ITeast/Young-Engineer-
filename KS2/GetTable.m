//
//  GetTable.m
//  KS2
//
//  Created by Mac Book on 08.10.15.
//  Copyright (c) 2015 iteast. All rights reserved.
//

#import "GetTable.h"
#import "LevelCell.h"
#import "BlockViewCell.h"
@interface GetTable ()

@end

@implementation GetTable

- (void)viewDidLoad {
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 9;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row<2)
    {
        
    LevelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LevelCellID" forIndexPath:indexPath];
    
        if(indexPath.row==0)
        {
            cell.Result.text=@"Ваш результат: 8/10";
            [cell.Star1 setImage:[UIImage imageNamed:@"star.png"]];
            [cell.Star2 setImage:[UIImage imageNamed:@"star.png"]];
            [cell.Star3 setImage:[UIImage imageNamed:@"star.png"]];
            [cell.Star4 setImage:[UIImage imageNamed:@"star.png"]];
        }
        if(indexPath.row==1)
        {
            cell.Result.text=@"Ваш результат: 3/10";
            [cell.Star1 setImage:[UIImage imageNamed:@"star.png"]];
            [cell.Star2 setImage:[UIImage imageNamed:@"star.png"]];
            
        }
    cell.Level.text=@"Уровень ";
    int Level=indexPath.row+1;
    NSString *fileNameLevel=[[NSString stringWithFormat:@"%ld",(long)Level] stringByAppendingFormat:@".png"];
    
    cell.Level.text=[cell.Level.text stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)Level]];
    
    cell.btn1.layer.cornerRadius = 15; // this value vary as per your desire
  
    cell.btn1.clipsToBounds = YES;
    [cell.levelImage setImage:[UIImage imageNamed:fileNameLevel]];
    return cell;
    }
    else
    {
        BlockViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlockCellID" forIndexPath:indexPath];
        
        cell.Level.text=@"Уровень ";
        int Level=indexPath.row+1;
        NSString *fileNameLevel=[[NSString stringWithFormat:@"%ld",(long)Level] stringByAppendingFormat:@".png"];
        
        cell.Level.text=[cell.Level.text stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)Level]];
        
    
        [cell.levelImage setImage:[UIImage imageNamed:fileNameLevel]];
        return cell;
    }
    // Configure the cell...
    
    return nil;
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
