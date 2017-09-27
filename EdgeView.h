//
//  EdgeView.h
//  Mi Primera Tabla
//
//  Created by EDGE on 27/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EdgeView : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;
@property (weak, nonatomic) IBOutlet UITextView *uiTextDescription;


//Shared Properties
@property (weak, nonatomic) NSString *simpleText;
@property (weak, nonatomic) NSString *descriptionText;

@property (weak, nonatomic) UIImage *simpleImage;

@end
