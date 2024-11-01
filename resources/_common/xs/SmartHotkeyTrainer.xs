// game internal constants
const int cMuleCart = 1808;
const int cFolwark = 1734;
const int cDonjon = 1665;
const int cHarbor = 1189;
const int cFortifiedChurch = 1806;
const int cKrepost = 1251;
const int cFeitoria = 1021;
const int cCaravanserai = 1754;
const int cLumberCamp = 562;
const int cMiningCamp = 584;
const int cMill =  68;
const int cKeep = 79;
const int cBombardTower = 236;
const int cDock = 45;
const int cMonastery = 104;

const int cMonk = 125;
const int cMonkWithRelic = 286;

// general constants
const int logLevel = 1;
const int maxBuildings = 32;
const int maxBuildingConfigurations = 7;
const int initialBuildingFrequency = 2;
const int economicOffset = 4;

// difficulty level
const int easiestDifficulty = 1;
const int standardDifficulty = 2;
const int moderateDifficulty = 3;
const int hardDifficulty = 4;
const int hardestDifficulty = 5;
const int extremeDifficulty = 6;

// building types
const int economicBuilding = 0;
const int militaryBuilding = 1;
const int civSpecificBuilding = 2;

// economic buildings
const int house = 0;
const int mill = 1;
const int miningCamp = 2;
const int lumberCamp = 3;
const int dock = 4;
const int farm = 5;
const int blacksmith = 6;
const int market = 7;
const int monastery = 8;
const int university = 9;
const int townCenter = 10;
const int wonder = 11;

// military buildings
const int barracks = 12;
const int archeryRange = 13;
const int stable = 14;
const int siegeWorkshop = 15;
const int outpost = 16;
const int palisadeWall = 17;
const int stoneWall = 18;
const int watchTower = 19;
const int bombardTower = 20;
const int stoneGate = 21;
const int palisadeGate = 22;
const int castle = 23;

// civ specific buildings
const int muleCart = 24;
const int folwark = 25;
const int donjon = 26;
const int harbor = 27;
const int fortifiedChurch = 28;
const int krepost = 29;
const int feitoria = 30;
const int caravanserai = 31;

// constants for trigger variables
// Caution: variables 0-5 are accessed outside of script
const int successVariable = 1; // numberOfSuccess
const int errorVariable = 2; // numberOfErrors
const int difficultyLevelVariable = 3; // difficultyLevel
const int errorRateVariable = 4; // errorRate
const int isTrainingVariable = 5; // isTraining

const int currentBuildingVariable = 6;
const int timerVariable = 7;
const int buildingConfigurationVariable = 8;

const int buildingRequiredAgeVariable = 9;
const int buildingTypeVariable = 10;

const int currentBuildingFrequencyVariable = 11;
const int overallBuildingFrequencyVariable = 12;

/**************************************************
 * Section Log Messages                           *
 **************************************************/

void debugMessage(string s = "")
{
    if (logLevel < 1)
    {
        xsChatData("Debug: " + s);
    }
}

void infoMessage(string s = "")
{
    if (logLevel < 2)
    {
        xsChatData("Info: " + s);
    }
}

void errorMessage(string s = "")
{
    xsChatData("Error: " + s);
}

string xsArrayIntToString(int arrayId = -1)
{
    string result = "<";
    for (i = 0; < xsArrayGetSize(arrayId))
    {
        result = result + xsArrayGetInt(arrayId, i) + ", ";
    }
    result = result + ">";
    return (result);
}

string xsArrayBoolToString(int arrayId = -1)
{
    string result = "<";
    for (i = 0; < xsArrayGetSize(arrayId))
    {
        result = result + xsArrayGetBool(arrayId, i) + ", ";
    }
    result = result + ">";
    return (result);
}

/**************************************************
 * Section Getter/Setter                          *
 **************************************************/

int getDifficultyLevel()
{
    return (xsTriggerVariable(difficultyLevelVariable));
}

