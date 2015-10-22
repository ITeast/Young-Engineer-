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
- (void)viewDidLoad  {
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    //**************************************
    //Генерирование массива аргументов
    arg2=malloc(sizeof(int)*10);
    arg2=[self GenerateArray];
    for (int i=1; i<=10; i++)
    {
        arg1[i-1]=2;
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
    _score.text=@"всего решено 0/10";
    
    if([self AreUserAnswerRight:1 arg2:1 answer:2])
        {
            NSLog(@"Ответ правильный");
        }
        else
        {
            NSLog(@"ответ неправильный");
        }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
-(IBAction)press1Button:(id)sender
{
    UIAlertView *MessageError;
    MessageError=[[UIAlertView alloc] initWithTitle:@""
                                            message:@"Ответ не правильный"
                                           delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
    [MessageError show];
    
}
-(IBAction)press2Button:(id)sender
{
    UIAlertView *MessageError;
    MessageError=[[UIAlertView alloc] initWithTitle:@""
                                            message:@"Ответ не правильный"
                                           delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
    [MessageError show];
}
-(IBAction)press3Button:(id)sender
{
    UIAlertView *MessageError;
    MessageError=[[UIAlertView alloc] initWithTitle:@""
                                            message:@"Ответ правильный"
                                           delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
    result++;
    _score.text= [NSString stringWithFormat:@"всего решено %d/10",result];
    [MessageError show];
}
-(IBAction)press4Button:(id)sender
{
    UIAlertView *MessageError;
    MessageError=[[UIAlertView alloc] initWithTitle:@""
                                            message:@"Ответ не правильный"
                                           delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
    [MessageError show];
}

-(bool) AreUserAnswerRight:(int) argument1 Arg2:(int) argument2 Answer: (int) userAnswer
{
    bool Answer=FALSE;
    int RightAnswer=argument1*argument2;
    if(RightAnswer==userAnswer)
    {
        Answer=TRUE;
    }
    
    return Answer;
    
}
-(void)OutputExampleToUILable:(int) numberExample
{
    _Example.text=[NSString stringWithFormat:@"%dx%d=?",arg1[numberExample],arg2[numberExample]];
    
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
