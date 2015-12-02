//
//  GameView.m
//  KS2
//
//  Created by Mac Book on 07.10.15.
//  Copyright (c) 2015 iteast. All rights reserved.
//

#import "GameView.h"

@interface GameView ()

@end

@implementation GameView
//*********************************************
//Глобальные переменные
int result;
int *arg2;
int arg1[10];
int GameStep;
//*********************************************
-(void)GenerateAnswer:(int) numberExample
{
    // 1 заполнение кнопок произв данными
    int Answer;
    int LastAnswer[4];
    LastAnswer[0]=-1;
    LastAnswer[1]=-1;
    LastAnswer[2]=-1;
    LastAnswer[3]=-1;
    int RightAnswer=arg1[numberExample]*arg2[numberExample];
    for (int i=0; i<4; i++)
    {
        do
        {
            Answer=arc4random()%(RightAnswer*2+10);
        }
        while(LastAnswer[0]==Answer || LastAnswer[1]==Answer || LastAnswer[2]==Answer || LastAnswer[3]==Answer || Answer==RightAnswer);
        [ self SetTextToButon:i Answer:Answer];
     LastAnswer[i]=Answer;
    }
    // 2 ввод правильного ответа
    int indexRightAnswer=arc4random()%4;
    [self SetTextToButon:indexRightAnswer Answer:RightAnswer];
    
}
-(void)ShowGameStep: (int)GameStepNumber
{
    _GameStepLable.text=[NSString stringWithFormat:@"Всего решено: %d/10",GameStepNumber];
}
-(void)SetTextToButon: (int) numberButton Answer: (int) Answer
{
    if(numberButton==0)
    {
        [_btn1 setTitle:[NSString stringWithFormat:@"%d",Answer] forState:UIControlStateNormal];
        
    }
    else if(numberButton==1)
    {
        [_btn2 setTitle:[NSString stringWithFormat:@"%d",Answer] forState:UIControlStateNormal];
    }
    else if(numberButton==2)
    {
        [_btn3 setTitle:[NSString stringWithFormat:@"%d",Answer] forState:UIControlStateNormal];
    }
    else if(numberButton==3)
    {
        [_btn4 setTitle:[NSString stringWithFormat:@"%d",Answer] forState:UIControlStateNormal];
    }
    


}
- (void)viewDidLoad  {
    //Музыка и звуки
    NSURL *sound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"answer_right" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) sound, &PlaySoundRightAnswer);
    NSURL *errorSound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Error" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) errorSound, &PlaySoundWrongAnswer);
     NSURL *worrysound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Worry" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) worrysound, &PlaySoundGameOverWorry);
    NSURL *successsound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Success" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) successsound, &PlaySoundGameOverSuccess);
    NSURL *starsound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Star" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)starsound, &PlaySoundStar);

    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [_Background setHidden:YES];
    [_Form setHidden:YES];

    //**************************************
    //Генерирование массива аргументов
    
    arg2=malloc(sizeof(int)*10);
    arg2=[self GenerateArray];
     extern CurrentLevel;
    _level=CurrentLevel;
    int lv=CurrentLevel;
    for (int i=1; i<=10; i++)
    {
        arg1[i-1]=lv;
    }
    //**************************************
    [self OutputExampleToUILable:0];
    GameStep=0;
    
    _btn1.layer.cornerRadius = 32; // this value vary as per your desire
    _btn2.layer.cornerRadius = 32; // this value vary as per your desire
    _btn3.layer.cornerRadius = 32; // this value vary as per your desire
    _btn4.layer.cornerRadius = 32; // this value vary as per your desire
    
    _btn1.clipsToBounds = YES;
    _btn2.clipsToBounds = YES;
    _btn3.clipsToBounds = YES;
    _btn4.clipsToBounds = YES;
    
    result=0;
    [self ShowGameScore:result];
    [self ShowGameStep:GameStep];
    
       //_level=(GameView)self.level;
    self.larry.frame=CGRectMake(self.larry.frame.origin.x+320, self.larry.frame.origin.y, self.larry.frame.size.width, self.larry.frame.size.height);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)setIndexPath:(NSInteger) index
{
    _level=index;
}
- (BOOL) prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ShowGameScore: (int)GameResult
{
    _GameScore.text=[NSString stringWithFormat:@"Ваш счет: %d",GameResult];
}
-(void)AnimationBackground
{
    CGFloat x_position=self.Form.frame.origin.x;
    self.Form.frame=CGRectMake(-300.0, self.Form.frame.origin.y, self.Form.frame.size.width, self.Form.frame.size.height);
    self.Background.alpha=0.0;
    [UIView animateWithDuration:0.5 animations:^(void)
      {
          self.Form.frame=CGRectMake(x_position, self.Form.frame.origin.y, self.Form.frame.size.width, self.Form.frame.size.height);
          self.Background.alpha=0.8;
      }
     completion:^(BOOL finished)
     {
         self.Form.frame=CGRectMake(x_position, self.Form.frame.origin.y, self.Form.frame.size.width, self.Form.frame.size.height);
        self.Background.alpha=0.8;
     }];
}

