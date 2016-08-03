//
//  NHPlaneView.m
//  NHGiftAnimation
//
//  Created by simope on 16/7/8.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NHPlaneViews.h"
#import "NHHeader.h"

@interface NHPlaneViews ()
@property (nonatomic, strong) UIImageView *planeWing;
@property (weak, nonatomic) IBOutlet UIImageView *planeScrew;

@end

@implementation NHPlaneViews

+ (instancetype)loadPlaneViewWithPoint:(CGPoint)point{
    NHPlaneViews *plane = [[NSBundle mainBundle]loadNibNamed:@"NHPlaneViews" owner:self options:nil].lastObject;
    plane.frame = CGRectMake(point.x, point.y, 232, 92);
    [plane setPoints];
    [plane setPlaneScrewImages:nil];
    return plane;
}


- (void)addAnimationsMoveToPoint:(CGPoint)movePoints endPoint:(CGPoint)endPoint{
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, movePoints.x, movePoints.y);
    
    [self.curveControlAndEndPoints enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect rect = CGRectFromString(obj);
        CGPathAddQuadCurveToPoint(path, NULL, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    }];
    
    CGPathAddQuadCurveToPoint(path, NULL, endPoint.x, endPoint.y, endPoint.x, endPoint.y);
    position.path = path;
    position.duration = 4.f;
    position.speed = 0.6;
    position.removedOnCompletion = NO;
    position.fillMode = kCAFillModeForwards;
    position.calculationMode = kCAAnimationCubicPaced;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.duration = 1.0;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 7.f;
    animationGroup.delegate = self;
    animationGroup.autoreverses = NO;
    animationGroup.repeatCount = 0;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.animations = @[scaleAnimation,position];
    [self.layer addAnimation:animationGroup forKey:@"planeViews"];
}


- (void)setPlaneScrewImages:(NSArray *)imageArray{
    NSMutableArray* images = [NSMutableArray array];
    for(int i = 1;i<4;i++){
        [images addObject: [UIImage imageNamed:[NSString stringWithFormat:SUB_RESOURCE,@"plane-screw-4-",i]]];
    }
    _planeScrew.animationImages = images;
    _planeScrew.animationDuration = 0.05;
    _planeScrew.animationRepeatCount = 0;
    [_planeScrew startAnimating];
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}


- (void)addAnimations{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:RESOURCE,@"plane-flower-2"]]];
    NSInteger range = _planeScrew.bounds.size.width + 80;
    NSInteger startX = round(random() %range);
    NSInteger endX = round(random() % range);
    
    double scele = 1 / round(random() % 100) + 1.0;
//    double speed = 1 / round(random() % 100) + 1.0;
    //_plane.bounds.size.width / 2 +70, CGRectGetMaxY(_plane.frame)+50
    imageView.frame = CGRectMake( startX, CGRectGetMaxY(_planeScrew.frame)-30, scele * 60, scele * 60);
    [self addSubview:imageView];
    
    
    [UIView beginAnimations:@"flake" context:(__bridge void*)(imageView)];
    
    [UIView setAnimationDuration:3];
    [UIView setAnimationRepeatCount:8];
    imageView.frame = CGRectMake(endX, NHBounds.height - 20, scele * 70, scele * 70);
    
    [UIView commitAnimations];
}

- (void)setPoints{
    _scaleToValue = [NSNumber numberWithFloat:2.0];
    _scaleFromValue = [NSNumber numberWithFloat:0.7];
    
    NSMutableArray *pointArrs = [[NSMutableArray alloc] init];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(290, 250, 290, 250))];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(290, 250, 290, 250))];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(290, 250, 290, 250))];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(290, 250, 290, 250))];
    self.curveControlAndEndPoints = pointArrs;
}


@end
