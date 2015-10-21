//
//  LevelCell.h
//  KS2
//
//  Created by Mac Book on 07.10.15.
//  Copyright (c) 2015 iteast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LevelCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UILabel *Level;
@property (nonatomic,strong)IBOutlet UILabel *Result;
@property (nonatomic,strong)IBOutlet UIButton *btn1;
@property (nonatomic,strong)IBOutlet UIImageView *levelImage;

@property (nonatomic,strong)IBOutlet UIImageView *Star1;
@property (nonatomic,strong)IBOutlet UIImageView *Star2;
@property (nonatomic,strong)IBOutlet UIImageView *Star3;
@property (nonatomic,strong)IBOutlet UIImageView *Star4;
@property (nonatomic,strong)IBOutlet UIImageView *Star5;
@end
