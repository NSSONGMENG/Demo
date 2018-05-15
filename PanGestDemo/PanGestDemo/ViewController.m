//
//  ViewController.m
//  PanGestDemo
//
//  Created by Seven on 2018/5/15.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "ViewController.h"
#import "IXPanGestureRecognizer.h"

@interface ViewController ()
@property (nonatomic, strong) UIView    * panV1;
@property (nonatomic, strong) UIView    * panV2;

@property (nonatomic, strong) UIBezierPath  * bezirePath;
@property (nonatomic, strong) CAShapeLayer  * shapedLay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView    * scrollV = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollV.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 100);
    scrollV.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scrollV];
    
    
    //UIPanGestureRecognizer
    _panV1 = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 150)];
    _panV1.backgroundColor = [UIColor orangeColor];
    _panV1.layer.masksToBounds = YES;
    [scrollV addSubview:_panV1];
    
    UILabel * lab1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 300, 15)];
    lab1.font = [UIFont systemFontOfSize:12];
    lab1.text = @"UIPanGestureRecognizer";
    [scrollV addSubview:lab1];
    
    UIPanGestureRecognizer  * sysPan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(panAction:)];
    [_panV1 addGestureRecognizer:sysPan];
    
    
    //IXPanGestureRecognizer
    _panV2 = [[UIView alloc] initWithFrame:CGRectMake(0, 350, self.view.frame.size.width, 150)];
    _panV2.backgroundColor = [UIColor whiteColor];
    _panV2.layer.masksToBounds = YES;
    [scrollV addSubview:_panV2];
    
    UILabel * lab2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 300, 15)];
    lab2.font = [UIFont systemFontOfSize:12];
    lab2.text = @"IXPanGestureRecognizer";
    [scrollV addSubview:lab2];
    
    IXPanGestureRecognizer  * ixPan = [[IXPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(panAction:)];
    ixPan.autoLock = YES;
    [_panV2 addGestureRecognizer:ixPan];
    
    UILabel * lab3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 370, 200, 20)];
    lab3.text = ixPan.autoLock ? @"Direction Auto Lock : Enable" : @"Direction Auto Lock : UnEnable";
    lab3.font = [UIFont systemFontOfSize:10];
    [scrollV addSubview:lab3];
}


- (void)panAction:(UIGestureRecognizer *)gest
{
    UIView * targetV = gest.view;
    CGPoint p = [gest locationInView:targetV];
    
    switch (gest.state) {
        case UIGestureRecognizerStateBegan:{
            if (!_bezirePath) {
                _bezirePath = [UIBezierPath bezierPath];
            } else {
                [_bezirePath removeAllPoints];
            }
            
            [_bezirePath moveToPoint:p];
            [targetV.layer addSublayer:self.shapedLay];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            [_bezirePath addLineToPoint:p];
            [self.shapedLay setPath:_bezirePath.CGPath];
            break;
        }
        default:{
            [_bezirePath removeAllPoints];
            [self.shapedLay setPath:_bezirePath.CGPath];
            break;
        }
    }
}

- (CAShapeLayer *)shapedLay
{
    if (!_shapedLay) {
        _shapedLay = [CAShapeLayer layer];
        _shapedLay.lineWidth = 2.f;
        _shapedLay.strokeColor = [UIColor redColor].CGColor;
        _shapedLay.fillColor = [UIColor clearColor].CGColor;
    }
    return _shapedLay;
}


@end