-(IBAction)Exit:(id)sender

{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)GameLoop
{
//Функция игрового шага
GameStep++;
    if(GameStep>=10)
    {
        
        //подведение итогов
        [self ShowGameStep:10];
        [_Background setHidden:NO];
        [_Form setHidden:NO];
        int ArgumentCountStar=0;
        [self AnimationBackground];
        if(result>=0 && result<=4)
        {
            AudioServicesPlaySystemSound(PlaySoundGameOverWorry);
            self.TitleGame.text=@"Очень плохо!";
            self.ResultLable.text=[NSString stringWithFormat:@"Ваш счет: %d/10",result];
            [self SetArray:result count_start:0];
            ArgumentCountStar=0;
        }
        else if(result>=5 && result<=7)
        {
            AudioServicesPlaySystemSound(PlaySoundGameOverWorry);
            self.TitleGame.text=@"Плохо!";
            self.ResultLable.text=[NSString stringWithFormat:@"Ваш счет: %d/10",result];
            [self SetArray:result count_start:1];
            ArgumentCountStar=1;
        }
        else if(result>=8 && result<=9)
        {
            AudioServicesPlaySystemSound(PlaySoundGameOverSuccess);
            self.TitleGame.text=@"Хорошо!";
            self.ResultLable.text=[NSString stringWithFormat:@"Ваш счет: %d/10",result];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSMutableArray *LevelUnlock= [[NSMutableArray alloc] initWithArray:[userDefaults objectForKey:@"ar1"]];
            int k=_level;
            
            [LevelUnlock replaceObjectAtIndex:k withObject:[NSNumber numberWithInt:1]];
            
            [[NSUserDefaults standardUserDefaults] setObject:LevelUnlock forKey:@"ar1"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self SetArray:result count_start:2];
            ArgumentCountStar=2;
        }
        else if(result==10)
        {
            AudioServicesPlaySystemSound(PlaySoundGameOverSuccess);
            self.TitleGame.text=@"Отлично!";
            self.ResultLable.text=[NSString stringWithFormat:@"Ваш счет: %d/10",result];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSMutableArray *LevelUnlock= [[NSMutableArray alloc] initWithArray:[userDefaults objectForKey:@"ar1"]];
            int k=_level;
            
            [LevelUnlock replaceObjectAtIndex:k withObject:[NSNumber numberWithInt:1]];
            
            [[NSUserDefaults standardUserDefaults] setObject:LevelUnlock forKey:@"ar1"];
            [[NSUserDefaults standardUserDefaults] synchronize];
             [self SetArray:result count_start:3];
            ArgumentCountStar=3;
        }
        [self ShowStarAnimation: ArgumentCountStar];
       
        //[self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self OutputExampleToUILable:GameStep];
        [self ShowGameStep:GameStep];
    }
       
}
-(void)SetArray:(int)user_result count_start:(int) count_star
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *LevelCountStar= [[NSMutableArray alloc] initWithArray:[userDefaults objectForKey:@"ar2"]];
    NSMutableArray *LevelResult= [[NSMutableArray alloc] initWithArray:[userDefaults objectForKey:@"ar3"]];
    int k=_level-1;
    
    [LevelCountStar replaceObjectAtIndex:k withObject:[NSNumber numberWithInt:count_star]];
    [LevelResult replaceObjectAtIndex:k withObject:[NSNumber numberWithInt:user_result]];
    
    [[NSUserDefaults standardUserDefaults] setObject:LevelCountStar forKey:@"ar2"];
    [[NSUserDefaults standardUserDefaults] setObject:LevelResult forKey:@"ar3"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)ShowStarAnimation: (int) CountStarShow
{
    self.star1.alpha=0.0;
    self.star2.alpha=0.0;
    self.star3.alpha=0.0;
    if(CountStarShow!=0)
    {
    [UIView animateWithDuration:0.5 animations:^(void)
     {
          self.star1.alpha=0.8;
     }
                     completion:^(BOOL finished)
     {
         self.star1.alpha=0.8;
         if(CountStarShow>1)
         {
         [UIView animateWithDuration:0.5 animations:^(void)
          {
              self.star2.alpha=0.8;
    
          }
                          completion:^(BOOL finished)
          {
              self.star2.alpha=0.8;
              if(CountStarShow>2)
              {
              [UIView animateWithDuration:0.5 animations:^(void)
               {
                   self.star3.alpha=0.8;
               }
                               completion:^(BOOL finished)
               {
                   self.star3.alpha=0.8;
               }];
              }
          }];
         }
   }];
    }
    
}

