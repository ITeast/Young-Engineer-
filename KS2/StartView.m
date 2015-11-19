//
//  StartView.m
//  KS2
//
//  Created by Mac Book on 07.10.15.
//  Copyright (c) 2015 iteast. All rights reserved.
//

#import "StartView.h"

@interface StartView ()

@end

@implementation StartView

- (void)viewDidLoad
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *LevelUnlock= [[NSMutableArray alloc] initWithArray:[userDefaults objectForKey:@"ar1"]];
    NSMutableArray *LevelCountStar= [[NSMutableArray alloc] initWithArray:[userDefaults objectForKey:@"ar2"]];
    NSMutableArray *LevelRightAnswer= [[NSMutableArray alloc] initWithArray:[userDefaults objectForKey:@"ar3"]];
    
   
    if([LevelUnlock count]!=0 && [LevelCountStar count]!=0 && LevelCountStar!=nil && LevelUnlock!=nil)
    {
        //Массив задан он существует
        NSNumber *ik=[LevelUnlock objectAtIndex:0];
        
    }
    else
    {
        
        NSMutableArray *LevelCountStar=[[NSMutableArray alloc] init];
        NSMutableArray *LevelUnlock=[[NSMutableArray alloc]init];
        NSMutableArray *LevelRightAnswer=[[NSMutableArray alloc]init];
        for(int i=0; i<10; i++)
        {
            if(i==0)
            {
                [LevelUnlock addObject:[NSNumber numberWithInt:1]];
            }
            else
            {
                [LevelUnlock addObject:[NSNumber numberWithInt:0]];
            }
            [LevelCountStar addObject:[NSNumber numberWithInt:0]];
            [LevelRightAnswer addObject:[NSNumber numberWithInt:0]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:LevelUnlock forKey:@"ar1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults] setObject:LevelCountStar forKey:@"ar2"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults] setObject:LevelRightAnswer forKey:@"ar3"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
   // [[NSUserDefaults standardUserDefaults] setObject:yourMutableArray forKey:@"Key"];
    
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    _btn1.layer.cornerRadius = 15; // this value vary as per your desire
    _btn2.layer.cornerRadius = 15; // this value vary as per your desire
    _btn3.layer.cornerRadius = 15; // this value vary as per your desire
    _btn4.layer.cornerRadius = 15; // this value vary as per your desire
    _btn1.clipsToBounds = YES;
    _btn2.clipsToBounds = YES;
    _btn3.clipsToBounds = YES;
    _btn4.clipsToBounds = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (BOOL) prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
