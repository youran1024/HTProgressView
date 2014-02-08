//
//  HTProgressView.h
//  HTProgressView
//
//  Created by Mr.Yang on 14-1-17.
//  Copyright (c) 2014年 MoonLightCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, IncreaseDirection){
    IncreaseDirectionLeft =     1 << 1,
    IncreaseDirectionRight =    1 << 2,
    IncreaseDirectionTop =      1 << 3,
    IncreaseDirectionBottom =   1 << 4,
};

@interface HTProgressView : UIView
@property (nonatomic, strong)   UIColor *drawColor;
@property (nonatomic, assign)   float progress;
@property (nonatomic, assign)   IncreaseDirection increaseDirection;

- (id)initWithImage:(UIImage *)image;
@end
