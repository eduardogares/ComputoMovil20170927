//
//  ViewController.m
//  Mi Primera Tabla
//
//  Created by Walter Gonzalez Domenzain on 20/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import "Home.h"
#import "cellMainTable.h"
#import "EdgeView.h"

@interface Home () 
@property NSMutableArray *userNames;
@property NSMutableArray *userAges;
@property NSMutableArray *userImages;
@property NSMutableArray *userDesc;
@property UIImage *myImageView;
@property UIAlertController * alertController;

@end

@implementation Home
int idx;
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
    NSLog(@"App just started...");
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.userNames  = [[NSMutableArray alloc] initWithObjects: @"Tyrion Lannister", @"Daenerys Targaryen", @"Jon Snow", @"Arya Stark", @"Cersei Lannister", nil];
    
    self.userAges  = [[NSMutableArray alloc] initWithObjects: @"38 años", @"22 años", @"25 años", @"16 años", @"42 años", nil];

    self.userImages = [[NSMutableArray alloc] initWithObjects: @"tyrion.jpg", @"daenerys.jpeg", @"jon.jpg", @"arya.jpg", @"cersei.jpg", nil];
    
    self.userDesc = [[NSMutableArray alloc] initWithObjects:
                     @"Tyrion Lannister (también referido como Gnomo o Mediohombre) es un personaje ficticio de la saga Canción de hielo y fuego de George R. R. Martin y de su correspondiente adaptación televisiva, Game of Thrones.                    Basado en una idea que vino a Martin al escribir la novela de 1981 Windhaven, Tyrion ha sido considerado como una de las mejores creaciones de autor y uno de los personajes más populares por el New York Times. Martin ha nombrado el personaje como su favorito en la serie.",
                     @"Daenerys Targaryen (AFI: /dəˈnɛərɪs tɑrˈɡɛərɪən/) es un personaje de ficción de la saga de literatura fantástica Canción de hielo y fuego, escrita por George R. R. Martin. Daenerys es uno de los personajes principales y posee capítulos narrados desde su punto de vista en Juego de tronos, Choque de reyes, Tormenta de espadas y Danza de dragones. En la adaptación televisiva Juego de tronos, el personaje es interpretado por la actriz Emilia Clarke.1t",
                     @"Jon Nieve (en inglés, Jon Snow), de nombre de nacimiento, es un personaje ficticio de la saga de libros Canción de hielo y fuego del escritor estadounidense George R. R. Martin y de su correspondiente adaptación televisiva, Juego de tronos. Se trata de uno de los personajes principales y muertos de la serie, teniendo capítulos desde su punto de vista en cuatro de los cinco libros lanzados hasta la fecha.",
                     @"Arya Stark es un personaje ficticio de la saga Canción de hielo y fuego del escritor George R. R. Martin. Es uno de los principales personajes de la serie y el único en contar con capítulos propios en cada uno de los libros de la saga.",
                     @"Cersei Lannister es un personaje ficticio de la saga Canción de hielo y fuego de George R. R. Martin. Se caracteriza por ser la intrigante y ambiciosa esposa del rey Robert Baratheon, reina consorte de los Siete Reinos. Es uno de los personajes principales de la saga y cuenta con capítulos propios en el cuarto libro, Festín de Cuervos. Por sus actos y actitud es considerada una de las principales antagonistas de la serie.",
                     nil];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    cell.lblName.text       = self.userNames[indexPath.row];
    cell.lblAge.text        = self.userAges[indexPath.row];
    
    if ([self.userImages[indexPath.row] isKindOfClass:[UIImage class]]) {
        cell.imgUser.image      = self.userImages[indexPath.row];
    }
    else{
        cell.imgUser.image      = [UIImage imageNamed:self.userImages[indexPath.row]];
    }
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    idx=(int)indexPath.row;
    NSLog(@"==>didSelectRowAtIndexPath %i",idx);
    
     [self performSegueWithIdentifier:@"EdgeSegue" sender:self];
}


/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAddPressed:(id)sender {
      _alertController = [UIAlertController alertControllerWithTitle: @"Agregar personaje"
                                                                              message: @"agregar el nombre y Edad."
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    [_alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Nombre del personaje";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [_alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Edad.";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [_alertController addAction:[UIAlertAction actionWithTitle:@"Foto" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
        pickerView.allowsEditing = YES;
        pickerView.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
            [pickerView setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            
        }
        
        [self presentViewController:pickerView animated:YES completion:nil];
    }]];
    [_alertController addAction:[UIAlertAction actionWithTitle:@"Agregar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray * textfields = _alertController.textFields;
        UITextField * nameField = textfields[0];
        UITextField * ageField = textfields[1];
        
        
        
        [self.userNames addObject:nameField.text];
        [self.userAges addObject:ageField.text];
        
        [self.userDesc addObject:@"No tenemos informacion de esta persona !!"	];
        
        if(_myImageView == nil){
            [self.userImages addObject:@"non.jpg"	];
        }
        else{
            [self.userImages addObject:_myImageView	];
        }
        
        [self.tblMain reloadData];
    }]];
    
    [_alertController addAction:[UIAlertAction
                actionWithTitle:@"Cancelar"
                style:UIAlertActionStyleCancel
                handler:^(UIAlertAction *action) {}]];
    
    [self presentViewController:_alertController animated:YES completion:nil];
    
}



/**********************************************************************************************/
#pragma mark - UIImagePickerControllerDelegate methods
/**********************************************************************************************/

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    _myImageView = [info valueForKey:UIImagePickerControllerEditedImage];
    
    [self presentViewController:_alertController animated:YES completion:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    _myImageView=nil;
    [self presentViewController:_alertController animated:YES completion:nil];
}

/**********************************************************************************************/
#pragma mark - Segue methods
/**********************************************************************************************/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"_EDGE_ prepareForSegue... _Home_ View controller with ID");
    
    // Get reference to the destination view controller
    if ([[segue identifier] isEqualToString:@"EdgeSegue"])
    {
        NSLog(@"_EDGE_ prepareForSegue... Edge Segue.");
        // Get reference to the destination view controller
        EdgeView *vc = [segue destinationViewController];
        
        vc.simpleText=self.userNames[idx];
        
        if ([self.userImages[idx] isKindOfClass:[UIImage class]]) {
            vc.simpleImage= self.userImages[idx];
        }
        else{
            vc.simpleImage=[UIImage imageNamed:self.userImages[idx]];
        }
        
        vc.descriptionText=self.userDesc[idx];

        
        // Pass any objects to the view controller here, like...
//        EdgeSegue[vc setMyObjectHere:object];
    }
    
}

@end





