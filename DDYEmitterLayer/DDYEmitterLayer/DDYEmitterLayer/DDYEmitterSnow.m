//
//  DDYEmitterSnow.m
//  DDYEmitterLayer
//
//  Created by SmartMesh on 2018/8/27.
//  Copyright © 2018年 com.smartmesh. All rights reserved.
//

#import "DDYEmitterSnow.h"

@interface DDYEmitterSnow ()

@end

@implementation DDYEmitterSnow

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self emitterLayer];
}

- (void)emitterLayer {
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width/2.0, -30);
    snowEmitter.emitterSize     = CGSizeMake(self.view.bounds.size.width*2.0, 0.0);
    snowEmitter.emitterMode     = kCAEmitterLayerOutline;
    snowEmitter.emitterShape    = kCAEmitterLayerLine;
    snowEmitter.shadowColor     = [[UIColor whiteColor] CGColor];
    snowEmitter.emitterCells    = [self emitterCells];
    [self.view.layer addSublayer:snowEmitter];
}

- (NSMutableArray *)emitterCells {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[self emitterCellWithImageName:@"mapResultSnow0" birthRate:2.0]];
    [array addObject:[self emitterCellWithImageName:@"mapResultSnow1" birthRate:2.0]];
    [array addObject:[self emitterCellWithImageName:@"mapResultSnow2" birthRate:2.0]];
    [array addObject:[self emitterCellWithImageName:@"mapResultSnow3" birthRate:2.0]];
    [array addObject:[self emitterCellWithImageName:@"mapResultSnow4" birthRate:3.0]];
    [array addObject:[self emitterCellWithImageName:@"mapResultSnow5" birthRate:3.0]];
    [array addObject:[self emitterCellWithImageName:@"snow" birthRate:8.0]];
    return array;
}

- (CAEmitterCell *)emitterCellWithImageName:(NSString *)imageName birthRate:(CGFloat)birthRate {
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.scale          = 0.25;
    snowflake.scaleRange     = 0.15;
    snowflake.birthRate      = birthRate;
    snowflake.lifetime       = 20.0;
    snowflake.velocity       = 60;
    snowflake.velocityRange  = 10;
    snowflake.yAcceleration  = 10;
    snowflake.emissionRange  = 0.5 * M_PI;
    snowflake.spinRange      = 0.3 * M_PI;
    snowflake.contents       = (id)[[UIImage imageNamed:imageName] CGImage];
    return snowflake;
}
@end
