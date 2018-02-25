#test1[is.na(test1$MSZoning), 10:15]

#test1[test1[,12]=="IDOTRR", 3] #RM
#test1[test1[,12]=="Mitchel", 3] #RL

testNa <- function(test1) {
        i <- c(456, 757, 791)
        test1[i,3] = "RM"
        test1[1445, 3] = "RL"
        
        test1$Utilities[is.na(test1$Utilities)] <- "AllPub"
        test1$Exterior1st[is.na(test1$Exterior1st)] <- "VinylSd"
        test1$Exterior2nd[is.na(test1$Exterior2nd)] <- "VinylSd"
        test1$BsmtFinSF1[is.na(test1$BsmtFinSF1)] <- 0
        test1$BsmtFinSF2[is.na(test1$BsmtFinSF2)] <- 0
        test1$BsmtUnfSF[is.na(test1$BsmtUnfSF)] <- 0
        test1$TotalBsmtSF[is.na(test1$TotalBsmtSF)] <- 0
        test1$BsmtHalfBath[is.na(test1$BsmtHalfBath)] <- 0
        test1$KitchenQual[is.na(test1$KitchenQual)] <- "TA"
        test1$Functional[is.na(test1$Functional)] <- "Typ"
        test1$GarageCars[is.na(test1$GarageCars)] <- median(test1$GarageCars, na.rm=TRUE)
        test1$GarageArea[is.na(test1$GarageArea)] <- median(test1$GarageArea, na.rm=TRUE)
        test1$SaleType[is.na(test1$SaleType)] <- "WD"
        test1$BsmtFullBath[is.na(test1$BsmtFullBath)] <- 0
        
        test1
        }