int getTraining()
{
    return (xsTriggerVariable(isTrainingVariable));
}

int getCurrentBuilding()
{
    return (xsTriggerVariable(currentBuildingVariable));
}

void setCurrentBuilding(int buildingType = 0)
{
    xsSetTriggerVariable(currentBuildingVariable, buildingType);
}

int getNumberOfSuccess()
{
    return (xsTriggerVariable(successVariable));
}

void setNumberOfSuccess(int number = 0)
{
    xsSetTriggerVariable(successVariable, number);
}

int getNumberOfErrors()
{
    return (xsTriggerVariable(errorVariable));
}

void setNumberOfErrors(int number = 0)
{
    xsSetTriggerVariable(errorVariable, number);
}

void setErrorRate(int number = 0)
{
    xsSetTriggerVariable(errorRateVariable, number);
}

int getCurrentBuildingFrequency(int buildingType = maxBuildings)
{
    int arrayId = xsTriggerVariable(currentBuildingFrequencyVariable);
    return (xsArrayGetInt(arrayId, buildingType));
}

void setCurrentBuildingFrequency(int buildingType = maxBuildings, int frequency = 1)
{
    int arrayId = xsTriggerVariable(currentBuildingFrequencyVariable);
    xsArraySetInt(arrayId, buildingType, frequency);
}

int getOverallBuildingFrequency(int buildingType = maxBuildings)
{
    int arrayId = xsTriggerVariable(overallBuildingFrequencyVariable);
    return (xsArrayGetInt(arrayId, buildingType));
}

void setOverallBuildingFrequency(int buildingType = maxBuildings, int frequency = 1)
{
    int arrayId = xsTriggerVariable(overallBuildingFrequencyVariable);
    xsArraySetInt(arrayId, buildingType, frequency);
}

bool hasTimerFinished()
{
    int delta = xsTriggerVariable(timerVariable) - xsGetTime();
    debugMessage("Timer remaining time: " + delta);
    return (delta <= 0);
}

void startTimer(int timer = 0)
{
    int timerTime = xsGetTime() + timer;
    debugMessage("Timer finish time: " + timerTime);
    xsSetTriggerVariable(timerVariable, timerTime);
}

void setDarkAge()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    xsArraySetBool(arrayId, cDarkAge, true);
}

void setFeudalAge()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    xsArraySetBool(arrayId, cFeudalAge, true);
}

void setCastleAge()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    xsArraySetBool(arrayId, cCastleAge, true);
}

void setImperialAge()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    xsArraySetBool(arrayId, cImperialAge, true);
}

void setEconomicBuildings()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    xsArraySetBool(arrayId, economicOffset + economicBuilding, true);
}

void setMilitaryBuildings()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    xsArraySetBool(arrayId, economicOffset + militaryBuilding, true);
}

void setCivSpecificBuildings()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    xsArraySetBool(arrayId, economicOffset + civSpecificBuilding, true);
}

void resetUserConfiguration()
{
    int arrayId = xsTriggerVariable(buildingConfigurationVariable);
    int i = 0;
    for (i = 0; < xsArrayGetSize(arrayId))
    {
        xsArraySetBool(arrayId, i, false);
    }
}

/**************************************************
 * Section Main functions                         *
 **************************************************/

