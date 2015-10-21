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

- (void)viewDidLoad {
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
