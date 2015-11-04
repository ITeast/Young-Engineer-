//
//  GameView.h
//  KS2
//
//  Created by Mac Book on 07.10.15.
//  Copyright (c) 2015 iteast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameView : UIViewController

@property NSInteger level;
@property (nonatomic,strong)IBOutlet UIButton *btn1;
@property (nonatomic,strong)IBOutlet UIButton *btn2;
@property (nonatomic,strong)IBOutlet UIButton *btn3;
@property (nonatomic,strong)IBOutlet UIButton *btn4;
@property (nonatomic,strong)IBOutlet UILabel *GameStepLable;
@property (nonatomic,strong)IBOutlet UILabel *GameScore;
@property (nonatomic,strong)IBOutlet UILabel *Example;
-(void)setIndexPath:(NSInteger) index;
@end

