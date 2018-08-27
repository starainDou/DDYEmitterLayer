#import "ViewController.h"
#import "DDYEmitterFire.h"
#import "DDYEmitterSnow.h"

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
        [self.navigationController pushViewController:[DDYEmitterFire new] animated:YES];
    } else if (sender.tag == 101) {
        [self.navigationController pushViewController:[DDYEmitterSnow new] animated:YES];
    }
}

@end

/** 如果遇到方法不对或不好请告诉我 634778311 小菜一个 正在努力学习各种知识中 */
