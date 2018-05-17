//
//  MasterVC.m
//  TransitionVCDemo
//
//  Created by Seven on 2018/5/17.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "MasterVC.h"
#import "AAVC.h"
#import "BBVC.h"

@interface MasterVC ()
@property (nonatomic, strong) AAVC  * aa;
@property (nonatomic, strong) BBVC  * bb;
@end

@implementation MasterVC

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, 100, 200, 30)];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"show AAVC" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(transitionToB)
                                                 name:@"transitionToB"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(transitionToA)
                                                 name:@"transitionToA"
                                               object:nil];
}

- (void)btnAction
{
    self.aa.view.alpha = 0.f;
    
    [self addChildViewController:self.aa];
    [self.aa didMoveToParentViewController:self];
    
    [self.view addSubview:self.aa.view];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.aa.view.alpha = 1.f;
    }];
}


- (void)transitionToB
{
    [self addChildViewController:self.bb];
    [self.bb didMoveToParentViewController:self];
    
    [self transitionFromViewController:_aa
                      toViewController:_bb
                              duration:0.5
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:nil
                            completion:^(BOOL finished) {
                                [self.aa willMoveToParentViewController:nil];
                                [self.aa removeFromParentViewController];
                            }];
}

- (void)transitionToA
{
    [self addChildViewController:self.aa];
    [self.aa didMoveToParentViewController:self];
    
    [self transitionFromViewController:self.bb
                      toViewController:self.aa
                              duration:0.5
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            animations:nil
                            completion:^(BOOL finished) {
                                [self.bb willMoveToParentViewController:nil];
                                [self.bb removeFromParentViewController];
                            }];
}


#pragma mark -
#pragma mark - lazy loading

- (AAVC *)aa
{
    if (!_aa) {
        _aa = [AAVC new];
    }
    return _aa;
}

- (BBVC *)bb
{
    if (!_bb) {
        _bb = [BBVC new];
    }
    return _bb;
}

@end