void initBuildings()
{
    int currentBuildingFrequencyArrayId = xsTriggerVariable(currentBuildingFrequencyVariable);
    int overallBuildingFrequencyArrayId = xsTriggerVariable(overallBuildingFrequencyVariable);
    int buildingRequiredAgeArrayId = xsTriggerVariable(buildingRequiredAgeVariable);
    int buildingTypeArrayId = xsTriggerVariable(buildingTypeVariable);
    int buildingConfigurationArrayId = xsTriggerVariable(buildingConfigurationVariable);
    bool isNotTraining = (getTraining() != 1);

    string message = "Array of building required age: " + xsArrayIntToString(buildingRequiredAgeArrayId);
    debugMessage(message);
    message = "Array of building type: " + xsArrayIntToString(buildingTypeArrayId);
    debugMessage(message);

    int i = 0;
    for (i = 0; < xsArrayGetSize(currentBuildingFrequencyArrayId))
    {
        debugMessage("Index " + i);
        int buildingRequiredAge = xsArrayGetInt(buildingRequiredAgeArrayId, i);
        int buildingType = xsArrayGetInt(buildingTypeArrayId, i);
        debugMessage("Required Age: " + buildingRequiredAge + ", Type: " + buildingType);
        bool isAllowed = xsArrayGetBool(buildingConfigurationArrayId, buildingRequiredAge)
            && xsArrayGetBool(buildingConfigurationArrayId, buildingType + 4);
        if (isNotTraining || isAllowed)
        {
            int frequency = xsArrayGetInt(overallBuildingFrequencyArrayId, i);
            xsArraySetInt(currentBuildingFrequencyArrayId, i, frequency);
        }
        else
        {
            xsArraySetInt(currentBuildingFrequencyArrayId, i, 0);
        }
        debugMessage("Index " + i + ", BuildingFrequency " + xsArrayGetInt(currentBuildingFrequencyArrayId, i));
    }
    message = "Array of building configuration: " + xsArrayBoolToString(buildingConfigurationArrayId);
    debugMessage(message);
    message = "Array of building frequency: " + xsArrayIntToString(currentBuildingFrequencyArrayId);
    debugMessage(message);
}

void initTraining()
{
    setNumberOfSuccess(0);
    setNumberOfErrors(0);
    setErrorRate(0);
    initBuildings();
}

void saveFrequencies()
{
    int currentBuildingFrequencyArrayId = xsTriggerVariable(currentBuildingFrequencyVariable);
    int overallBuildingFrequencyArrayId = xsTriggerVariable(overallBuildingFrequencyVariable);

    for (i = 0; < xsArrayGetSize(currentBuildingFrequencyArrayId))
    {
        int frequency = xsArrayGetInt(currentBuildingFrequencyArrayId, i);
        if (frequency != 0)
        {
            xsArraySetInt(overallBuildingFrequencyArrayId, i, frequency);
        }
    }
}

void initializeTriggerVariables() {
    setCurrentBuilding(house);

    int arrayId = xsArrayCreateInt(maxBuildings, 0, "currentBuildingFrequency");
    xsSetTriggerVariable(currentBuildingFrequencyVariable, arrayId);

    arrayId = xsArrayCreateInt(maxBuildings, initialBuildingFrequency, "overallBuildingFrequency");
    xsSetTriggerVariable(overallBuildingFrequencyVariable, arrayId);

    arrayId = xsArrayCreateBool(maxBuildingConfigurations, false, "buildingConfiguration");
    xsSetTriggerVariable(buildingConfigurationVariable, arrayId);

    int buildingRequiredAgeArrayId = xsArrayCreateInt(maxBuildings, -1, "buildingRequiredAge");
    xsSetTriggerVariable(buildingRequiredAgeVariable, buildingRequiredAgeArrayId);

    int buildingTypeArrayId = xsArrayCreateInt(maxBuildings, -1, "buildingType");
    xsSetTriggerVariable(buildingTypeVariable, buildingTypeArrayId);

    int index = house;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = mill;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = miningCamp;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = lumberCamp;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = dock;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = farm;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = blacksmith;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = market;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = monastery;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = university;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = townCenter;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = wonder;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cImperialAge);
    xsArraySetInt(buildingTypeArrayId, index, economicBuilding);

    index = barracks;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = archeryRange;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = stable;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = siegeWorkshop;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = outpost;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = palisadeWall;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = stoneWall;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = watchTower;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = bombardTower;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cImperialAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = stoneGate;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = palisadeGate;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = castle;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, militaryBuilding);

    index = muleCart;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);

    index = folwark;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cDarkAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);

    index = donjon;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cFeudalAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);

    index = harbor;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);

    index = fortifiedChurch;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);

    index = krepost;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cCastleAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);

    index = feitoria;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cImperialAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);

    index = caravanserai;
    xsArraySetInt(buildingRequiredAgeArrayId, index, cImperialAge);
    xsArraySetInt(buildingTypeArrayId, index, civSpecificBuilding);
}

