//
//  ViewController.m
//  MyRefresh
//
//  Created by tonniegao on 16/8/30.
//  Copyright © 2016年 lagou. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CVUIViewAdditions.h"
#import "ParabolaSimulaterView.h"

@interface ViewController ()

@property(nonatomic, strong) UILabel *tipLabel;
@property(nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UILabel *label3;
@property(nonatomic, strong) ParabolaSimulaterView *parabolaSimulaterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    _scrollView = [UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self., <#CGFloat height#>)
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.height -= 64;
    self.title = @"抛物线";
    
    CGFloat padding = 5.f;
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 2, 160, 25)];
    _tipLabel.text = @"方程 y = ax^2 + bx + c";
    _tipLabel.font = [UIFont systemFontOfSize:12];
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(padding, 20, 80, 30)];
    _label1.text = @"a: 0.50";
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(80, 20, 290, 30)];
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    [slider addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(padding, _label1.bottom, 80, 30)];
    _label2.text = @"b: 0.00";
    
    UISlider *slider2 = [[UISlider alloc] initWithFrame:CGRectMake(80, slider.bottom, 290, 30)];
    slider2.minimumValue = -100;
    slider2.maximumValue = 100;
    [slider2 addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(padding, _label2.bottom, 80, 30)];
    _label3.text = @"c: 0.00";
    
    UISlider *slider3 = [[UISlider alloc] initWithFrame:CGRectMake(80, slider2.bottom, 290, 30)];
    slider3.minimumValue = -100;
    slider3.maximumValue = 100;
    [slider3 addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    _parabolaSimulaterView = [[ParabolaSimulaterView alloc] initWithFrame:CGRectMake(0, 130, self.view.width, self.view.height - 130)];
    _parabolaSimulaterView.backgroundColor = [UIColor colorWithRed:242.f/255.f green:242.f/255.f blue:242.f/255.f alpha:1];
    [_parabolaSimulaterView setA:1.f/2.f b:0 c:0];
    
    [self.view addSubview:_tipLabel];
    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
    [self.view addSubview:_label3];
    [self.view addSubview:slider];
    [self.view addSubview:slider2];
    [self.view addSubview:slider3];
    [self.view addSubview:_parabolaSimulaterView];
    
    slider.tag = 10;
    slider2.tag = 11;
    slider3.tag = 12;
    
}

- (void)change:(UISlider *)slider {
    if (slider.tag == 10) {
        [_parabolaSimulaterView setA:slider.value];
        _label1.text = [NSString stringWithFormat:@"a: %.2f", slider.value];
        
    } else if (slider.tag == 11) {
        [_parabolaSimulaterView setB:slider.value];
        _label2.text = [NSString stringWithFormat:@"b: %.2f", slider.value];
        
    } else if (slider.tag == 12) {
        [_parabolaSimulaterView setC:slider.value];
        _label3.text = [NSString stringWithFormat:@"c: %.2f", slider.value];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
