//
//  ViewController.m
//  MyRefresh
//
//  Created by tonniegao on 16/8/30.
//  Copyright © 2016年 lagou. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CVUIViewAdditions.h"
#import "MyView.h"

@interface ViewController ()

@property(nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UILabel *label3;
@property(nonatomic, strong) MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _scrollView = [UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self., <#CGFloat height#>)
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"抛物线";
    
    CGFloat padding = 5.f;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(padding, 20, 80, 30)];
    label1.text = @"a";
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(80, 20, 290, 30)];
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    [slider addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(padding, label1.bottom, 80, 30)];
    label2.text = @"b";
    
    UISlider *slider2 = [[UISlider alloc] initWithFrame:CGRectMake(80, slider.bottom, 290, 30)];
    slider2.minimumValue = -100;
    slider2.maximumValue = 100;
    [slider2 addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(padding, label2.bottom, 80, 30)];
    label3.text = @"c";
    
    UISlider *slider3 = [[UISlider alloc] initWithFrame:CGRectMake(80, slider2.bottom, 290, 30)];
    slider3.minimumValue = -100;
    slider3.maximumValue = 100;
    [slider3 addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    _myView = [[MyView alloc] initWithFrame:CGRectMake(0, 130, self.view.width, 300)];
    _myView.backgroundColor = [UIColor yellowColor];
    [_myView setA:1.f/2.f b:0 c:0];
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:slider];
    [self.view addSubview:slider2];
    [self.view addSubview:slider3];
    [self.view addSubview:_myView];
    
    slider.tag = 10;
    slider2.tag = 11;
    slider3.tag = 12;
    _label1 = label1;
    _label2 = label2;
    _label3 = label3;
    
}

- (void)change:(UISlider *)slider {
    if (slider.tag == 10) {
        [_myView setA:slider.value];
        _label1.text = [NSString stringWithFormat:@"a: %.2f", slider.value];
        
    } else if (slider.tag == 11) {
        [_myView setB:slider.value];
        _label2.text = [NSString stringWithFormat:@"b: %.2f", slider.value];
        
    } else if (slider.tag == 12) {
        [_myView setC:slider.value];
        _label3.text = [NSString stringWithFormat:@"c: %.2f", slider.value];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