void restoreReplacableBuildings()
{
    debugMessage("Restore replacable buildings");
    xsEffectAmount(cEnableObject, cLumberCamp, cAttributeEnable, 0);
    xsEffectAmount(cEnableObject, cMiningCamp, cAttributeEnable, 0);
    xsEffectAmount(cEnableObject, cMill, cAttributeEnable, 0);
    xsEffectAmount(cEnableObject, cKeep, cAttributeEnable, 0);
    xsEffectAmount(cEnableObject, cDock, cAttributeEnable, 0);
    xsEffectAmount(cEnableObject, cMonastery, cAttributeEnable, 0);
}

void removeReplacableBuildings()
{
    debugMessage("Remove replacable buildings");
    xsEffectAmount(cEnableObject, cLumberCamp, cAttributeDisable, 0);
    xsEffectAmount(cEnableObject, cMiningCamp, cAttributeDisable, 0);
    xsEffectAmount(cEnableObject, cMill, cAttributeDisable, 0);
    xsEffectAmount(cEnableObject, cKeep, cAttributeDisable, 0);
    xsEffectAmount(cEnableObject, cDock, cAttributeDisable, 0);
    xsEffectAmount(cEnableObject, cMonastery, cAttributeDisable, 0);
}

int getRandomBuildingNumber() {
    int sum = 0;
    int i = 0;
    for (i = 0; < maxBuildings)
    {
        sum = sum + getCurrentBuildingFrequency(i);
    }
    debugMessage("Sum of frequency: " + sum);
    int randomNumber = xsGetRandomNumberMax(sum);
    debugMessage("Inital randomNumber: " + randomNumber);
    for (i = 0; < maxBuildings)
    {
        randomNumber = randomNumber - getCurrentBuildingFrequency(i);
        debugMessage("RandomNumber in step " + i + " : " + randomNumber);
        if (randomNumber < 0)
        {
            return(i);
        }
    }
    errorMessage("Could not determine random building number.");
    return(-1);
}

