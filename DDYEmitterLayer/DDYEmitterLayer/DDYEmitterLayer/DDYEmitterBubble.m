#import "DDYEmitterBubble.h"

static inline CGFloat layerW(UIView *view) { return view.layer.bounds.size.width; }
static inline CGFloat layerH(UIView *view) { return view.layer.bounds.size.height;}

@interface DDYEmitterBubble ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayerBubble;

@end

@implementation DDYEmitterBubble

- (CAEmitterLayer *)emitterLayerBubble {
    if (!_emitterLayerBubble) {
        _emitterLayerBubble = [CAEmitterLayer layer];
        _emitterLayerBubble.emitterShape = kCAEmitterLayerPoint;
        _emitterLayerBubble.renderMode = kCAEmitterLayerVolume;
        _emitterLayerBubble.emitterSize = CGSizeMake(layerW(self.view), layerH(self.view)/10.);
        _emitterLayerBubble.emitterPosition = CGPointMake(layerW(self.view)/2, layerH(self.view));
        _emitterLayerBubble.emitterCells = [NSArray arrayWithObject:[self bubbleCell]];
    }
    return _emitterLayerBubble;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view.layer addSublayer:self.emitterLayerBubble];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.emitterLayerBubble removeFromSuperlayer];
}

- (CAEmitterCell *)bubbleCell {
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.name = @"bubble";
    emitterCell.enabled = YES;
    emitterCell.contents = (__bridge id)[UIImage imageNamed:@"bubble"].CGImage;
    
    
    //粒子出生速度和存在时间
    emitterCell.birthRate = 3;
    emitterCell.lifetime = 4.f;
    
    //粒子向屏幕右方(+)向偏移及偏移范围大小
    emitterCell.velocity = 10;
    emitterCell.velocityRange = -10;
    
    //粒子沿y轴方向发射加速度分量
    emitterCell.yAcceleration = -40;
    
    //粒子在发射点可以发射的角度
    emitterCell.emissionRange = -M_PI;
    
    //粒子大小/范围/变化速率
    emitterCell.scale = 0.1;
    emitterCell.scaleRange = 0.1;
    emitterCell.scaleSpeed = 0.2;
    
    //粒子过滤器放大模式
    emitterCell.magnificationFilter = kCAFilterNearest;
    emitterCell.minificationFilter = kCAFilterTrilinear;
    
    return emitterCell;
}

@end
