//
//  NHCarView.h
//  NHGiftAnimation
//
//  Created by simope on 16/7/8.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHCarViews : UIView
/**
 *  需要几个控制点就设置几个:
 *  数组内的每个元素代码一个控制点和结束点
 *  数组中放CGRect数据，CGRect的x和y分别作为控制点的x和y，CGRect的width和height作为结束点的x和y
 */
@property (nullable, nonatomic, copy) NSArray *curveControlAndEndPoints;

/**
 *  动画结束后动画层是否从当前视图上移除，默认 NO
 */
@property (nonatomic, assign) BOOL removedOnCompletion;

/**
 *  放大倍数：从(from)scale 到(to)scale 默认0.7 - 2.0
 */

@property (nullable, strong) id scaleFromValue;
@property (nullable, strong) id scaleToValue;

/**
 *  动画时间，有默认值
 */
@property (nonatomic, assign) CGFloat positionDuration;

/**
 *  动画scale时间，有默认值
 */
@property (nonatomic, assign) CGFloat scaleDuration;

/**
 *  move速度，有默认值
 */
@property (nonatomic, assign) CGFloat positionSpeed;

/**
 *  scale速度，有默认值
 */
@property (nonatomic, assign) CGFloat scaleSpeed;

/**
 *  开始scale时间
 */
@property (nonatomic, assign) CGFloat beginScaleTime;

/**
 *  加载动画视图
 *
 *  @param frame 动画视图的大小
 *
 *  @return 返回你需要的动画视图
 */
+ (nullable instancetype)loadCarViewWithPoint:(CGPoint)point;


/**
 *  设置动画的运行轨迹
 *  注：调此方法前，如需要设置多于两个控制点的动画，请先设置好curve_control_point_*及curve_end_point_*位置
 其它属性也是一样，在调此方法前设置好
 *  @param movePoints 开始的位置(出发点)
 *  @param endPoint   最终动画所在停留的位置
 */
- (void)addAnimationsMoveToPoint:(CGPoint)movePoints endPoint:(CGPoint)endPoint;


@end
