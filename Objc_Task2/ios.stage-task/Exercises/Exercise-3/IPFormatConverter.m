#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray.count == 0){
        return @"";
    }
    
    
    if (numbersArray.count == 4) {
        NSString *answerVar1 = [self makeArrayForArrayOf4Count:numbersArray];
        return answerVar1;
    } else {
        NSString *answerVar2 = [self makeArrayForArrayOfNon4Count:numbersArray];
        return answerVar2;
    }
    return nil;
}


- (NSString *) makeArrayForArrayOf4Count:(NSArray <NSNumber *> *)numbersArray {
    NSMutableArray *arrayResultVar1 = [NSMutableArray new];
    NSString *point = @".";
    for (int i = 0; i < numbersArray.count; i += 1) {
        
        if (numbersArray[i].intValue > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        if (numbersArray[i].intValue < 0) {
            return @"Negative numbers are not valid for input.";
        }
        NSNumber *charValue = numbersArray[i];
        NSString *stringFromArray = charValue.stringValue;
        [arrayResultVar1 addObject:stringFromArray];
    }
    
    NSString *stringOfArrayResultVar1 = [arrayResultVar1 componentsJoinedByString:point];
    return stringOfArrayResultVar1;
    
    return @"";
}

- (NSString *) makeArrayForArrayOfNon4Count:(NSArray <NSNumber *> *)numbersArray {
    NSMutableArray *arrayResultVar2 = [NSMutableArray new];
    NSString *point = @".";
    if (numbersArray.count > 4) {
        for (int i = 0; i < 4; i += 1) {
            if (numbersArray[i].intValue > 255) {
                return @"The numbers in the input array can be in the range from 0 to 255.";
            }
            if (numbersArray[i].intValue < 0) {
                return @"Negative numbers are not valid for input.";
            }
            NSNumber *charValue = numbersArray[i];
            NSString *stringFromArray = charValue.stringValue;
            [arrayResultVar2 addObject:stringFromArray];
        }
        NSString *stringOfArrayResultVar2 = [arrayResultVar2 componentsJoinedByString:point];
        return stringOfArrayResultVar2;
    } else {
        
        for (int i = 0; i < numbersArray.count; i += 1) {
            
            if (numbersArray[i].intValue > 255) {
                return @"The numbers in the input array can be in the range from 0 to 255.";
            }
            if (numbersArray[i].intValue < 0) {
                return @"Negative numbers are not valid for input.";
            }
            NSNumber *charValue = numbersArray[i];
            NSString *stringFromArray = charValue.stringValue;
            [arrayResultVar2 addObject:stringFromArray];
            int countOfArrayResult2 = arrayResultVar2.count;
            for (int i = 0; i <= 3 - numbersArray.count; i +=1) {
                [arrayResultVar2 addObject:@"0"];
            }
        }
        
        NSString *stringOfArrayResultVar2 = [arrayResultVar2 componentsJoinedByString:point];
        return stringOfArrayResultVar2;
    }
    return @"";
}



@end
