#import "ViewController.h"
#import "DDYEmitterFire.h"
#import "DDYEmitterSnow.h"
#import "DDYEmitterBubble.h"
#import "DDYEmitterPoint.h"

#ifndef DDYTopH
#define DDYTopH (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height)
#endif

#ifndef DDYScreenW
#define DDYScreenW [UIScreen mainScreen].bounds.size.width
#endif

#ifndef DDYScreenH
#define DDYScreenH [UIScreen mainScreen].bounds.size.height
#endif

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:[self btnY: 50 tag:100 title:@"Fire"]];
    [self.view addSubview:[self btnY:100 tag:101 title:@"Snow"]];
    [self.view addSubview:[self btnY:150 tag:102 title:@"Bubble"]];
    [self.view addSubview:[self btnY:200 tag:103 title:@"Bubble"]];
}

- (UIButton *)btnY:(CGFloat)y tag:(NSUInteger)tag title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setFrame:CGRectMake(10, DDYTopH + y, DDYScreenW-20, 40)];
    [button setTag:tag];
    [button addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

- (void)handleBtn:(UIButton *)sender {
    if (sender.tag == 100) {
        [self.navigationController pushViewController:[[DDYEmitterFire alloc] init] animated:YES];
    } else if (sender.tag == 101) {
        [self.navigationController pushViewController:[[DDYEmitterSnow alloc] init] animated:YES];
    } else if (sender.tag == 102) {
        [self.navigationController pushViewController:[[DDYEmitterBubble alloc] init] animated:YES];
    } else if (sender.tag == 103) {
        [self.navigationController pushViewController:[[DDYEmitterPoint alloc] init] animated:YES];
    }
}

@end

/** [[DDYEmitterFire alloc] init] 不可用[DDYEmitterFire new]替代，原因自行测试 */
