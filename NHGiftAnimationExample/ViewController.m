//
//  ViewController.m
//  NHGiftAnimationExample
//
//  Created by NegHao.W on 16/7/10.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "ViewController.h"
#import "NHHeader.h"

#define NHBounds [UIScreen mainScreen].bounds.size

@interface ViewController ()
@property (nonatomic, weak) NHPresentFlower *flower;
@property (weak, nonatomic) IBOutlet UIButton *porsche;
@property (weak, nonatomic) IBOutlet UIButton *fighter;
@property (weak, nonatomic) IBOutlet UIButton *plane;
@property (weak, nonatomic) IBOutlet UIButton *flower_a;
@property (weak, nonatomic) IBOutlet UIButton *flower_b;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)porscheAction:(id)sender {
    NHCarView *car = [NHCarView loadCarViewWithPoint:CGPointZero];
    
    car.curve_control_point_a = CGPointMake(self.view.center.x, 300);
    car.curve_end_point_a = CGPointMake(self.view.center.x, 300);
    
    car.curve_control_point_b = CGPointMake(self.view.center.x, 300);
    car.curve_end_point_b = CGPointMake(self.view.center.x, 300);
    
    car.curve_control_point_c = CGPointMake(self.view.center.x, 300);
    car.curve_end_point_c = CGPointMake(self.view.center.x, 300);
    
    [car addAnimationsMoveToPoint:CGPointMake(0, 100) endPoint:CGPointMake(self.view.bounds.size.width +166, 500)];
    [self.view addSubview:car];
}


- (IBAction)fighterAction:(id)sender {
    NHFighterView *fighter = [NHFighterView loadFighterViewWithPoint:CGPointMake(10, 100)];
    
    fighter.curve_control_point_a = CGPointMake(220, 370);
    fighter.curve_end_point_a = CGPointMake(220, 370);
    
    fighter.curve_control_point_b = CGPointMake(220, 370);
    fighter.curve_end_point_b = CGPointMake(220, 370);
    
    fighter.curve_control_point_c = CGPointMake(220, 370);
    fighter.curve_end_point_c = CGPointMake(220, 370);
    
    fighter.curve_control_point_d = CGPointMake(220, 370);
    fighter.curve_end_point_d = CGPointMake(220, 370);
    
    fighter.curve_control_point_e = CGPointMake(220, 370);
    fighter.curve_end_point_e = CGPointMake(220, 370);
    
    [fighter addAnimationsMoveToPoint:CGPointMake(self.view.bounds.size.width, 60) endPoint:CGPointMake( -500, 600)];
    [self.view addSubview:fighter];
    
}


- (IBAction)planeAction:(id)sender {
    NHPlaneView *plane = [NHPlaneView loadPlaneViewWithPoint:CGPointMake(NHBounds.width + 232, 0)];
    
    plane.curve_control_point_a = CGPointMake(290, 250);
    plane.curve_end_point_a = CGPointMake(290, 250);
    
    plane.curve_control_point_b = CGPointMake(290, 250);
    plane.curve_end_point_b = CGPointMake(290, 250);
    
    plane.curve_control_point_c = CGPointMake(290, 250);
    plane.curve_end_point_c = CGPointMake(290, 250);
    
    [plane addAnimationsMoveToPoint:CGPointMake(NHBounds.width, 100) endPoint:CGPointMake(-500, 410)];
    [self.view addSubview:plane];
}


- (IBAction)flowerAAction:(id)sender {
    if (_flower == nil) {
        [self addFlowerView];
    }else{
        _flower.effect = NHSendEffectSpring;
        //        _flower.scaleValue = @[@4.2,@3.5,@1.2,@3.8,@3.3,@3.0,@2.0,@1.0];
        [_flower continuePresentFlowers];
    }
}


- (IBAction)flowerBAction:(id)sender {
    if (_flower == nil) {
        [self addFlowerView];
    }else{
        _flower.effect = NHSendEffectShake;
        //        _flower.scaleValue = @[@4.2,@3.5,@1.2,@3.8,@3.3,@3.0,@2.0,@1.0];
        [_flower continuePresentFlowers];
    }
}


- (void)addFlowerView{
    NHPresentFlower *flower = [[NHPresentFlower alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 50)presentFlowerEffect:NHSendEffectShake];
    flower.autoHiddenTime = 5;
    [self.view addSubview:flower];
    _flower = flower;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

@end
