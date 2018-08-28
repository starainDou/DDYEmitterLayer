#import "DDYEmitterSnow.h"

static inline CGFloat layerW(UIView *view) { return view.layer.bounds.size.width; }
static inline CGFloat layerH(UIView *view) { return view.layer.bounds.size.height;}

@interface DDYEmitterSnow ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayerSnow;

@end

@implementation DDYEmitterSnow

- (CAEmitterLayer *)emitterLayerSnow {
    if (!_emitterLayerSnow) {
        _emitterLayerSnow = [CAEmitterLayer layer];
        _emitterLayerSnow.emitterPosition = CGPointMake(layerW(self.view)/2., 0.);
        _emitterLayerSnow.emitterSize     = CGSizeMake(layerW(self.view)/2., 0.);
        _emitterLayerSnow.emitterMode     = kCAEmitterLayerOutline;
        _emitterLayerSnow.emitterShape    = kCAEmitterLayerLine;
        _emitterLayerSnow.shadowColor     = [[UIColor whiteColor] CGColor];
        _emitterLayerSnow.emitterCells    = [self emitterCells];
    }
    return _emitterLayerSnow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view.layer addSublayer:self.emitterLayerSnow];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.emitterLayerSnow removeFromSuperlayer];
}


- (NSMutableArray *)emitterCells {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[self emitterCellWithImageName:@"snow1"]];
    [array addObject:[self emitterCellWithImageName:@"snow2"]];
    return array;
}

- (CAEmitterCell *)emitterCellWithImageName:(NSString *)imageName {
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.scale          = 0.25;
    snowflake.scaleRange     = 0.15;
    snowflake.birthRate      = 5.0;
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
