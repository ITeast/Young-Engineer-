//
//  GameView.h
//  KS2
//
//  Created by Mac Book on 07.10.15.
//  Copyright (c) 2015 iteast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h> //
@interface GameView : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    SystemSoundID PlaySoundRightAnswer;
    SystemSoundID PlaySoundWrongAnswer;
    
}

@property NSInteger level;
@property (nonatomic,strong)IBOutlet UIButton *btn1;
@property (nonatomic,strong)IBOutlet UIButton *btn2;
@property (nonatomic,strong)IBOutlet UIButton *btn3;
@property (nonatomic,strong)IBOutlet UIButton *btn4;
@property (nonatomic,strong)IBOutlet UILabel *GameStepLable;
@property (nonatomic,strong)IBOutlet UILabel *GameScore;
@property (nonatomic,strong)IBOutlet UILabel *Example;
-(void)setIndexPath:(NSInteger) index;
//aohvf gjldtltyb
@property (nonatomic, strong) IBOutlet UIView *Background;
@property (nonatomic, strong) IBOutlet UIView *Form;
@property (nonatomic, strong) IBOutlet UILabel *TitleGame;
@property (nonatomic, strong) IBOutlet UILabel *ResultLable;

@property (nonatomic,strong)IBOutlet UIImageView *star1;
@property (nonatomic,strong)IBOutlet UIImageView *star2;
@property (nonatomic,strong)IBOutlet UIImageView *star3;
-(IBAction)Exit:(id)sender;
@end

