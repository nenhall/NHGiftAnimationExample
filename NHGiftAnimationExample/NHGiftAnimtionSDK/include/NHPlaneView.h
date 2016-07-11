//
//  NHPlaneView.h
//  NHGiftAnimation
//
//  Created by simope on 16/7/8.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHPlaneView : UIView


/**
 *  需要几个控制点就设置几个；
 *  注意：曲线的控制点和结束点需要一一对应，即curve_control_point_a 对 curve_end_point_a
 CGPoint.x的值不能设置成:999.9,否则无效
 *  传了curve_control_point_a 就必须传 curve_end_point_a
 */
@property (nonatomic, assign) CGPoint curve_control_point_a;
@property (nonatomic, assign) CGPoint curve_control_point_b;
@property (nonatomic, assign) CGPoint curve_control_point_c;
@property (nonatomic, assign) CGPoint curve_control_point_d;
@property (nonatomic, assign) CGPoint curve_control_point_e;
@property (nonatomic, assign) CGPoint curve_control_point_f;
@property (nonatomic, assign) CGPoint curve_control_point_g;

@property (nonatomic, assign) CGPoint curve_end_point_a;
@property (nonatomic, assign) CGPoint curve_end_point_b;
@property (nonatomic, assign) CGPoint curve_end_point_c;
@property (nonatomic, assign) CGPoint curve_end_point_d;
@property (nonatomic, assign) CGPoint curve_end_point_e;
@property (nonatomic, assign) CGPoint curve_end_point_f;
@property (nonatomic, assign) CGPoint curve_end_point_g;


/**
 *  动画结束后动画层是否从当前视图上移除，默认 NO
 */
@property (nonatomic, assign) BOOL removedOnCompletion;

/**
 *  从(from)scale 到(to)scale 默认0.7 - 2.0
 */

@property (nullable, strong) id scaleFromValue;
@property (nullable, strong) id scaleToValue;


/**
 *  加载动画视图
 *
 *  @param frame 动画视图的大小
 *
 *  @return 返回你需要的动画视图
 */
+ (nullable instancetype)loadPlaneViewWithPoint:(CGPoint)point;


/**
 *  设置动画的运行轨迹
 *  注：调此方法前，如需要设置多于两个控制点的动画，请先设置好curve_control_point_*及curve_end_point_*位置
 其它属性也是一样，在调此方法前设置好
 *  @param movePoints 开始的位置(出发点)
 *  @param endPoint   最终动画所在停留的位置
 */
- (void)addAnimationsMoveToPoint:(CGPoint)movePoints endPoint:(CGPoint)endPoint;

@end
