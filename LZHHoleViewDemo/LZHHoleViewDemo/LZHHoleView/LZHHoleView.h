//
//  LZHHoleView.h
//  LZHHoleViewDemo
//
//  Created by ZhenHui on 2017/3/2.
//  Copyright © 2017年 ZhenHui Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZHHoleView : UIView

/**
 Add a hole at some position

 @param centerPoint The center point of hole
 @param fRadius The radius of hole
 */
- (void)addHoleWithCenter:(CGPoint)centerPoint radius:(CGFloat)fRadius;
@end
