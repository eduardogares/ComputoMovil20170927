//
//  ViewController.h
//  Mi Primera Tabla
//
//  Created by Walter Gonzalez Domenzain on 20/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EdgeView.h"


@interface Home :  UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate >

@property (strong, nonatomic) IBOutlet UITableView *tblMain;
- (IBAction)btnAddPressed:(id)sender;



@end

