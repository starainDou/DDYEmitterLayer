#import "DDYEmitterSnow.h"

static inline CGFloat layerW(UIView *view) { return view.layer.bounds.size.width; }

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

/**
 birthRate:粒子产生系数，默认1.0；
 
 emitterCells: 装着CAEmitterCell对象的数组，被用于把粒子投放到layer上；
 
 emitterDepth:决定粒子形状的深度联系：emitter shape
 
 emitterZposition:发射源的z坐标位置；
 
 lifetime:粒子生命周期
 
 preservesDepth:不是多很清楚（粒子是平展在层上）
 
 scale:粒子的缩放比例：
 
 seed：用于初始化随机数产生的种子
 
 spin:自旋转速度
 
 velocity：粒子速度
 */

/**
 CAEmitterCell类代从CAEmitterLayer射出的粒子；emitter cell定义了粒子发射的方向。
 
 alphaRange: 一个粒子的颜色alpha能改变的范围；
 
 alphaSpeed:粒子透明度在生命周期内的改变速度；
 
 birthrate：粒子参数的速度乘数因子；每秒发射的粒子数量
 
 blueRange：一个粒子的颜色blue 能改变的范围；
 
 blueSpeed: 粒子blue在生命周期内的改变速度；
 
 color:粒子的颜色
 
 contents：是个CGImageRef的对象,既粒子要展现的图片；
 
 contentsRect：应该画在contents里的子rectangle：
 
 emissionLatitude：发射的z轴方向的角度
 
 emissionLongitude:x-y平面的发射方向
 
 emissionRange；周围发射角度
 
 emitterCells：粒子发射的粒子
 
 enabled：粒子是否被渲染
 
 greenrange: 一个粒子的颜色green 能改变的范围；
 
 greenSpeed: 粒子green在生命周期内的改变速度；
 
 lifetime：生命周期
 
 lifetimeRange：生命周期范围 lifetime= lifetime(+/-) lifetimeRange
 
 magnificationFilter：不是很清楚好像增加自己的大小
 
 minificatonFilter：减小自己的大小
 
 minificationFilterBias：减小大小的因子
 
 name：粒子的名字
 
 redRange：一个粒子的颜色red 能改变的范围；
 
 redSpeed; 粒子red在生命周期内的改变速度；
 
 scale：缩放比例：
 
 scaleRange：缩放比例范围；
 
 scaleSpeed：缩放比例速度：
 
 spin：粒子旋转角度
 
 spinrange：粒子旋转角度范围
 
 velocity：速度
 
 velocityRange：速度范围
 
 xAcceleration:粒子x方向的加速度分量
 
 yAcceleration:粒子y方向的加速度分量
 
 zAcceleration:粒子z方向的加速度分量
 */
