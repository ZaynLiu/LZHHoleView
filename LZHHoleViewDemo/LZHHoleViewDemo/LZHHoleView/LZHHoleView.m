//
//  LZHHoleView.m
//  LZHHoleViewDemo
//
//  Created by ZhenHui on 2017/3/2.
//  Copyright © 2017年 ZhenHui Liu. All rights reserved.
//

#import "LZHHoleView.h"

@interface LZHHole : NSObject
@property (assign, nonatomic) CGPoint centerPoint;
@property (assign, nonatomic) CGFloat fRadius;
@end

@implementation LZHHole
@end

@interface LZHHoleView ()
@property (strong, nonatomic) NSMutableArray *arrHoles;
@property (strong, nonatomic) UIColor *colorOverlay;
@end

@implementation LZHHoleView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self basicConfiguration];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self basicConfiguration];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self basicConfiguration];
    }
    return self;
}

- (void)basicConfiguration {
    _arrHoles = [NSMutableArray array];
    self.backgroundColor = [UIColor clearColor];
    _colorOverlay = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
}

#pragma mark - Public Method
- (void)addHoleWithCenter:(CGPoint)centerPoint radius:(CGFloat)fRadius {
    LZHHole *hole = [[LZHHole alloc] init];
    hole.centerPoint = centerPoint;
    hole.fRadius = fRadius;
    [_arrHoles addObject:hole];
    [self setNeedsDisplay];
}

#pragma mark - Drawing
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == nil) {
        return;
    }
    
    [self.colorOverlay setFill];
    UIRectFill(rect);
    
    for (LZHHole *hole in self.arrHoles) {
        [[UIColor clearColor] setFill];
        CGRect rectInView = CGRectMake((hole.centerPoint.x - hole.fRadius),
                                       (hole.centerPoint.y - hole.fRadius),
                                       hole.fRadius * 2,
                                       hole.fRadius * 2);
        CGContextSetFillColorWithColor( context, [UIColor clearColor].CGColor );
        CGContextSetBlendMode(context, kCGBlendModeClear);
        CGContextFillEllipseInRect( context, rectInView );
    }
}

#pragma mark - Accessor
- (void)setColorOverlay:(UIColor *)colorOverlay {
    _colorOverlay = colorOverlay;
    [self setNeedsDisplay];
}

@end
