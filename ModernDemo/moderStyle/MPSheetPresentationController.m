//
//  MPSheetPresentationController.m
//  ModernDemo
//
//  Created by 周晓瑞 on 2017/8/2.
//  Copyright © 2017年 colleny. All rights reserved.
//

#import "MPSheetPresentationController.h"

@implementation MPSheetPresentationController
/*
- (CGRect)frameOfPresentedViewInContainerView{
    return  CGRectInset(self.containerView.bounds, 10, 50);
}
*/
- (void)presentationTransitionWillBegin{
   // NSLog(@"presentationTransitionWillBegin");
    [self.containerView addSubview:self.presentedView];
}
- (void)presentationTransitionDidEnd:(BOOL)completed{
  //   NSLog(@"presentationTransitionDidEnd");
}
- (void)dismissalTransitionWillBegin{
  //  NSLog(@"dismissalTransitionWillBegin");
}
- (void)dismissalTransitionDidEnd:(BOOL)completed{
 //   NSLog(@"dismissalTransitionDidEnd");
    [self.presentedView removeFromSuperview];
}


@end
