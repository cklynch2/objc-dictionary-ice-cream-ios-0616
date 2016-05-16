//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)namesForIceCream:(NSString *)iceCream
{
    NSDictionary *iceCreamByName = @{@"Joe" : @"Peanut Butter and Chocolate",
                                        @"Tim" : @"Natural Vanilla",
                                        @"Sophie" : @"Mexican Chocolate",
                                        @"Deniz" : @"Natural Vanilla",
                                        @"Tom" : @"Mexican Chocolate",
                                        @"Jim" : @"Natural Vanilla",
                                        @"Mark" : @"Cookies 'n Cream"};
                                        
 // Goal is to return an array of the names of everyone who likes the ice cream flavor submitted in the string argument.
    
    NSMutableArray *namesWhoPreferIceCream = [[NSMutableArray alloc]init];
    for (NSString *key in iceCreamByName){
        NSString *iceCreamPreference = iceCreamByName[key];
        
        NSLog(@"This is a key: %@", key);
        NSLog(@"This is the ice cream associated with the key: %@", iceCreamPreference);
        NSLog(@"This is the ice cream argument: %@", iceCream);
        
        if ([iceCreamPreference isEqualToString:iceCream]){
            [namesWhoPreferIceCream addObject:key];
            NSLog(@"Current ice cream preference equals ice cream argument.");
        }
        NSLog(@"These are the names who prefer ice cream argument: %@", namesWhoPreferIceCream);
    }
    
    return namesWhoPreferIceCream;
}


-(NSDictionary *)countsOfIceCream:(NSDictionary *)iceCreamByName
{
    NSMutableDictionary *countsOfIceCream = [[NSMutableDictionary alloc]init];
    for (NSString *key in iceCreamByName){

        NSString *iceCreamFlavor = iceCreamByName[key];
        NSArray *namesWhoPreferFlavor = [self namesForIceCream:iceCreamFlavor];
        NSNumber *countOfIceCream = @([namesWhoPreferFlavor count]);
        
        if (![[countsOfIceCream allKeys] containsObject:iceCreamFlavor]) {
            countsOfIceCream[iceCreamFlavor]= countOfIceCream;
        }
    }
    return countsOfIceCream;
}

@end
