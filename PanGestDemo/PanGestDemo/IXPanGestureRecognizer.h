//
//  IXPanGestureRecognizer.h
//  IXSDK
//
//  Created by Seven on 2018/5/14.
//  Copyright © 2018年 IX CAPITAL MARKETS(HK) LIMITED. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IXPanGestureRecognizer : UIPanGestureRecognizer

/**
 是否自动锁住手势方向，默认为NO
 如果设置成YES，则在手势开始时根据xy的偏移量大小来确定最可能的滑动方向，并在手势有效期内保持这个方向上的有效性
 */
@property (nonatomic, assign) BOOL  autoLock;

@end
