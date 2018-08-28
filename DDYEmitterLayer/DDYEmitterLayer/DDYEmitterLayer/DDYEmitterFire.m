#import "DDYEmitterFire.h"

static inline CGFloat layerW(UIView *view) { return view.layer.bounds.size.width; }
static inline CGFloat layerH(UIView *view) { return view.layer.bounds.size.height;}

@interface DDYEmitterFire ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayerFire;

@end

@implementation DDYEmitterFire

- (CAEmitterLayer *)emitterLayerFire {
    if (_emitterLayerFire == nil) {
        _emitterLayerFire = [CAEmitterLayer layer];
        // emitterPosition 决定了粒子发射形状的中心点，
        _emitterLayerFire.emitterPosition = CGPointMake(layerW(self.view)/2., layerH(self.view));
        // emitterSize 则决定了粒子发射形状的大小，
        _emitterLayerFire.emitterSize = CGSizeMake(layerW(self.view)/2., 0);
        // emitterShape是粒子从什么形状发射出来，它并不是表示粒子自己的形状,
        _emitterLayerFire.emitterShape = kCAEmitterLayerLine;
        // emitterMode 决定了粒子的发射模式。
        _emitterLayerFire.emitterMode = kCAEmitterLayerOutline;
        // renderMode 渲染
        _emitterLayerFire.renderMode = kCAEmitterLayerAdditive;
        //
        _emitterLayerFire.seed = (arc4random()%100)+1;
        // 添加cell
        _emitterLayerFire.emitterCells = [NSArray arrayWithObject:[self rocketCell]];
    }
    return _emitterLayerFire;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view.layer addSublayer:self.emitterLayerFire];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.emitterLayerFire removeFromSuperlayer];
}

- (void)dealloc {
    [self.emitterLayerFire removeFromSuperlayer];
}

- (CAEmitterCell *)rocketCell {
    CAEmitterCell *emitterCell  = [CAEmitterCell emitterCell];
    emitterCell.birthRate       = 13.0;
    emitterCell.emissionRange   = 0.25 * M_PI;
    emitterCell.velocity        = 480;
    emitterCell.velocityRange   = 380;
    emitterCell.yAcceleration   = 75;
    emitterCell.lifetime        = 1.02;
    emitterCell.contents        = (id) [[UIImage imageNamed:@"fire1"] CGImage];
    emitterCell.scale           = 0.2;
    emitterCell.greenRange      = 1.0;
    emitterCell.redRange        = 1.0;
    emitterCell.blueRange       = 1.0;
    emitterCell.spinRange       = M_PI;
    emitterCell.emitterCells    = @[[self burstCell]];
    return emitterCell;
}

- (CAEmitterCell *)burstCell {
    CAEmitterCell *emitterCell  = [CAEmitterCell emitterCell];
    emitterCell.birthRate       = 1.0;
    emitterCell.velocity        = 0;
    emitterCell.scale           = 2.5;
    emitterCell.redSpeed        = +1.5;
    emitterCell.blueSpeed       = +1.5;
    emitterCell.greenSpeed      = +1.5;
    emitterCell.lifetime        = 0.35;
    emitterCell.emitterCells    = @[[self sparkCell]];
    return emitterCell;
}

- (CAEmitterCell *)sparkCell {
    CAEmitterCell *emitterCell  = [CAEmitterCell emitterCell];
    emitterCell.birthRate       = 600;
    emitterCell.velocity        = 150;
    emitterCell.emissionRange   = 2* M_PI;
    emitterCell.yAcceleration   = 75;
    emitterCell.lifetime        = 3;
    emitterCell.contents        = (id) [[UIImage imageNamed:@"fire2"] CGImage];
    emitterCell.scale           = 0.5;
    emitterCell.scaleSpeed      = -0.2;
    emitterCell.greenSpeed      = -0.1;
    emitterCell.redSpeed        = 0.4;
    emitterCell.blueSpeed       = -0.1;
    emitterCell.alphaSpeed      = -0.5;
    emitterCell.spin            = 2* M_PI;
    emitterCell.spinRange       = 2* M_PI;
    return emitterCell;
}

@end

/**
 renderMode 渲染模式
 
 kCAEmitterLayerOldestFirst 最后的出生的粒子 在第一个
 kCAEmitterLayerOldestLast 最后的出生的粒子 在最后面
 kCAEmitterLayerBackToFront 把后面的 放到上面
 kCAEmitterLayerAdditive 叠加
 */

/**
 emitterShape：发送形状的样式
 
 kCAEmitterLayerPoint 点
 kCAEmitterLayerLine 线
 kCAEmitterLayerRectangle 矩形
 kCAEmitterLayerCuboid 立方体
 kCAEmitterLayerCircle 曲线
 kCAEmitterLayerSphere 圆形
 */

/**
 contents:粒子的内容
 lifetime：存活时间
 lifetimeRange：存活时间的范围
 birthRate：每秒粒子生成的数量
 emissionLatitude：散发的纬度（方向）——>弧度——>上下
 emissionLongitude： 散发的经度（方向）——>弧度——>左右
 velocity:发送的速度——>速度越快越远
 velocityRange：发送速度的范围
 xAcceleration; X轴的加速度
 yAcceleration;Y轴的加速度
 zAcceleration;Z轴的加速度
 smissionRange：散发的范围——>弧度——>范围
 name ：粒子的名字 ——>可以通过粒子的名字 找到粒子
 */


