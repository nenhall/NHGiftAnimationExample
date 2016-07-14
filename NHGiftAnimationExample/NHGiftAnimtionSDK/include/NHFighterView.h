//
//  NHFighterView.h
//  NHGiftAnimation
//
//  Created by simope on 16/7/8.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHFighterView : UIView

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
 *  从(from)scale 到(to)scale 默认0.7 - 2.0
 */
@property (nullable, strong) id scaleFromValue;
@property (nullable, strong) id scaleToValue;


/**
 *  以下粒子效果的参数，都有默认值
 */
//粒子发射源的尺寸大
@property (nonatomic, assign) CGSize grainSize;

//发射位置
@property (nonatomic, assign) CGPoint grainPosition;

//粒子生命周期
@property (nonatomic, assign)CGFloat grainLifetime;

//粒子产生速度
@property (nonatomic, assign) CGFloat grainVelocity;

//粒子产生速度范围
@property (nonatomic, assign) CGFloat grainVelocityRange;

//粒子速度
@property (nonatomic, assign) CGFloat grainSpeed;

//粒子速度乘数因子
@property (nonatomic, assign) float grainBirthRate;

//粒子图片
@property (nullable ,nonatomic, strong) UIImage *grainImage;

/**
 *  加载动画视图
 *
 *  @param frame 动画视图的大小
 *
 *  @return 返回你需要的动画视图
 */
+ (nullable instancetype)loadFighterViewWithPoint:(CGPoint)point;


/**
 *  设置动画的运行轨迹
 *  注：调此方法前，如需要设置多于两个控制点的动画，请先设置好curve_control_point_*及curve_end_point_*位置
 其它属性也是一样，在调此方法前设置好
 *  @param movePoints 开始的位置(出发点)
 *  @param endPoint   最终动画所在停留的位置
 */
- (void)addAnimationsMoveToPoint:(CGPoint)movePoints endPoint:(CGPoint)endPoint;


@end
