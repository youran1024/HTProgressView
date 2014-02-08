//
//  HTProgressView.m
//  HTProgressView
//
//  Created by Mr.Yang on 14-1-17.
//  Copyright (c) 2014年 MoonLightCompany. All rights reserved.
//

#import "HTProgressView.h"
#import <QuartzCore/QuartzCore.h>

@interface HTProgressView ()
@property (nonatomic, strong)   UIView *imageView;


@end

@implementation HTProgressView

- (id)initWithImage:(UIImage *)image{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        CGRect rect = self.frame;
        rect.size = image.size;
        self.frame = rect;
        _increaseDirection = IncreaseDirectionLeft;
        _imageView = [[UIView alloc] initWithFrame:rect];
        _imageView.layer.contents = (id)image.CGImage;
        self.layer.mask = _imageView.layer;
    }
    
    return self;
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGFloat width = CGRectGetWidth(rect) * _progress;
    CGFloat height = CGRectGetHeight(rect) * _progress;
    
    if (_increaseDirection & IncreaseDirectionTop) {
        rect.size.height = height;
    }else if (_increaseDirection & IncreaseDirectionBottom) {
         rect.origin.y = CGRectGetHeight(rect) - height;
        rect.size.height = height;
    }
    if (_increaseDirection & IncreaseDirectionLeft) {
        rect.size.width = width;
    }else if (_increaseDirection & IncreaseDirectionRight) {
        rect.origin.x = CGRectGetWidth(rect) - width;
        rect.size.width = width;
    }
    
    CGContextSetFillColorWithColor(ref, _drawColor.CGColor);
    CGContextFillRect(ref, rect);
}


@end
