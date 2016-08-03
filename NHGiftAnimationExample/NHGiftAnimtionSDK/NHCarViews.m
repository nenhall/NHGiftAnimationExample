//
//  NHCarView.m
//  NHGiftAnimation
//
//  Created by simope on 16/7/8.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NHCarViews.h"
#import "NHHeader.h"

@interface NHCarViews ()

@property (weak, nonatomic) IBOutlet UIImageView *afterWheel;
@property (weak, nonatomic) IBOutlet UIImageView *beforeWheel;
@property (weak, nonatomic) IBOutlet UIImageView *carBackImage;
@property (weak, nonatomic) IBOutlet UIImageView *light;
@property (nonatomic, copy) NSMutableArray *animations;

@end

@implementation NHCarViews

- (NSMutableArray *)animations{

    if (_animations == nil) {
        _animations = [[NSMutableArray alloc] init];
    }
    return _animations;
}

+ (instancetype)loadCarViewWithPoint:(CGPoint)point{
    NHCarViews *car = [[NSBundle mainBundle]loadNibNamed:@"NHCarViews" owner:self options:nil].lastObject;
    car.frame = CGRectMake(point.x, point.y, 166, 70);
    [car setPoints];
    
    [car setPlaneScrewImages:nil];    
    return car;
}


- (instancetype)loadCarViewWithNib:(CGPoint)point{
    NHCarViews *car = [[NSBundle mainBundle]loadNibNamed:@"NHCarViews" owner:self options:nil].lastObject;
    car.frame = CGRectMake(point.x, point.y, 166, 70);
    [car setPoints];
    [car setPlaneScrewImages:nil];
    return car;
}


//- (instancetype)initWithFrame:(CGRect)frame{
//
//    if (self = [super initWithFrame:frame]) {
//       [self addSubview:[self loadCarViewWithNib:frame.origin]];
//    }
//    return self;
//}


//- (void)layoutSubviews{
//    [super layoutSubviews];
//    self.carBackImage.frame = self.bounds;
//    CGSize newSize = self.carBackImage.frame.size;
//    _afterWheel.frame = CGRectMake(2, newSize.height *0.276, newSize.width * 0.0662, newSize.height * 0.314);
//    _beforeWheel.frame = CGRectMake(newSize.width * 0.4337, newSize.height *0.514, newSize.width * 0.132, newSize.height * 0.43);
//    _light.frame = CGRectMake(newSize.width * 0.584, newSize.height *0.072, newSize.width * 0.283, newSize.height * 0.714);
//}


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
    position.duration = _positionDuration;
    position.speed = _positionSpeed;
    position.removedOnCompletion = _removedOnCompletion;
    position.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = _scaleDuration;
    scaleAnimation.beginTime = _beginScaleTime;
    scaleAnimation.fromValue = _scaleFromValue;
    scaleAnimation.toValue = _scaleToValue;
    scaleAnimation.removedOnCompletion = _removedOnCompletion;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 7.f;
    animationGroup.removedOnCompletion = _removedOnCompletion;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.delegate = self;
    animationGroup.animations = @[position,scaleAnimation];
    
    if (self.animations.count == 0) {
        NSLog(@"第一次动画%ld",self.animations.count);
        [self.animations addObject:animationGroup];
        [self.layer addAnimation:animationGroup forKey:@"carView"];
    }else{
        [self.animations addObject:animationGroup];
        NSLog(@"添加动画");
    }
}


- (void)setPlaneScrewImages:(NSArray *)imageArray{
    
    NSMutableArray* after = [NSMutableArray array];
    for(int i = 1;i<4;i++){
        [after addObject: [UIImage imageNamed:[NSString stringWithFormat:SUB_RESOURCE,@"porche-f",i]]];
    }
    _afterWheel.animationImages = after;
    _afterWheel.animationDuration = 0.05;
    _afterWheel.animationRepeatCount = 0;
    [_afterWheel startAnimating];
    
    NSMutableArray* before = [NSMutableArray array];
    for(int i = 1;i<4;i++){
        [before addObject: [UIImage imageNamed:[NSString stringWithFormat:SUB_RESOURCE,@"porche-b",i]]];
    }
    _beforeWheel.animationImages = before;
    _beforeWheel.animationDuration = 0.05;
    _beforeWheel.animationRepeatCount = 0;
    [_beforeWheel startAnimating];
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
    
    NSLog(@"删除动画");
//    [self.animations removeObjectAtIndex:0];
    
    if (self.animations.count > 0) {
//        [self.layer addAnimation:self.animations[0] forKey:@"carView"];
    }else{
    
        
    }
}


- (void)setPoints{
    _scaleDuration = 1.2;
    _positionDuration = 4.0;
    _positionSpeed = 0.7;
    _beginScaleTime = 0.f;
    _scaleToValue = [NSNumber numberWithFloat:2.0];
    _scaleFromValue = [NSNumber numberWithFloat:0.7];
    
    NSMutableArray *pointArrs = [[NSMutableArray alloc] init];
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 2;
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(width, 300, width, 300))];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(width, 300, width, 300))];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(width, 300, width, 300))];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(width, 300, width, 300))];
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(width, 300, width, 300))];
    self.curveControlAndEndPoints = pointArrs;
}

- (void)setBeginScaleTime:(CGFloat)beginScaleTime{
    _beginScaleTime = beginScaleTime;
}

- (void)setPositionSpeed:(CGFloat)positionSpeed{
    _positionSpeed = positionSpeed;
}

- (void)setPositionDuration:(CGFloat)positionDuration{
    _positionDuration = positionDuration;
}

- (void)setScaleSpeed:(CGFloat)scaleSpeed{
    _scaleSpeed = scaleSpeed;
}

- (void)setScaleDuration:(CGFloat)scaleDuration{
    _scaleDuration = scaleDuration;
}



@end
