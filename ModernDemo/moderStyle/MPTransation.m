//
//  MPTransation.m
//  ModernDemo
//
//  Created by 周晓瑞 on 2017/8/2.
//  Copyright © 2017年 colleny. All rights reserved.
//

#import "MPTransation.h"
#import "UIView+Frame.h"
#import "MPSheetPresentationController.h"

const  NSTimeInterval   kAnimationDuration  = 0.25f;

@interface MPTransation()

@property(nonatomic,assign)BOOL isPresend;

@end


@implementation MPTransation

- (instancetype)init{
    if (self = [super init]) {
        self.z_modalTransStyle = MPTransitionStyleNone;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return kAnimationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (self.isPresend) {
        switch (self.z_modalTransStyle) {
            case MPTransitionStyleNone:
                [self animationUpToDownTransition:transitionContext];
                break;
            case MPTransitionStyleFromUpToDown:
                [self animationUpToDownTransition:transitionContext];
                break;
            case MPTransitionStyleBoundsGradient:
                [self animationFromBoundsSmaToBigTransition:transitionContext];
                break;
            case MPTransitionStyleFromLeftTRight:
                [self animationFromLeftToRightTransition:transitionContext];
                break;
            case MPTransitionStyleBoundsOther:
                    #ifdef DEBUG
                        NSLog(@"custom");
                    #endif
                break;
            default:
                break;
        }
    }else{
        switch (self.z_modalTransStyle) {
            case MPTransitionStyleNone:
                [self animationDownToUpTransition:transitionContext];
                break;
            case MPTransitionStyleFromUpToDown:
                [self animationDownToUpTransition:transitionContext];
                break;
            case MPTransitionStyleBoundsGradient:
                [self animationFromBoundsBigToSmaTransition:transitionContext];
                break;
            case MPTransitionStyleFromLeftTRight:
                [self animationFromRightToLeftTransition:transitionContext];
                break;
            case MPTransitionStyleBoundsOther:
                #ifdef DEBUG
                    NSLog(@"custom");
                #endif
                break;
            default:
                break;
        }
    }
}


- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source{
    MPSheetPresentationController * presentVC = [[MPSheetPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    return presentVC;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.isPresend = YES;
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.isPresend = NO;
    return self;
}

- (void)setZ_modalTransStyle:(MPModalTransitionStyle)z_modalTransStyle{
    _z_modalTransStyle = z_modalTransStyle;
}

#pragma mark - CustomAnimation
- (void)animationUpToDownTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.y = - toView.height;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       toView.y = 0.0f;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationDownToUpTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
     fromView.y = 0.0f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
     fromView.y = - fromView.height;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


- (void)animationFromLeftToRightTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
     toView.x = - toView.width;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.x = 0.0f;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationFromRightToLeftTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
     fromView.x = 0.0f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.x = - fromView.width;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationFromBoundsSmaToBigTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * consView =  transitionContext.containerView;
    toView.bounds = CGRectZero;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.bounds = consView.bounds;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationFromBoundsBigToSmaTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.bounds = CGRectZero;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}






@end
