//
//  DVMPokemonController.h
//  Pokedex27C
//
//  Created by Drew Seeholzer on 7/2/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"



@interface DVMPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^) (Pokemon *))completion;
//static func fetchPokemon(for searchTerm:String, completion:((Pokemon?) -> (Void))?)

@end


