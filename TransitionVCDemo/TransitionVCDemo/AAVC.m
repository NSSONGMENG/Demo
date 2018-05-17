//
//  AAVC.m
//  TransitionVCDemo
//
//  Created by Seven on 2018/5/17.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "AAVC.h"

@interface AAVC ()

@end

@implementation AAVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, 100, 200, 30)];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"翻转至BBVC" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"transitionToB" object:nil];
}



@end
