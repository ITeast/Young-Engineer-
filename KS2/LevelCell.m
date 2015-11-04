//
//  LevelCell.m
//  KS2
//
//  Created by Mac Book on 07.10.15.
//  Copyright (c) 2015 iteast. All rights reserved.
//

#import "LevelCell.h"

@implementation LevelCell

- (void)awakeFromNib {
    // Initialization code
}
-(IBAction)Start:(id)sender;
{
    extern CurrentLevel;
    CurrentLevel= _LevelNumber;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
