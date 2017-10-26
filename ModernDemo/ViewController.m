//
//  ViewController.m
//  ModernDemo
//
//  Created by 周晓瑞 on 2017/8/2.
//  Copyright © 2017年 colleny. All rights reserved.
//

#import "ViewController.h"
#import "MPSecondViewController.h"
#import "MPTransation.h"

@interface ViewController ()
@property(nonatomic,strong)MPTransation * moderTransation;
@end

@implementation ViewController


- (MPTransation *)moderTransation{
    if (_moderTransation == nil) {
        _moderTransation =  [[MPTransation alloc]init];
    }
    return _moderTransation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MPSecondViewController * secondVC = [[MPSecondViewController alloc]init];
    secondVC.modalPresentationStyle = UIModalPresentationCustom;
    secondVC.transitioningDelegate = self.moderTransation;
    self.moderTransation.z_modalTransStyle = MPTransitionStyleBoundsGradient ;
    [self presentViewController:secondVC animated:YES completion:nil];
}


@end
