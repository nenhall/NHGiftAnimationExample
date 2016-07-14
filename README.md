# NHGiftAnimationExample
直播类送礼动画<豪华礼物+小礼物>：
代码会持续更新，现直播的app里内有太多的动画，由于时间关系不能一次共享所有动画聘为，这次先共享几个比较火爆的动画，支持真机和模拟器上运行，最低支持iOS8.0，具体的代码属性，代码中都有注释，有疑问之处可以联系本博主：NegHao，有不足之处，或者错误的地方欢迎指正，谢谢！

 ![Aaron Swartz](https://github.com/NegHao/NHGiftAnimationExample/blob/master/NHGift.gif)


NHCarView *car = [NHCarView loadCarViewWithPoint:CGPointZero];

//方法如下：数组内的每个元素代码一个控制点和结束点
NSMutableArray *pointArrs = [[NSMutableArray alloc] init];
CGFloat width = [UIScreen mainScreen].bounds.size.width / 2;
[pointArrs addObject:NSStringFromCGRect(CGRectMake(width, 300, width, 300))];
 car.curveControlAndEndPoints = pointArrs;

[car addAnimationsMoveToPoint:CGPointMake(0, 100) endPoint:CGPointMake(self.view.bounds.size.width +166, 500)];
[self.view addSubview:car];


若你想换动画图片，直接去resource.bundle文件夹里面找到相应图片，把你的新图片替换上，
但你的图片名记得换成我原有图片名；
图片的尺寸需要和原图片的尺寸一样，如果不一样，则影响动画的效果。
//
//  
//  NegHao
//
//  Created by NegHao on 16/5/14.
//  Copyright © 2016年 NegHao.W All rights reserved.
//
//  github:https://github.com/NegHao/NHGiftAnimationExample
