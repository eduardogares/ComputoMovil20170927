//
//  EdgeView.m
//  Mi Primera Tabla
//
//  Created by EDGE on 27/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import "EdgeView.h"

@interface EdgeView ()

@end

@implementation EdgeView

@synthesize simpleText;
@synthesize descriptionText;
@synthesize simpleImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    _lblName.text=simpleText;
    _imgPhoto.image=simpleImage;
    _uiTextDescription.text= descriptionText;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"_EDGE_ prepareForSegue...EdgeView controller");
}


@end
