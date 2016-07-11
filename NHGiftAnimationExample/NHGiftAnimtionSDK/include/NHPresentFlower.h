//
//  NHPresentFlower.h
//  NHGiftAnimation
//
//  Created by simope on 16/7/8.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NHSendEffect) {

    NHSendEffectSpring,
    NHSendEffectShake,
    NHSendEffectNormal,
};

@interface NHPresentFlower : UIView

/**
 *  在没人送花后自动隐藏的时间
 */
@property (nonatomic, assign) NSInteger autoHiddenTime;

/**
 *  动画显示效果
 */
@property (nonatomic, assign) NHSendEffect effect;

/**
 *  花朵数的显示倍数大小
 */
@property (nonatomic, copy) NSArray<id> *scaleValue;

/**
 *  动画时间，有默认值
 */
@property (nonatomic, assign) CGFloat duration;

/**
 *  动画速度，有默认值
 */
@property (nonatomic, assign) CGFloat speed;

/**
 *  阻尼，有默认值
 */
@property (nonatomic, assign) CGFloat spring;


/**
 *  加载view
 *
 *  @param frame  frame
 *  @param effect  动画显示效果
 */
- ( instancetype)initWithFrame:(CGRect)frame presentFlowerEffect:(NHSendEffect)effect;

/**
 *  继续送花
 */
- (void)continuePresentFlowers;

@end
