cleanNa <- function(x) {
        x$LotFrontage[is.na(x$LotFrontage)] = median(training$LotFrontage, na.rm=TRUE)
        x <- select(x, -Alley)
        x$MasVnrType[is.na(x$MasVnrType)] = as.factor("None")
        x$MasVnrArea[is.na(x$MasVnrArea)] = 0
        x$BsmtQual[is.na(x$BsmtQual)] = "None"
        x$BsmtCond[is.na(x$BsmtCond)] = "None"
        x$BsmtExposure[is.na(x$BsmtExposure)] = "None"
        x$BsmtFinType1[is.na(x$BsmtFinType1)] = "None"
        x$BsmtFinType2[is.na(x$BsmtFinType2)] = "None"
        x$Electrical[is.na(x$Electrical)] = "SBrkr"
        x$FireplaceQu[is.na(x$FireplaceQu)] = "None"
        x$GarageType[is.na(x$GarageType)] = "None"
        x$GarageYrBlt = as.numeric(x$GarageYrBlt)
        x$GarageYrBlt[is.na(x$GarageYrBlt)] = 0
        x$GarageFinish[is.na(x$GarageFinish)] = "None"
        x$GarageQual[is.na(x$GarageQual)] = "None"
        x$GarageCond[is.na(x$GarageCond)] = "None"
        x$PoolQC[is.na(x$PoolQC)] = "None"
        x$Fence[is.na(x$Fence)] = "None"
        x$MiscFeature[is.na(x$MiscFeature)] = "None"
        x$GarageYrBlt = as.numeric(x$GarageYrBlt)
        x
}