//
//  MPTransation.h
//  ModernDemo
//
//  Created by 周晓瑞 on 2017/8/2.
//  Copyright © 2017年 colleny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MPTransitionStyleNone = 0,
     MPTransitionStyleFromUpToDown = 1,
    MPTransitionStyleBoundsGradient = 2,
    MPTransitionStyleFromLeftTRight = 3,
    MPTransitionStyleBoundsOther = 100,
} MPModalTransitionStyle;

@interface MPTransation : NSObject
<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>

@property(nonatomic,assign,readwrite)MPModalTransitionStyle  z_modalTransStyle;

@end
