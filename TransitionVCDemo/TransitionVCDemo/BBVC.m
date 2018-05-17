//
//  BBVC.m
//  TransitionVCDemo
//
//  Created by Seven on 2018/5/17.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "BBVC.h"

@interface BBVC ()

@end

@implementation BBVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, 100, 200, 30)];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"翻转至AAVC" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"transitionToA" object:nil];
}

@end