void prepareNextBuilding()
{
    int buildingTypeArrayId = xsTriggerVariable(buildingTypeVariable);

    int currentBuildingType = 0;
    int currentBuilding = 0;
    currentBuilding = getCurrentBuilding();
    currentBuildingType = xsArrayGetInt(buildingTypeArrayId, currentBuilding);
    debugMessage("Current building type: " + currentBuildingType);

    setCurrentBuilding(getRandomBuildingNumber());
    debugMessage("Next building number: "  + xsTriggerVariable(currentBuildingVariable));

    int nextBuildingType = 0;
    int nextBuilding = 0;
    nextBuilding = getCurrentBuilding();
    nextBuildingType = xsArrayGetInt(buildingTypeArrayId, nextBuilding);
    debugMessage("Next building type: " + nextBuildingType);

    if (currentBuildingType == civSpecificBuilding)
    {
        switch (currentBuilding)
        {
            case muleCart:
            {
                xsEffectAmount(cEnableObject, cMuleCart, cAttributeDisable, 0);
            }
            case folwark:
            {
                xsEffectAmount(cEnableObject, cFolwark, cAttributeDisable, 0);
            }
            case donjon:
            {
                xsEffectAmount(cEnableObject, cDonjon, cAttributeDisable, 0);
            }
            case harbor:
            {
                xsEffectAmount(cEnableObject, cHarbor, cAttributeDisable, 0);
            }
            case fortifiedChurch:
            {
                xsEffectAmount(cEnableObject, cFortifiedChurch, cAttributeDisable, 0);
            }
            case krepost:
            {
                xsEffectAmount(cEnableObject, cKrepost, cAttributeDisable, 0);
            }
            case feitoria:
            {
                xsEffectAmount(cEnableObject, cFeitoria, cAttributeDisable, 0);
            }
            case caravanserai:
            {
                xsEffectAmount(cEnableObject, cCaravanserai, cAttributeDisable, 0);
            }
            default:
            {
                // do nothing
            }
        }
        if (nextBuildingType != civSpecificBuilding)
        {
            restoreReplacableBuildings();
        }
    }
    if (nextBuildingType == civSpecificBuilding)
    {
        switch (nextBuilding)
        {
            case muleCart:
            {
                xsEffectAmount(cEnableObject, cMuleCart, cAttributeEnable, 0);
            }
            case folwark:
            {
                xsEffectAmount(cEnableObject, cFolwark, cAttributeEnable, 0);
            }
            case donjon:
            {
                xsEffectAmount(cEnableObject, cDonjon, cAttributeEnable, 0);
            }
            case harbor:
            {
                xsEffectAmount(cEnableObject, cHarbor, cAttributeEnable, 0);
            }
            case fortifiedChurch:
            {
                xsEffectAmount(cEnableObject, cFortifiedChurch, cAttributeEnable, 0);
            }
            case krepost:
            {
                xsEffectAmount(cEnableObject, cKrepost, cAttributeEnable, 0);
            }
            case feitoria:
            {
                xsEffectAmount(cEnableObject, cFeitoria, cAttributeEnable, 0);
            }
            case caravanserai:
            {
                xsEffectAmount(cEnableObject, cCaravanserai, cAttributeEnable, 0);
            }
            default:
            {
                // do nothing
            }
        }
        if (currentBuildingType != civSpecificBuilding)
        {
            removeReplacableBuildings();
        }
    }
}

void increaseCurrentBuildingFrequency(int buildingType = maxBuildings)
{
    int frequency = getCurrentBuildingFrequency(buildingType);
    setCurrentBuildingFrequency(buildingType, frequency + 1);
    debugMessage("Increased current frequency of " + buildingType + ": "  + getCurrentBuildingFrequency(buildingType));
}

void decreaseCurrentBuildingFrequency(int buildingType = maxBuildings)
{
    int frequency = getCurrentBuildingFrequency(buildingType);
    if (frequency > 1)
    {
        setCurrentBuildingFrequency(buildingType, frequency - 1);
    }
    debugMessage("Decreased current frequency of " + buildingType + ": "  + getCurrentBuildingFrequency(buildingType));
}

void updateErrorRate()
{
    int numberOfSuccess = getNumberOfSuccess();
    int numberOfErrors = getNumberOfErrors();
    int errorRate = 100. * numberOfErrors / (numberOfSuccess + numberOfErrors);
    setErrorRate(errorRate);
}

void onError()
{
    increaseCurrentBuildingFrequency(getCurrentBuilding());
    int numberOfErrors = getNumberOfErrors() + 1;
    xsSetTriggerVariable(errorVariable, numberOfErrors);
    debugMessage("Number of Errors: " + numberOfErrors);
    updateErrorRate();
}

void onSuccess()
{
    decreaseCurrentBuildingFrequency(getCurrentBuilding());
    int numberOfSuccess = getNumberOfSuccess() + 1;
    xsSetTriggerVariable(successVariable, numberOfSuccess);
    debugMessage("Number of Success: " + numberOfSuccess);
    updateErrorRate();
}

// Couldn't get this call working from outside.
// For now we go with some code bloat.
bool isOfType(int buildingType = maxBuildings)
{
    return (buildingType == getCurrentBuilding());
}

bool isCurrentBuildingHouse()
{
    return (isOfType(house));
}

bool isCurrentBuildingMill()
{
    return (isOfType(mill));
}

bool isCurrentBuildingMiningCamp()
{
    return (isOfType(miningCamp));
}

bool isCurrentBuildingLumberCamp()
{
    return (isOfType(lumberCamp));
}

