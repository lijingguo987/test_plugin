//
//  DetaileController.m
//  flutter_plugin1
//
//  Created by lixiang on 2021/5/1.
//

#import "DetaileController.h"

@interface DetaileController ()

@end

@implementation DetaileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [self.view addSubview:btn];
    [btn setTitle:@"跳转到flutter页面" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

-(void)backAction{
    
    if (self.jumpToFlutterPage) {
        
        self.jumpToFlutterPage();
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}



- (IBAction)back:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
