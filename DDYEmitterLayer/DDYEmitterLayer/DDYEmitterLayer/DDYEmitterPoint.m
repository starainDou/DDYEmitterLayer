#import "DDYEmitterPoint.h"

static inline CGFloat layerW(UIView *view) { return view.layer.bounds.size.width; }
static inline CGFloat layerH(UIView *view) { return view.layer.bounds.size.height;}
static inline UIColor *color(CGFloat r, CGFloat g, CGFloat b) {return [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:1];}
static inline UIColor *randomColor() {return  color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));}

@interface DDYEmitterPoint ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayerPoint;

@end

@implementation DDYEmitterPoint

- (CAEmitterLayer *)emitterLayerPoint {
    if (!_emitterLayerPoint) {
        _emitterLayerPoint = [CAEmitterLayer layer];
        _emitterLayerPoint.renderMode = kCAEmitterLayerAdditive;
        _emitterLayerPoint.emitterPosition = CGPointMake(layerW(self.view), 0);
        _emitterLayerPoint.emitterSize = CGSizeMake(200, 200);
        _emitterLayerPoint.emitterShape = kCAEmitterLayerLine;
        _emitterLayerPoint.emitterCells = [self emitterCells];
    }
    return _emitterLayerPoint;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view.layer addSublayer:self.emitterLayerPoint];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.emitterLayerPoint removeFromSuperlayer];
}

- (NSMutableArray *)emitterCells {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[self pointCell]];
    [array addObject:[self pointCell]];
    [array addObject:[self pointCell]];
    [array addObject:[self pointCell]];
    [array addObject:[self pointCell]];
    [array addObject:[self pointCell]];
    return array;
}

- (CAEmitterCell *)pointCell {
    CAEmitterCell *emitterCell  = [CAEmitterCell emitterCell];
    emitterCell.contents        = (__bridge id)[self randomColorCircle:CGSizeMake(10, 10)].CGImage;
    emitterCell.yAcceleration   = arc4random_uniform(100);
    emitterCell.xAcceleration   = -emitterCell.yAcceleration-arc4random_uniform(10);
    emitterCell.birthRate       = 10.f;
    emitterCell.lifetime        = 10.f;
    emitterCell.alphaSpeed      = -0.1f;
    emitterCell.velocity        = 20.f;
    emitterCell.velocityRange   = 100.f;
    emitterCell.emissionRange   = M_PI;
    emitterCell.scale           = 1.5;
    emitterCell.scaleRange      = 0.2;
    emitterCell.scaleSpeed      = 0.02;
    emitterCell.blueRange       = 50.;
    emitterCell.redRange        =  50.;
    emitterCell.greenRange      =  50.;
    return emitterCell;
}

- (UIImage *)randomColorCircle:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [randomColor() CGColor]);
    CGContextFillEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  image;
}


@end
