//
//  DDYEmitterFire.m
//  DDYEmitterLayer
//
//  Created by SmartMesh on 2018/8/27.
//  Copyright © 2018年 com.smartmesh. All rights reserved.
//

#import "DDYEmitterFire.h"

@interface DDYEmitterFire ()

@end

@implementation DDYEmitterFire

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self emitterLayerFire];
}

- (void)emitterLayerFire {
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds                = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize     = CGSizeMake(viewBounds.size.width/2.0, 0.0);
    fireworksEmitter.emitterMode     = kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape    = kCAEmitterLayerLine;
    fireworksEmitter.renderMode      = kCAEmitterLayerAdditive;
    fireworksEmitter.seed            = (arc4random()%100)+1;
    
    CAEmitterCell  *rocket           = [CAEmitterCell emitterCell];
    rocket.birthRate                 = 13.0;
    rocket.emissionRange             = 0.25 * M_PI;
    rocket.velocity                  = 480;
    rocket.velocityRange             = 380;
    rocket.yAcceleration             = 75;
    rocket.lifetime                  = 1.02;
    rocket.contents                  = (id) [[UIImage imageNamed:@"mappingFire1"] CGImage];
    rocket.scale                     = 0.2;
    rocket.greenRange                = 1.0;
    rocket.redRange                  = 1.0;
    rocket.blueRange                 = 1.0;
    rocket.spinRange                 = M_PI;
    
    CAEmitterCell  *burst            = [CAEmitterCell emitterCell];
    burst.birthRate                  = 1.0;
    burst.velocity                   = 0;
    burst.scale                      = 2.5;
    burst.redSpeed                   = +1.5;
    burst.blueSpeed                  = +1.5;
    burst.greenSpeed                 = +1.5;
    burst.lifetime                   = 0.35;
    
    CAEmitterCell  *spark            = [CAEmitterCell emitterCell];
    spark.birthRate                  = 600;
    spark.velocity                   = 150;
    spark.emissionRange              = 2* M_PI;
    spark.yAcceleration              = 75;
    spark.lifetime                   = 3;
    spark.contents                   = (id) [[UIImage imageNamed:@"mappingFire2"] CGImage];
    spark.scale                      = 0.5;
    spark.scaleSpeed                 = -0.2;
    spark.greenSpeed                 = -0.1;
    spark.redSpeed                   = 0.4;
    spark.blueSpeed                  = -0.1;
    spark.alphaSpeed                 = -0.5;
    spark.spin                       = 2* M_PI;
    spark.spinRange                  = 2* M_PI;
    fireworksEmitter.emitterCells    = [NSArray arrayWithObject:rocket];
    rocket.emitterCells              = [NSArray arrayWithObject:burst];
    burst.emitterCells               = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
}

@end