bool isCurrentBuildingDock()
{
    return (isOfType(dock));
}

bool isCurrentBuildingFarm()
{
    return (isOfType(farm));
}

bool isCurrentBuildingBlacksmith()
{
    return (isOfType(blacksmith));
}

bool isCurrentBuildingMarket()
{
    return (isOfType(market));
}

bool isCurrentBuildingMonastery()
{
    return (isOfType(monastery));
}

bool isCurrentBuildingUniversity()
{
    return (isOfType(university));
}

bool isCurrentBuildingTownCenter()
{
    return (isOfType(townCenter));
}

bool isCurrentBuildingWonder()
{
    return (isOfType(wonder));
}

bool isCurrentBuildingBarracks()
{
    return (isOfType(barracks));
}

bool isCurrentBuildingArcheryRange()
{
    return (isOfType(archeryRange));
}

bool isCurrentBuildingStable()
{
    return (isOfType(stable));
}

bool isCurrentBuildingSiegeWorkshop()
{
    return (isOfType(siegeWorkshop));
}

bool isCurrentBuildingOutpost()
{
    return (isOfType(outpost));
}

bool isCurrentBuildingPalisadeWall()
{
    return (isOfType(palisadeWall));
}

bool isCurrentBuildingStoneWall()
{
    return (isOfType(stoneWall));
}

bool isCurrentBuildingWatchTower()
{
    return (isOfType(watchTower));
}

bool isCurrentBuildingBombardTower()
{
    return (isOfType(bombardTower));
}

bool isCurrentBuildingPalisadeGate()
{
    return (isOfType(palisadeGate));
}

bool isCurrentBuildingStoneGate()
{
    return (isOfType(stoneGate));
}

bool isCurrentBuildingCastle()
{
    return (isOfType(castle));
}

bool isCurrentBuildingMuleCart()
{
    return (isOfType(muleCart));
}

bool isCurrentBuildingFolwark()
{
    return (isOfType(folwark));
}

bool isCurrentBuildingDonjon()
{
    return (isOfType(donjon));
}

bool isCurrentBuildingHarbor()
{
    return (isOfType(harbor));
}

bool isCurrentBuildingFortifiedChurch()
{
    return (isOfType(fortifiedChurch));
}

bool isCurrentBuildingKrepost()
{
    return (isOfType(krepost));
}

bool isCurrentBuildingFeitoria()
{
    return (isOfType(feitoria));
}

bool isCurrentBuildingCaravanserai()
{
    return (isOfType(caravanserai));
}

void startTimeLimitTimer()
{
    switch (getDifficultyLevel())
    {
        case easiestDifficulty:
        {
            startTimer(100);
        }
        case standardDifficulty:
        {
            startTimer(20);
        }
        case moderateDifficulty:
        {
            startTimer(10);
        }
        case hardDifficulty:
        {
            startTimer(5);
        }
        case hardestDifficulty:
        {
            startTimer(3);
        }
        case extremeDifficulty:
        {
            startTimer(2);
        }
        default:
        {
            errorMessage("Dificulty Level not set");
        }
    }
    //startTimer(5);
}

void main() {
    initializeTriggerVariables();

    xsEffectAmount(cSetAttribute, cBuildingClass, cTrainTime, 0, 1);
    xsEffectAmount(cSetAttribute, cWallClass, cTrainTime, 0, 1);
    xsEffectAmount(cSetAttribute, cTowerClass, cTrainTime, 0, 1);
    xsEffectAmount(cSetAttribute, cGateClass, cTrainTime, 0, 1);
    xsEffectAmount(cSetAttribute, cFarmClass, cTrainTime, 0, 1);

    xsEffectAmount(cSetAttribute, cMonk, cMovementSpeed, 10, 1);
    xsEffectAmount(cSetAttribute, cMonkWithRelic, cMovementSpeed, 10, 1);

    xsEffectAmount(cEnableObject, cBombardTower, cAttributeEnable, 0);
}


