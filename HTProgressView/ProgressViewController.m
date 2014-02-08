//
//  ProgressViewController.m
//  HTProgressView
//
//  Created by Mr.Yang on 14-1-17.
//  Copyright (c) 2014年 MoonLightCompany. All rights reserved.
//

#import "ProgressViewController.h"
#import "HTProgressView.h"

@interface ProgressViewController ()
@property (nonatomic, strong) HTProgressView *view1;
@property (nonatomic, strong)  HTProgressView *view2;
@property (nonatomic, strong)   HTProgressView *view3;
@end

@implementation ProgressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _view1 = [[HTProgressView alloc] initWithImage:[UIImage imageNamed:@"12"]];
    _view1.drawColor = [UIColor orangeColor];
    _view1.increaseDirection = IncreaseDirectionTop | IncreaseDirectionRight;
    [self.view addSubview:_view1];
    CGRect rect = _view1.frame;
    rect.origin.x = 100;
    rect.origin.y = 100;
    _view1.frame = rect;
    
    
    _view2 = [[HTProgressView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    _view2.drawColor = [UIColor redColor];
    _view2.increaseDirection = IncreaseDirectionTop;
    [self.view addSubview:_view2];
    rect = _view2.frame;
    rect.origin.x = 100;
    rect.origin.y = 200;
    _view2.frame= rect;
    
    
    _view3 = [[HTProgressView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    _view3.drawColor = [UIColor redColor];
    _view3.increaseDirection = IncreaseDirectionLeft;
    [self.view addSubview:_view3];
    rect = _view3.frame;
    rect.origin.x = 100;
    rect.origin.y = 300;
    _view3.frame = rect;
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(timeRun:) userInfo:nil repeats:YES];
}

- (void)timeRun:(NSTimer *)timer
{
    static float i = 0;
    if (i > 1) {
        i = 0;
    }

    _view1.progress = i;
    _view2.progress = i;
    _view3.progress = i;
    i = i + .1;
}


@end
