//
//  IXPanGestureRecognizer.m
//  IXSDK
//
//  Created by Seven on 2018/5/14.
//  Copyright © 2018年 IX CAPITAL MARKETS(HK) LIMITED. All rights reserved.
//

#import "IXPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

int const static kDirectionPanThreshold = 5;
typedef NS_ENUM(NSInteger, IXPanDirection) {
    IXPanDirectionAny = 0,
    IXPanDirectionHor,
    IXPanDirectionVer
};

@interface IXPanGestureRecognizer()

@property (nonatomic, assign) IXPanDirection    direction;
@property (nonatomic, assign) CGPoint   beginP;

@end

@implementation IXPanGestureRecognizer

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (_autoLock) {
        _direction = IXPanDirectionAny;
        _beginP = [[touches anyObject] locationInView:self.view];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    if (!_autoLock && _direction != IXPanDirectionAny) return;
    
    CGPoint nowPoint = [[touches anyObject] locationInView:self.view];
    if (_direction == IXPanDirectionAny) {
        if (fabs(nowPoint.x - _beginP.x) > fabs(nowPoint.y - _beginP.y)) {
            _direction = IXPanDirectionHor;
        } else {
            _direction = IXPanDirectionVer;
            self.state = UIGestureRecognizerStateFailed;
        }
    }
}

@end