-(IBAction)press1Button:(id)sender
{
  
    NSString *title=_btn1.currentTitle;
    int UserAnswer=[title intValue];
    if([self AreUserAnswerRight:arg1[GameStep] Arg2:arg2[GameStep] Answer:UserAnswer])
    {
        //Пользователь ответил правильно
        result++;
        [self ShowGameScore:result];
        [self GameLoop];
    }
    
    
}
-(IBAction)press2Button:(id)sender
{
    NSString *title=_btn2.currentTitle;
    int UserAnswer=[title intValue];
    if([self AreUserAnswerRight:arg1[GameStep] Arg2:arg2[GameStep] Answer:UserAnswer])
    {
        //Пользователь ответил правильно
        result++;
        [self ShowGameScore:result];
        [self GameLoop];
    }
  
}
-(IBAction)press3Button:(id)sender
{
    NSString *title=_btn3.currentTitle;
    int UserAnswer=[title intValue];
    if([self AreUserAnswerRight:arg1[GameStep] Arg2:arg2[GameStep] Answer:UserAnswer])
    {
        //Пользователь ответил правильно
        result++;
        [self ShowGameScore:result];
        [self GameLoop];
    }

    
    
}
-(IBAction)press4Button:(id)sender
{
    NSString *title=_btn4.currentTitle;
    int UserAnswer=[title intValue];
    if([self AreUserAnswerRight:arg1[GameStep] Arg2:arg2[GameStep] Answer:UserAnswer])
    {
        //Пользователь ответил правильно
        result++;
        [self ShowGameScore:result];
        [self GameLoop];
    }

    
}
-(IBAction)NextQuestion:(id)sender
{
    CGFloat x_position=self.larry.frame.origin.x;
    
    [UIView animateWithDuration:0.5 animations:^(void)
     {
         self.larry.frame=CGRectMake(x_position+320, self.larry.frame.origin.y, self.larry.frame.size.width, self.larry.frame.size.height);
         
     }
                     completion:^(BOOL finished)
     {
         self.larry.frame=CGRectMake(x_position+320, self.larry.frame.origin.y, self.larry.frame.size.width, self.larry.frame.size.height);
         
     }];
    self.btn1.enabled=true;
    self.btn2.enabled=true;
    self.btn3.enabled=true;
    self.btn4.enabled=true;
    
    [self GameLoop];
}
-(void)loadImage
{
    //Поток в которо проигрывается музыкальный файл
    AudioServicesPlaySystemSound(PlaySoundRightAnswer);
}

-(bool) AreUserAnswerRight:(int) argument1 Arg2:(int) argument2 Answer: (int) userAnswer
{
    bool Answer=FALSE;
    int RightAnswer=argument1*argument2;
    if(RightAnswer==userAnswer)
    {
        Answer=TRUE;
        NSOperationQueue *queue=[NSOperationQueue new];
        NSInvocationOperation *operation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loadImage) object:nil];
        [queue addOperation:operation];
        
    }
    else
    {
     CGSize mySize=self.dialogLarry.frame.size;
        CGPoint position=self.dialogLarry.frame.origin;
        self.dialogLarry.frame=CGRectMake(self.dialogLarry.frame.origin.x+200, self.dialogLarry.frame.origin.y+80, mySize.width/10, mySize.height/10);
        self.Next.hidden=YES;
        self.larryMessage.hidden=YES;
        
        CGFloat x_position=self.larry.frame.origin.x;
        self.larry.frame=CGRectMake(x_position, self.larry.frame.origin.y, self.larry.frame.size.width, self.larry.frame.size.height);
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             self.larry.frame=CGRectMake(x_position-320, self.larry.frame.origin.y, self.larry.frame.size.width, self.larry.frame.size.height);
         }
        completion:^(BOOL finished)
         {
             self.larry.frame=CGRectMake(x_position-320, self.larry.frame.origin.y, self.larry.frame.size.width, self.larry.frame.size.height);
             
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  self.dialogLarry.frame=CGRectMake(position.x, position.y, mySize.width, mySize.height);
                  
              }
                              completion:^(BOOL finished)
              {
                   self.dialogLarry.frame=CGRectMake(position.x, position.y, mySize.width, mySize.height);
                  self.Next.hidden=NO;
                  self.larryMessage.hidden=NO;
                  
              }];
         }];
        self.btn1.enabled=FALSE;
         self.btn2.enabled=FALSE;
         self.btn3.enabled=FALSE;
         self.btn4.enabled=FALSE;
        
        AudioServicesPlaySystemSound(PlaySoundWrongAnswer);
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    
    return Answer;
    
}
-(void)OutputExampleToUILable:(int) numberExample
{
    _Example.text=[NSString stringWithFormat:@"%dx%d=?",arg1[numberExample],arg2[numberExample]];
    
    [self GenerateAnswer:numberExample];
    
}
-(int *)GenerateArray
{
    int *Array=malloc(sizeof(int)*10);
    int *ArrayArg2=malloc(sizeof(int)*10);
    
    
    for(int i=1; i<=10; i++)
    {
        Array[i-1]=i; //level
        ArrayArg2[i-1]=i;
    }
    int j=0;
    int wLeft=10;
    for(int i=0; i<10; i++)
    {
        j=arc4random()%wLeft;
        ArrayArg2[i]=Array[j];
        Array[j]=Array[--wLeft];
        
    }
    return ArrayArg2;
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
