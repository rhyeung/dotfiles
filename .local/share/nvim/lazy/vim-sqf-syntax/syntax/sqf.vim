" Vim syntax file
" Language:        SQF Script (used in Bohemia Interactives ArmA/ArmA2/etc.)
" Original Author: shreds-of-sanity@gmx.net
" Modified By:     somebody@froghat.ca
" Last modified for Arma 3 version 2.16

if exists("b:current_syntax")
  finish
endif

"syn case ignore

syn keyword     sqfCommand      abs accTime acos action actionIDs actionKeys
syn keyword     sqfCommand      actionKeysEx actionKeysImages actionKeysNames
syn keyword     sqfCommand      actionKeysNamesArray actionName actionParams
syn keyword     sqfCommand      activateAddons activatedAddons activateKey
syn keyword     sqfCommand      activeTitleEffectParams add3DENConnection
syn keyword     sqfCommand      add3DENEventHandler add3DENLayer addAction addBackpack
syn keyword     sqfCommand      addBackpackCargo addBackpackCargoGlobal
syn keyword     sqfCommand      addBackpackGlobal addBinocularItem addCamShake
syn keyword     sqfCommand      addCuratorAddons addCuratorCameraArea
syn keyword     sqfCommand      addCuratorEditableObjects addCuratorEditingArea
syn keyword     sqfCommand      addCuratorPoints addCuratorSelected addEditorObject
syn keyword     sqfCommand      addEventHandler addForce addForceGeneratorRTD
syn keyword     sqfCommand      addGoggles addGroupIcon addHandgunItem addHeadgear
syn keyword     sqfCommand      addItem addItemCargo addItemCargoGlobal addItemPool
syn keyword     sqfCommand      addItemToBackpack addItemToUniform addItemToVest
syn keyword     sqfCommand      addLiveStats addMagazine addMagazineAmmoCargo
syn keyword     sqfCommand      addMagazineCargo addMagazineCargoGlobal
syn keyword     sqfCommand      addMagazineGlobal addMagazinePool addMagazines
syn keyword     sqfCommand      addMagazineTurret addMenu addMenuItem
syn keyword     sqfCommand      addMissionEventHandler addMPEventHandler
syn keyword     sqfCommand      addMusicEventHandler addonFiles addOwnedMine
syn keyword     sqfCommand      addPlayerScores addPrimaryWeaponItem
syn keyword     sqfCommand      addPublicVariableEventHandler addRating addResources
syn keyword     sqfCommand      addScore addScoreSide addSecondaryWeaponItem
syn keyword     sqfCommand      addSwitchableUnit addTeamMember addToRemainsCollector
syn keyword     sqfCommand      addTorque addUniform addUserActionEventHandler
syn keyword     sqfCommand      addVehicle addVest addWaypoint addWeapon addWeaponCargo
syn keyword     sqfCommand      addWeaponCargoGlobal addWeaponGlobal addWeaponItem
syn keyword     sqfCommand      addWeaponPool addWeaponTurret
syn keyword     sqfCommand      addWeaponWithAttachmentsCargo
syn keyword     sqfCommand      addWeaponWithAttachmentsCargoGlobal admin agent agents
syn keyword     sqfCommand      AGLToASL aimedAtTarget aimPos airDensityCurveRTD
syn keyword     sqfCommand      airDensityRTD airplaneThrottle airportSide
syn keyword     sqfCommand      AISFinishHeal alive all3DENEntities
syn keyword     sqfCommand      allActiveTitleEffects allAddonsInfo allAirports
syn keyword     sqfCommand      allControls allCurators allCutLayers allDead allDeadMen
syn keyword     sqfCommand      allDiaryRecords allDiarySubjects allDisplays
syn keyword     sqfCommand      allEnv3DSoundSources allGroups allLODs allMapMarkers
syn keyword     sqfCommand      allMines allMissionObjects allObjects allow3DMode
syn keyword     sqfCommand      allowCrewInImmobile allowCuratorLogicIgnoreAreas
syn keyword     sqfCommand      allowDamage allowDammage allowedService
syn keyword     sqfCommand      allowFileOperations allowFleeing allowGetIn
syn keyword     sqfCommand      allowService allowSprint allPlayers allSimpleObjects
syn keyword     sqfCommand      allSites allTurrets allUnits allUnitsUAV allUsers
syn keyword     sqfCommand      allVariables ambientTemperature ammo ammoOnPylon and
syn keyword     sqfCommand      animate animateBay animateDoor animatePylon
syn keyword     sqfCommand      animateSource animationNames animationPhase
syn keyword     sqfCommand      animationSourcePhase animationState apertureParams
syn keyword     sqfCommand      append apply armoryPoints arrayIntersect asin ASLToAGL
syn keyword     sqfCommand      ASLToATL assert assignAsCargo assignAsCargoIndex
syn keyword     sqfCommand      assignAsCommander assignAsDriver assignAsGunner
syn keyword     sqfCommand      assignAsTurret assignCurator assignedCargo
syn keyword     sqfCommand      assignedCommander assignedDriver assignedGroup
syn keyword     sqfCommand      assignedGunner assignedItems assignedTarget
syn keyword     sqfCommand      assignedTeam assignedVehicle assignedVehicleRole
syn keyword     sqfCommand      assignedVehicles assignItem assignTeam assignToAirport
syn keyword     sqfCommand      atan atan2 atg ATLToASL attachedObject attachedObjects
syn keyword     sqfCommand      attachedTo attachObject attachTo attackEnabled awake

syn keyword     sqfCommand      backpack backpackCargo backpackContainer backpackItems
syn keyword     sqfCommand      backpackMagazines backpacks backpackSpaceFor behaviour
syn keyword     sqfCommand      benchmark bezierInterpolation binocular binocularItems
syn keyword     sqfCommand      binocularMagazine blufor boundingBox boundingBoxReal
syn keyword     sqfCommand      boundingCenter brakesDisabled break breakOut breakTo
syn keyword     sqfCommand      breakWith briefingName buildingExit buildingPos
syn keyword     sqfCommand      buldozer_EnableRoadDiag buldozer_IsEnabledRoadDiag
syn keyword     sqfCommand      buldozer_LoadNewRoads buldozer_reloadOperMap
syn keyword     sqfCommand      buttonAction buttonSetAction

syn keyword     sqfCommand      cadetMode calculatePath
syn keyword     sqfCommand      calculatePlayerVisibilityByFriendly call callExtension
syn keyword     sqfCommand      camCommand camCommit camCommitPrepared camCommitted
syn keyword     sqfCommand      camConstuctionSetParams camCreate camDestroy
syn keyword     sqfCommand      cameraEffect cameraEffectEnableHUD cameraInterest
syn keyword     sqfCommand      cameraOn cameraView campaignConfigFile camPreload
syn keyword     sqfCommand      camPreloaded camPrepareBank camPrepareDir
syn keyword     sqfCommand      camPrepareDive camPrepareFocus camPrepareFov
syn keyword     sqfCommand      camPrepareFovRange camPreparePos camPrepareRelPos
syn keyword     sqfCommand      camPrepareTarget camSetBank camSetDir camSetDive
syn keyword     sqfCommand      camSetFocus camSetFov camSetFovRange camSetPos
syn keyword     sqfCommand      camSetRelPos camSetTarget camTarget camUseNVG canAdd
syn keyword     sqfCommand      canAddItemToBackpack canAddItemToUniform
syn keyword     sqfCommand      canAddItemToVest cancelSimpleTaskDestination
syn keyword     sqfCommand      canDeployWeapon canFire canMove canSlingLoad canStand
syn keyword     sqfCommand      canSuspend canTriggerDynamicSimulation
syn keyword     sqfCommand      canUnloadInCombat canVehicleCargo captive captiveNum
syn keyword     sqfCommand      case catch cbChecked cbSetChecked ceil channelEnabled
syn keyword     sqfCommand      cheatsEnabled checkAIFeature checkVisibility civilian
syn keyword     sqfCommand      className clear3DENAttribute clear3DENInventory
syn keyword     sqfCommand      clearAllItemsFromBackpack clearBackpackCargo
syn keyword     sqfCommand      clearBackpackCargoGlobal clearForcesRTD clearGroupIcons
syn keyword     sqfCommand      clearItemCargo clearItemCargoGlobal clearItemPool
syn keyword     sqfCommand      clearMagazineCargo clearMagazineCargoGlobal
syn keyword     sqfCommand      clearMagazinePool clearOverlay clearRadio
syn keyword     sqfCommand      clearWeaponCargo clearWeaponCargoGlobal clearWeaponPool
syn keyword     sqfCommand      clientOwner closeDialog closeDisplay closeOverlay
syn keyword     sqfCommand      collapseObjectTree collect3DENHistory collectiveRTD
syn keyword     sqfCommand      collisionDisabledWith combatBehaviour combatMode
syn keyword     sqfCommand      commandArtilleryFire commandChat commander commandFire
syn keyword     sqfCommand      commandFollow commandFSM commandGetOut commandingMenu
syn keyword     sqfCommand      commandMove commandRadio commandStop
syn keyword     sqfCommand      commandSuppressiveFire commandTarget commandWatch
syn keyword     sqfCommand      comment commitOverlay compatibleItems
syn keyword     sqfCommand      compatibleMagazines compile compileFinal compileScript
syn keyword     sqfCommand      completedFSM composeText configClasses configFile
syn keyword     sqfCommand      configHierarchy configName configNull configOf
syn keyword     sqfCommand      configProperties configSourceAddonList configSourceMod
syn keyword     sqfCommand      configSourceModList confirmSensorTarget
syn keyword     sqfCommand      connectTerminalToUAV connectToServer continue
syn keyword     sqfCommand      continueWith controlNull controlsGroupCtrl
syn keyword     sqfCommand      conversationDisabled copyFromClipboard copyToClipboard
syn keyword     sqfCommand      copyWaypoints cos count countEnemy countFriendly
syn keyword     sqfCommand      countSide countType countUnknown create3DENComposition
syn keyword     sqfCommand      create3DENEntity createAgent createCenter createDialog
syn keyword     sqfCommand      createDiaryLink createDiaryRecord createDiarySubject
syn keyword     sqfCommand      createDisplay createGearDialog createGroup
syn keyword     sqfCommand      createGuardedPoint createHashMap createHashMapFromArray
syn keyword     sqfCommand      createHashMapObject createLocation createMarker
syn keyword     sqfCommand      createMarkerLocal createMenu createMine
syn keyword     sqfCommand      createMissionDisplay createMPCampaignDisplay
syn keyword     sqfCommand      createSimpleObject createSimpleTask createSite
syn keyword     sqfCommand      createSoundSource createTask createTeam createTrigger
syn keyword     sqfCommand      createUnit createVehicle createVehicleCrew
syn keyword     sqfCommand      createVehicleLocal crew ctAddHeader ctAddRow ctClear
syn keyword     sqfCommand      ctCurSel ctData ctFindHeaderRows ctFindRowHeader
syn keyword     sqfCommand      ctHeaderControls ctHeaderCount ctRemoveHeaders
syn keyword     sqfCommand      ctRemoveRows ctrlActivate ctrlAddEventHandler ctrlAngle
syn keyword     sqfCommand      ctrlAnimateModel ctrlAnimationPhaseModel ctrlAt
syn keyword     sqfCommand      ctrlAutoScrollDelay ctrlAutoScrollRewind
syn keyword     sqfCommand      ctrlAutoScrollSpeed ctrlBackgroundColor ctrlChecked
syn keyword     sqfCommand      ctrlClassName ctrlCommit ctrlCommitted ctrlCreate
syn keyword     sqfCommand      ctrlDelete ctrlEnable ctrlEnabled ctrlFade
syn keyword     sqfCommand      ctrlFontHeight ctrlForegroundColor ctrlHTMLLoaded
syn keyword     sqfCommand      ctrlIDC ctrlIDD ctrlMapAnimAdd ctrlMapAnimClear
syn keyword     sqfCommand      ctrlMapAnimCommit ctrlMapAnimDone ctrlMapCursor
syn keyword     sqfCommand      ctrlMapDir ctrlMapMouseOver ctrlMapPosition
syn keyword     sqfCommand      ctrlMapScale ctrlMapScreenToWorld ctrlMapSetPosition
syn keyword     sqfCommand      ctrlMapWorldToScreen ctrlModel ctrlModelDirAndUp
syn keyword     sqfCommand      ctrlModelScale ctrlMousePosition ctrlParent
syn keyword     sqfCommand      ctrlParentControlsGroup ctrlPosition
syn keyword     sqfCommand      ctrlRemoveAllEventHandlers ctrlRemoveEventHandler
syn keyword     sqfCommand      ctrlScale ctrlScrollValues ctrlSetActiveColor
syn keyword     sqfCommand      ctrlSetAngle ctrlSetAutoScrollDelay
syn keyword     sqfCommand      ctrlSetAutoScrollRewind ctrlSetAutoScrollSpeed
syn keyword     sqfCommand      ctrlSetBackgroundColor ctrlSetChecked
syn keyword     sqfCommand      ctrlSetDisabledColor ctrlSetEventHandler ctrlSetFade
syn keyword     sqfCommand      ctrlSetFocus ctrlSetFont ctrlSetFontH1 ctrlSetFontH1B
syn keyword     sqfCommand      ctrlSetFontH2 ctrlSetFontH2B ctrlSetFontH3
syn keyword     sqfCommand      ctrlSetFontH3B ctrlSetFontH4 ctrlSetFontH4B
syn keyword     sqfCommand      ctrlSetFontH5 ctrlSetFontH5B ctrlSetFontH6
syn keyword     sqfCommand      ctrlSetFontH6B ctrlSetFontHeight ctrlSetFontHeightH1
syn keyword     sqfCommand      ctrlSetFontHeightH2 ctrlSetFontHeightH3
syn keyword     sqfCommand      ctrlSetFontHeightH4 ctrlSetFontHeightH5
syn keyword     sqfCommand      ctrlSetFontHeightH6 ctrlSetFontHeightSecondary
syn keyword     sqfCommand      ctrlSetFontP ctrlSetFontPB ctrlSetFontSecondary
syn keyword     sqfCommand      ctrlSetForegroundColor ctrlSetModel
syn keyword     sqfCommand      ctrlSetModelDirAndUp ctrlSetModelScale
syn keyword     sqfCommand      ctrlSetMousePosition ctrlSetPixelPrecision
syn keyword     sqfCommand      ctrlSetPosition ctrlSetPositionH ctrlSetPositionW
syn keyword     sqfCommand      ctrlSetPositionX ctrlSetPositionY ctrlSetScale
syn keyword     sqfCommand      ctrlSetScrollValues ctrlSetShadow ctrlSetStructuredText
syn keyword     sqfCommand      ctrlSetText ctrlSetTextColor ctrlSetTextColorSecondary
syn keyword     sqfCommand      ctrlSetTextSecondary ctrlSetTextSelection
syn keyword     sqfCommand      ctrlSetTooltip ctrlSetTooltipColorBox
syn keyword     sqfCommand      ctrlSetTooltipColorShade ctrlSetTooltipColorText
syn keyword     sqfCommand      ctrlSetTooltipMaxWidth ctrlSetURL ctrlSetURLOverlayMode
syn keyword     sqfCommand      ctrlShadow ctrlShow ctrlShown ctrlStyle ctrlText
syn keyword     sqfCommand      ctrlTextColor ctrlTextHeight ctrlTextSecondary
syn keyword     sqfCommand      ctrlTextSelection ctrlTextWidth ctrlTooltip ctrlType
syn keyword     sqfCommand      ctrlURL ctrlURLOverlayMode ctrlVisible ctRowControls
syn keyword     sqfCommand      ctRowCount ctSetCurSel ctSetData ctSetHeaderTemplate
syn keyword     sqfCommand      ctSetRowTemplate ctSetValue ctValue curatorAddons
syn keyword     sqfCommand      curatorCamera curatorCameraArea
syn keyword     sqfCommand      curatorCameraAreaCeiling curatorCoef
syn keyword     sqfCommand      curatorEditableObjects curatorEditingArea
syn keyword     sqfCommand      curatorEditingAreaType curatorMouseOver curatorPoints
syn keyword     sqfCommand      curatorRegisteredObjects curatorSelected
syn keyword     sqfCommand      curatorSelectionPreset curatorWaypointCost
syn keyword     sqfCommand      current3DENOperation currentChannel currentCommand
syn keyword     sqfCommand      currentMagazine currentMagazineDetail
syn keyword     sqfCommand      currentMagazineDetailTurret currentMagazineTurret
syn keyword     sqfCommand      currentMuzzle currentNamespace currentPilot currentTask
syn keyword     sqfCommand      currentTasks currentThrowable currentVisionMode
syn keyword     sqfCommand      currentWaypoint currentWeapon currentWeaponMode
syn keyword     sqfCommand      currentWeaponTurret currentZeroing cursorObject
syn keyword     sqfCommand      cursorTarget customChat customRadio
syn keyword     sqfCommand      customWaypointPosition cutFadeOut cutObj cutRsc cutText

syn keyword     sqfCommand      damage date dateToNumber dayTime deActivateKey
syn keyword     sqfCommand      debriefingText debugFSM debugLog decayGraphValues
syn keyword     sqfCommand      default deg delete3DENEntities deleteAt deleteCenter
syn keyword     sqfCommand      deleteCollection deleteEditorObject deleteGroup
syn keyword     sqfCommand      deleteGroupWhenEmpty deleteIdentity deleteLocation
syn keyword     sqfCommand      deleteMarker deleteMarkerLocal deleteRange
syn keyword     sqfCommand      deleteResources deleteSite deleteStatus deleteTeam
syn keyword     sqfCommand      deleteVehicle deleteVehicleCrew deleteWaypoint detach
syn keyword     sqfCommand      detectedMines diag_activeMissionFSMs diag_activeScripts
syn keyword     sqfCommand      diag_activeSQFScripts diag_activeSQSScripts
syn keyword     sqfCommand      diag_allMissionEventHandlers diag_codePerformance
syn keyword     sqfCommand      diag_deltaTime diag_dynamicSimulationEnd diag_fps
syn keyword     sqfCommand      diag_fpsmin diag_frameno diag_lightNewLoad
syn keyword     sqfCommand      diag_localized diag_log diag_scope diag_setLightNew
syn keyword     sqfCommand      diag_stacktrace diag_testScriptSimpleVM diag_tickTime
syn keyword     sqfCommand      dialog diaryRecordNull diarySubjectExists didJIP
syn keyword     sqfCommand      didJIPOwner difficulty difficultyEnabled
syn keyword     sqfCommand      difficultyEnabledRTD difficultyOption direction
syn keyword     sqfCommand      directionStabilizationEnabled directSay disableAI
syn keyword     sqfCommand      disableBrakes disableCollisionWith disableConversation
syn keyword     sqfCommand      disableDebriefingStats disableMapIndicators
syn keyword     sqfCommand      disableNVGEquipment disableRemoteSensors
syn keyword     sqfCommand      disableSerialization disableTIEquipment
syn keyword     sqfCommand      disableUAVConnectability disableUserInput
syn keyword     sqfCommand      displayAddEventHandler displayChild displayCtrl
syn keyword     sqfCommand      displayNull displayParent displayRemoveAllEventHandlers
syn keyword     sqfCommand      displayRemoveEventHandler displaySetEventHandler
syn keyword     sqfCommand      displayUniqueName displayUpdate dissolveTeam distance
syn keyword     sqfCommand      distance2D distanceSqr distributionRegion do
syn keyword     sqfCommand      do3DENAction doArtilleryFire doFire doFollow doFSM
syn keyword     sqfCommand      doGetOut doMove doorPhase doStop doSuppressiveFire
syn keyword     sqfCommand      doTarget doWatch drawArrow drawEllipse drawIcon
syn keyword     sqfCommand      drawIcon3D drawLaser drawLine drawLine3D drawLink
syn keyword     sqfCommand      drawLocation drawPolygon drawRectangle drawTriangle
syn keyword     sqfCommand      driver drop dynamicSimulationDistance
syn keyword     sqfCommand      dynamicSimulationDistanceCoef dynamicSimulationEnabled
syn keyword     sqfCommand      dynamicSimulationSystemEnabled

syn keyword     sqfCommand      east echo edit3DENMissionAttributes editObject
syn keyword     sqfCommand      editorSetEventHandler effectiveCommander
syn keyword     sqfCommand      elevatePeriscope else emptyPositions enableAI
syn keyword     sqfCommand      enableAIFeature enableAimPrecision enableAttack
syn keyword     sqfCommand      enableAudioFeature enableAutoStartUpRTD
syn keyword     sqfCommand      enableAutoTrimRTD enableCamShake enableCaustics
syn keyword     sqfCommand      enableChannel enableCollisionWith enableCopilot
syn keyword     sqfCommand      enableDebriefingStats enableDiagLegend
syn keyword     sqfCommand      enableDirectionStabilization enableDynamicSimulation
syn keyword     sqfCommand      enableDynamicSimulationSystem enableEndDialog
syn keyword     sqfCommand      enableEngineArtillery enableEnvironment enableFatigue
syn keyword     sqfCommand      enableGunLights enableInfoPanelComponent enableIRLasers
syn keyword     sqfCommand      enableMimics enablePersonTurret enableRadio
syn keyword     sqfCommand      enableReload enableRopeAttach enableSatNormalOnDetail
syn keyword     sqfCommand      enableSaving enableSentences enableSimulation
syn keyword     sqfCommand      enableSimulationGlobal enableStamina enableStressDamage
syn keyword     sqfCommand      enableTeamSwitch enableTraffic enableUAVConnectability
syn keyword     sqfCommand      enableUAVWaypoints enableVehicleCargo
syn keyword     sqfCommand      enableVehicleSensor enableWeaponDisassembly endl
syn keyword     sqfCommand      endLoadingScreen endMission engineOn enginesIsOnRTD
syn keyword     sqfCommand      enginesPowerRTD enginesRpmRTD enginesTorqueRTD entities
syn keyword     sqfCommand      environmentEnabled environmentVolume equipmentDisabled
syn keyword     sqfCommand      estimatedEndServerTime estimatedTimeLeft
syn keyword     sqfCommand      evalObjectArgument everyBackpack everyContainer exec
syn keyword     sqfCommand      execEditorScript execFSM execVM exit exitWith exp
syn keyword     sqfCommand      expectedDestination exportJIPMessages eyeDirection
syn keyword     sqfCommand      eyePos

syn keyword     sqfCommand      face faction fadeEnvironment fadeMusic fadeRadio
syn keyword     sqfCommand      fadeSound fadeSpeech failMission fileExists
syn keyword     sqfCommand      fillWeaponsFromPool find findAny findCover findDisplay
syn keyword     sqfCommand      findEditorObject findEmptyPosition
syn keyword     sqfCommand      findEmptyPositionReady findIf findNearestEnemy
syn keyword     sqfCommand      finishMissionInit finite fire fireAtTarget
syn keyword     sqfCommand      firstBackpack flag flagAnimationPhase flagOwner
syn keyword     sqfCommand      flagSide flagTexture flatten fleeing floor flyInHeight
syn keyword     sqfCommand      flyInHeightASL focusedCtrl focusOn fog fogForecast
syn keyword     sqfCommand      fogParams for forceAddUniform forceAtPositionRTD
syn keyword     sqfCommand      forceCadetDifficulty forcedMap forceEnd
syn keyword     sqfCommand      forceFlagTexture forceFollowRoad forceGeneratorRTD
syn keyword     sqfCommand      forceMap forceRespawn forceSpeed forceUnicode forceWalk
syn keyword     sqfCommand      forceWeaponFire forceWeatherChange forEach
syn keyword     sqfCommand      forEachMember forEachMemberAgent forEachMemberTeam
syn keyword     sqfCommand      forEachReversed forgetTarget format formation
syn keyword     sqfCommand      formationDirection formationLeader formationMembers
syn keyword     sqfCommand      formationPosition formationTask formatText formLeader
syn keyword     sqfCommand      freeExtension freeLook from fromEditor fuel fullCrew

syn keyword     sqfCommand      gearIDCAmmoCount gearSlotAmmoCount gearSlotData
syn keyword     sqfCommand      gestureState get get3DENActionState get3DENAttribute
syn keyword     sqfCommand      get3DENCamera get3DENConnections get3DENEntity
syn keyword     sqfCommand      get3DENEntityID get3DENGrid get3DENIconsVisible
syn keyword     sqfCommand      get3DENLayerEntities get3DENLinesVisible
syn keyword     sqfCommand      get3DENMissionAttribute get3DENMouseOver
syn keyword     sqfCommand      get3DENSelected getAimingCoef
syn keyword     sqfCommand      getAllEnv3DSoundControllers getAllEnvSoundControllers
syn keyword     sqfCommand      getAllHitPointsDamage getAllOwnedMines getAllPylonsInfo
syn keyword     sqfCommand      getAllSoundControllers getAllUnitTraits getAmmoCargo
syn keyword     sqfCommand      getAnimAimPrecision getAnimSpeedCoef getArray
syn keyword     sqfCommand      getArtilleryAmmo getArtilleryComputerSettings
syn keyword     sqfCommand      getArtilleryETA getAssetDLCInfo getAssignedCuratorLogic
syn keyword     sqfCommand      getAssignedCuratorUnit getAttackTarget
syn keyword     sqfCommand      getAudioOptionVolumes getBackpackCargo
syn keyword     sqfCommand      getBleedingRemaining getBurningValue
syn keyword     sqfCommand      getCalculatePlayerVisibilityByFriendly
syn keyword     sqfCommand      getCameraViewDirection getCargoIndex getCenterOfMass
syn keyword     sqfCommand      getClientState getClientStateNumber
syn keyword     sqfCommand      getCompatiblePylonMagazines getConnectedUAV
syn keyword     sqfCommand      getConnectedUAVUnit getContainerMaxLoad getCorpse
syn keyword     sqfCommand      getCruiseControl getCursorObjectParams getCustomAimCoef
syn keyword     sqfCommand      getCustomSoundController getCustomSoundControllerCount
syn keyword     sqfCommand      getDammage getDebriefingText getDescription getDir
syn keyword     sqfCommand      getDirVisual getDiverState getDLCAssetsUsage
syn keyword     sqfCommand      getDLCAssetsUsageByName getDLCs getDLCUsageTime
syn keyword     sqfCommand      getEditorCamera getEditorMode getEditorObjectScope
syn keyword     sqfCommand      getElevationOffset getEngineTargetRPMRTD
syn keyword     sqfCommand      getEnv3DSoundController getEnvSoundController
syn keyword     sqfCommand      getEventHandlerInfo getFatigue getFieldManualStartPage
syn keyword     sqfCommand      getForcedFlagTexture getForcedSpeed getFriend
syn keyword     sqfCommand      getFSMVariable getFuelCargo getFuelConsumptionCoef
syn keyword     sqfCommand      getGraphValues getGroupIcon getGroupIconParams
syn keyword     sqfCommand      getGroupIcons getHideFrom getHit getHitIndex
syn keyword     sqfCommand      getHitPointDamage getItemCargo getLighting
syn keyword     sqfCommand      getLightingAt getLoadedModsInfo getMagazineCargo
syn keyword     sqfCommand      getMarkerColor getMarkerPos getMarkerSize getMarkerType
syn keyword     sqfCommand      getMass getMissionConfig getMissionConfigValue
syn keyword     sqfCommand      getMissionDLCs getMissionLayerEntities getMissionLayers
syn keyword     sqfCommand      getMissionPath getModelInfo getMousePosition
syn keyword     sqfCommand      getMusicPlayedTime getNumber getObjectArgument
syn keyword     sqfCommand      getObjectChildren getObjectDLC getObjectFOV getObjectID
syn keyword     sqfCommand      getObjectMaterials getObjectProxy getObjectScale
syn keyword     sqfCommand      getObjectTextures getObjectType getObjectViewDistance
syn keyword     sqfCommand      getOpticsMode getOrDefault getOrDefaultCall
syn keyword     sqfCommand      getOxygenRemaining getPersonUsedDLCs
syn keyword     sqfCommand      getPilotCameraDirection getPilotCameraOpticsMode
syn keyword     sqfCommand      getPilotCameraPosition getPilotCameraRotation
syn keyword     sqfCommand      getPilotCameraTarget getPiPViewDistance getPlateNumber
syn keyword     sqfCommand      getPlayerChannel getPlayerID getPlayerScores
syn keyword     sqfCommand      getPlayerUID getPlayerVoNVolume getPos getPosASL
syn keyword     sqfCommand      getPosASLVisual getPosASLW getPosATL getPosATLVisual
syn keyword     sqfCommand      getPosVisual getPosWorld getPosWorldVisual
syn keyword     sqfCommand      getPylonMagazines getRelDir getRelPos
syn keyword     sqfCommand      getRemoteSensorsDisabled getRepairCargo getResolution
syn keyword     sqfCommand      getRoadInfo getRotorBrakeRTD getSensorTargets
syn keyword     sqfCommand      getSensorThreats getShadowDistance getShotParents
syn keyword     sqfCommand      getSlingLoad getSlotItemName getSoundController
syn keyword     sqfCommand      getSoundControllerResult getSpeed getStamina
syn keyword     sqfCommand      getStatValue getSteamFriendsServers getSubtitleOptions
syn keyword     sqfCommand      getSuppression getTerrainGrid getTerrainHeight
syn keyword     sqfCommand      getTerrainHeightASL getTerrainInfo getText getTextRaw
syn keyword     sqfCommand      getTextureInfo getTextWidth getTiParameters
syn keyword     sqfCommand      getTotalDLCUsageTime getTowParent getTrimOffsetRTD
syn keyword     sqfCommand      getTurretLimits getTurretOpticsMode getUnitFreefallInfo
syn keyword     sqfCommand      getUnitLoadout getUnitTrait getUnloadInCombat
syn keyword     sqfCommand      getUserInfo getUserMFDText getUserMFDValue getVariable
syn keyword     sqfCommand      getVehicleCargo getVehicleTiPars getVideoOptions
syn keyword     sqfCommand      getWaterFillPercentage getWaterLeakiness getWeaponCargo
syn keyword     sqfCommand      getWeaponSway getWingsOrientationRTD
syn keyword     sqfCommand      getWingsPositionRTD getWPPos glanceAt globalChat
syn keyword     sqfCommand      globalRadio goggles goto group groupChat groupFromNetId
syn keyword     sqfCommand      groupIconSelectable groupIconsVisible groupID
syn keyword     sqfCommand      groupOwner groupRadio groups groupSelectedUnits
syn keyword     sqfCommand      groupSelectUnit grpNull gunner gusts

syn keyword     sqfCommand      halt handgunItems handgunMagazine handgunWeapon
syn keyword     sqfCommand      handsHit hashValue hasInterface hasPilotCamera
syn keyword     sqfCommand      hasWeapon hcAllGroups hcGroupParams hcLeader
syn keyword     sqfCommand      hcRemoveAllGroups hcRemoveGroup hcSelected
syn keyword     sqfCommand      hcSelectGroup hcSetGroup hcShowBar hcShownBar headgear
syn keyword     sqfCommand      hideBody hideObject hideObjectGlobal hideSelection hint
syn keyword     sqfCommand      hintC hintCadet hintSilent hmd hostMission htmlLoad
syn keyword     sqfCommand      HUDMovementLevels humidity

syn keyword     sqfCommand      if image importAllGroups importance in inArea
syn keyword     sqfCommand      inAreaArray inAreaArrayIndexes incapacitatedState
syn keyword     sqfCommand      independent inflame inflamed infoPanel
syn keyword     sqfCommand      infoPanelComponentEnabled infoPanelComponents
syn keyword     sqfCommand      infoPanels inGameUISetEventHandler inheritsFrom
syn keyword     sqfCommand      initAmbientLife inPolygon inputAction inputController
syn keyword     sqfCommand      inputMouse inRangeOfArtillery insert insertEditorObject
syn keyword     sqfCommand      insideBuilding intersect is3DEN is3DENMultiplayer
syn keyword     sqfCommand      is3DENPreview isAbleToBreathe isActionMenuVisible
syn keyword     sqfCommand      isAgent isAimPrecisionEnabled isAllowedCrewInImmobile
syn keyword     sqfCommand      isArray isAutoHoverOn isAutonomous
syn keyword     sqfCommand      isAutoStartUpEnabledRTD isAutotest isAutoTrimOnRTD
syn keyword     sqfCommand      isAwake isBleeding isBurning isClass isCollisionLightOn
syn keyword     sqfCommand      isCopilotEnabled isDamageAllowed isDedicated
syn keyword     sqfCommand      isDLCAvailable isEngineOn isEqualRef isEqualTo
syn keyword     sqfCommand      isEqualType isEqualTypeAll isEqualTypeAny
syn keyword     sqfCommand      isEqualTypeArray isEqualTypeParams
syn keyword     sqfCommand      isFilePatchingEnabled isFinal isFlashlightOn
syn keyword     sqfCommand      isFlatEmpty isForcedWalk isFormationLeader
syn keyword     sqfCommand      isGameFocused isGamePaused isGroupDeletedWhenEmpty
syn keyword     sqfCommand      isHidden isInRemainsCollector isInstructorFigureEnabled
syn keyword     sqfCommand      isIRLaserOn isKeyActive isKindOf isLaserOn isLightOn
syn keyword     sqfCommand      isLocalized isManualFire isMarkedForCollection
syn keyword     sqfCommand      isMissionProfileNamespaceLoaded isMultiplayer
syn keyword     sqfCommand      isMultiplayerSolo isNil isNotEqualRef isNotEqualTo
syn keyword     sqfCommand      isNull isNumber isObjectHidden isObjectRTD isOnRoad
syn keyword     sqfCommand      isPiPEnabled isPlayer isRealTime isRemoteControlling
syn keyword     sqfCommand      isRemoteExecuted isRemoteExecutedJIP isSaving
syn keyword     sqfCommand      isSensorTargetConfirmed isServer isShowing3DIcons
syn keyword     sqfCommand      isSimpleObject isSprintAllowed isStaminaEnabled
syn keyword     sqfCommand      isSteamMission isSteamOverlayEnabled
syn keyword     sqfCommand      isStreamFriendlyUIEnabled isStressDamageEnabled isText
syn keyword     sqfCommand      isTouchingGround isTurnedOut isTutHintsEnabled
syn keyword     sqfCommand      isUAVConnectable isUAVConnected isUIContext
syn keyword     sqfCommand      isUniformAllowed isVehicleCargo isVehicleRadarOn
syn keyword     sqfCommand      isVehicleSensorEnabled isWalking isWeaponDeployed
syn keyword     sqfCommand      isWeaponRested itemCargo items itemsWithMagazines

syn keyword     sqfCommand      join joinAs joinAsSilent joinSilent joinString

syn keyword     sqfCommand      kbAddDatabase kbAddDatabaseTargets kbAddTopic
syn keyword     sqfCommand      kbHasTopic kbReact kbRemoveTopic kbTell kbWasSaid
syn keyword     sqfCommand      keyImage keyName keys knowsAbout

syn keyword     sqfCommand      land landAt landResult language laserTarget lbAdd
syn keyword     sqfCommand      lbClear lbColor lbColorRight lbCurSel lbData lbDelete
syn keyword     sqfCommand      lbIsSelected lbPicture lbPictureRight lbSelection
syn keyword     sqfCommand      lbSetColor lbSetColorRight lbSetCurSel lbSetData
syn keyword     sqfCommand      lbSetPicture lbSetPictureColor
syn keyword     sqfCommand      lbSetPictureColorDisabled lbSetPictureColorSelected
syn keyword     sqfCommand      lbSetPictureRight lbSetPictureRightColor
syn keyword     sqfCommand      lbSetPictureRightColorDisabled
syn keyword     sqfCommand      lbSetPictureRightColorSelected lbSetSelectColor
syn keyword     sqfCommand      lbSetSelectColorRight lbSetSelected lbSetText
syn keyword     sqfCommand      lbSetTextRight lbSetTooltip lbSetValue lbSize lbSort
syn keyword     sqfCommand      lbSortBy lbSortByValue lbText lbTextRight lbTooltip
syn keyword     sqfCommand      lbValue leader leaderboardDeInit leaderboardGetRows
syn keyword     sqfCommand      leaderboardInit leaderboardRequestRowsFriends
syn keyword     sqfCommand      leaderboardRequestRowsGlobal
syn keyword     sqfCommand      leaderboardRequestRowsGlobalAroundUser
syn keyword     sqfCommand      leaderboardsRequestUploadScore
syn keyword     sqfCommand      leaderboardsRequestUploadScoreKeepBest leaderboardState
syn keyword     sqfCommand      leaveVehicle libraryCredits libraryDisclaimers
syn keyword     sqfCommand      lifeState lightAttachObject lightDetachObject lightIsOn
syn keyword     sqfCommand      lightnings limitSpeed linearConversion lineBreak
syn keyword     sqfCommand      lineIntersects lineIntersectsObjs
syn keyword     sqfCommand      lineIntersectsSurfaces lineIntersectsWith linkItem list
syn keyword     sqfCommand      listObjects listRemoteTargets listVehicleSensors ln
syn keyword     sqfCommand      lnbAddArray lnbAddColumn lnbAddRow lnbClear lnbColor
syn keyword     sqfCommand      lnbColorRight lnbCurSelRow lnbData lnbDeleteColumn
syn keyword     sqfCommand      lnbDeleteRow lnbGetColumnsPosition lnbPicture
syn keyword     sqfCommand      lnbPictureRight lnbSetColor lnbSetColorRight
syn keyword     sqfCommand      lnbSetColumnsPos lnbSetCurSelRow lnbSetData
syn keyword     sqfCommand      lnbSetPicture lnbSetPictureColor
syn keyword     sqfCommand      lnbSetPictureColorRight lnbSetPictureColorSelected
syn keyword     sqfCommand      lnbSetPictureColorSelectedRight lnbSetPictureRight
syn keyword     sqfCommand      lnbSetText lnbSetTextRight lnbSetTooltip lnbSetValue
syn keyword     sqfCommand      lnbSize lnbSort lnbSortBy lnbSortByValue lnbText
syn keyword     sqfCommand      lnbTextRight lnbValue load loadAbs loadBackpack
syn keyword     sqfCommand      loadConfig loadCuratorSelectionPreset loadFile loadGame
syn keyword     sqfCommand      loadIdentity loadMagazine loadOverlay loadStatus
syn keyword     sqfCommand      loadUniform loadVest local localize localNamespace
syn keyword     sqfCommand      locationNull locationPosition lock lockCameraTo
syn keyword     sqfCommand      lockCargo lockDriver locked lockedCameraTo lockedCargo
syn keyword     sqfCommand      lockedDriver lockedInventory lockedTurret lockIdentity
syn keyword     sqfCommand      lockInventory lockTurret lockWp log logEntities
syn keyword     sqfCommand      logNetwork logNetworkTerminate lookAt lookAtPos

syn keyword     sqfCommand      magazineCargo magazines magazinesAllTurrets
syn keyword     sqfCommand      magazinesAmmo magazinesAmmoCargo magazinesAmmoFull
syn keyword     sqfCommand      magazinesDetail magazinesDetailBackpack
syn keyword     sqfCommand      magazinesDetailUniform magazinesDetailVest
syn keyword     sqfCommand      magazinesTurret magazineTurretAmmo mapAnimAdd
syn keyword     sqfCommand      mapAnimClear mapAnimCommit mapAnimDone
syn keyword     sqfCommand      mapCenterOnCamera mapGridPosition markAsFinishedOnSteam
syn keyword     sqfCommand      markerAlpha markerBrush markerChannel markerColor
syn keyword     sqfCommand      markerDir markerDrawPriority markerPolyline markerPos
syn keyword     sqfCommand      markerShadow markerShape markerSize markerText
syn keyword     sqfCommand      markerType matrixMultiply matrixTranspose max maxLoad
syn keyword     sqfCommand      members menuAction menuAdd menuChecked menuClear
syn keyword     sqfCommand      menuCollapse menuData menuDelete menuEnable menuEnabled
syn keyword     sqfCommand      menuExpand menuHover menuPicture menuSetAction
syn keyword     sqfCommand      menuSetCheck menuSetData menuSetPicture menuSetShortcut
syn keyword     sqfCommand      menuSetText menuSetURL menuSetValue menuShortcut
syn keyword     sqfCommand      menuShortcutText menuSize menuSort menuText menuURL
syn keyword     sqfCommand      menuValue merge min mineActive mineDetectedBy
syn keyword     sqfCommand      missileTarget missileTargetPos missionConfigFile
syn keyword     sqfCommand      missionDifficulty missionEnd missionName
syn keyword     sqfCommand      missionNameSource missionNamespace
syn keyword     sqfCommand      missionProfileNamespace missionStart missionVersion mod
syn keyword     sqfCommand      modelToWorld modelToWorldVisual modelToWorldVisualWorld
syn keyword     sqfCommand      modelToWorldWorld modParams moonIntensity moonPhase
syn keyword     sqfCommand      morale move move3DENCamera moveInAny moveInCargo
syn keyword     sqfCommand      moveInCommander moveInDriver moveInGunner moveInTurret
syn keyword     sqfCommand      moveObjectToEnd moveOut moveTime moveTo moveToCompleted
syn keyword     sqfCommand      moveToFailed musicVolume

syn keyword     sqfCommand      name namedProperties nameSound nearEntities
syn keyword     sqfCommand      nearestBuilding nearestLocation nearestLocations
syn keyword     sqfCommand      nearestLocationWithDubbing nearestMines nearestObject
syn keyword     sqfCommand      nearestObjects nearestTerrainObjects nearObjects
syn keyword     sqfCommand      nearObjectsReady nearRoads nearSupplies nearTargets
syn keyword     sqfCommand      needReload needService netId netObjNull newOverlay
syn keyword     sqfCommand      nextMenuItemIndex nextWeatherChange nil nMenuItems not
syn keyword     sqfCommand      numberOfEnginesRTD numberToDate

syn keyword     sqfCommand      objectCurators objectFromNetId objectParent objNull
syn keyword     sqfCommand      objStatus onBriefingGroup onBriefingNotes
syn keyword     sqfCommand      onBriefingPlan onBriefingTeamSwitch
syn keyword     sqfCommand      onCommandModeChanged onDoubleClick onEachFrame
syn keyword     sqfCommand      onGroupIconClick onGroupIconOverEnter
syn keyword     sqfCommand      onGroupIconOverLeave onHCGroupSelectionChanged
syn keyword     sqfCommand      onMapSingleClick onPlayerConnected onPlayerDisconnected
syn keyword     sqfCommand      onPreloadFinished onPreloadStarted onShowNewObject
syn keyword     sqfCommand      onTeamSwitch openCuratorInterface openDLCPage openGPS
syn keyword     sqfCommand      openMap openSteamApp openYoutubeVideo opfor or
syn keyword     sqfCommand      orderGetIn overcast overcastForecast owner

syn keyword     sqfCommand      param params parseNumber parseSimpleArray parseText
syn keyword     sqfCommand      parsingNamespace particlesQuality periscopeElevation pi
syn keyword     sqfCommand      pickWeaponPool pitch pixelGrid pixelGridBase
syn keyword     sqfCommand      pixelGridNoUIScale pixelH pixelW playableSlotsNumber
syn keyword     sqfCommand      playableUnits playAction playActionNow player
syn keyword     sqfCommand      playerRespawnTime playerSide playersNumber playGesture
syn keyword     sqfCommand      playMission playMove playMoveNow playMusic
syn keyword     sqfCommand      playScriptedMission playSound playSound3D playSoundUI
syn keyword     sqfCommand      pose position positionCameraToWorld posScreenToWorld
syn keyword     sqfCommand      posWorldToScreen ppEffectAdjust ppEffectCommit
syn keyword     sqfCommand      ppEffectCommitted ppEffectCreate ppEffectDestroy
syn keyword     sqfCommand      ppEffectEnable ppEffectEnabled ppEffectForceInNVG
syn keyword     sqfCommand      precision preloadCamera preloadObject preloadSound
syn keyword     sqfCommand      preloadTitleObj preloadTitleRsc preprocessFile
syn keyword     sqfCommand      preprocessFileLineNumbers primaryWeapon
syn keyword     sqfCommand      primaryWeaponItems primaryWeaponMagazine priority
syn keyword     sqfCommand      private processDiaryLink productVersion profileName
syn keyword     sqfCommand      profileNamespace profileNameSteam progressLoadingScreen
syn keyword     sqfCommand      progressPosition progressSetPosition publicVariable
syn keyword     sqfCommand      publicVariableClient publicVariableServer pushBack
syn keyword     sqfCommand      pushBackUnique putWeaponPool

syn keyword     sqfCommand      queryItemsPool queryMagazinePool queryWeaponPool

syn keyword     sqfCommand      rad radioChannelAdd radioChannelCreate radioChannelInfo
syn keyword     sqfCommand      radioChannelRemove radioChannelSetCallSign
syn keyword     sqfCommand      radioChannelSetLabel radioEnabled radioVolume rain
syn keyword     sqfCommand      rainbow rainParams random rank rankId rating
syn keyword     sqfCommand      rectangular regexFind regexMatch regexReplace
syn keyword     sqfCommand      registeredTasks registerTask reload reloadEnabled
syn keyword     sqfCommand      remoteControl remoteControlled remoteExec
syn keyword     sqfCommand      remoteExecCall remoteExecutedOwner remove3DENConnection
syn keyword     sqfCommand      remove3DENEventHandler remove3DENLayer removeAction
syn keyword     sqfCommand      removeAll3DENEventHandlers removeAllActions
syn keyword     sqfCommand      removeAllAssignedItems removeAllBinocularItems
syn keyword     sqfCommand      removeAllContainers removeAllCuratorAddons
syn keyword     sqfCommand      removeAllCuratorCameraAreas
syn keyword     sqfCommand      removeAllCuratorEditingAreas removeAllEventHandlers
syn keyword     sqfCommand      removeAllHandgunItems removeAllItems
syn keyword     sqfCommand      removeAllItemsWithMagazines
syn keyword     sqfCommand      removeAllMissionEventHandlers removeAllMPEventHandlers
syn keyword     sqfCommand      removeAllMusicEventHandlers removeAllOwnedMines
syn keyword     sqfCommand      removeAllPrimaryWeaponItems
syn keyword     sqfCommand      removeAllSecondaryWeaponItems
syn keyword     sqfCommand      removeAllUserActionEventHandlers removeAllWeapons
syn keyword     sqfCommand      removeBackpack removeBackpackGlobal removeBinocularItem
syn keyword     sqfCommand      removeCuratorAddons removeCuratorCameraArea
syn keyword     sqfCommand      removeCuratorEditableObjects removeCuratorEditingArea
syn keyword     sqfCommand      removeDiaryRecord removeDiarySubject removeDrawIcon
syn keyword     sqfCommand      removeDrawLinks removeEventHandler
syn keyword     sqfCommand      removeFromRemainsCollector removeGoggles
syn keyword     sqfCommand      removeGroupIcon removeHandgunItem removeHeadgear
syn keyword     sqfCommand      removeItem removeItemFromBackpack removeItemFromUniform
syn keyword     sqfCommand      removeItemFromVest removeItems removeMagazine
syn keyword     sqfCommand      removeMagazineGlobal removeMagazines
syn keyword     sqfCommand      removeMagazinesTurret removeMagazineTurret
syn keyword     sqfCommand      removeMenuItem removeMissionEventHandler
syn keyword     sqfCommand      removeMPEventHandler removeMusicEventHandler
syn keyword     sqfCommand      removeOwnedMine removePrimaryWeaponItem
syn keyword     sqfCommand      removeSecondaryWeaponItem removeSimpleTask
syn keyword     sqfCommand      removeSwitchableUnit removeTeamMember removeUniform
syn keyword     sqfCommand      removeUserActionEventHandler removeVest removeWeapon
syn keyword     sqfCommand      removeWeaponAttachmentCargo removeWeaponCargo
syn keyword     sqfCommand      removeWeaponGlobal removeWeaponTurret
syn keyword     sqfCommand      reportRemoteTarget requiredVersion resetCamShake
syn keyword     sqfCommand      resetSubgroupDirection resistance resize resources
syn keyword     sqfCommand      respawnVehicle restartEditorCamera reveal revealMine
syn keyword     sqfCommand      reverse reversedMouseY roadAt roadsConnectedTo
syn keyword     sqfCommand      roleDescription ropeAttachedObjects ropeAttachedTo
syn keyword     sqfCommand      ropeAttachEnabled ropeAttachTo ropeCreate ropeCut
syn keyword     sqfCommand      ropeDestroy ropeDetach ropeEndPosition ropeLength ropes
syn keyword     sqfCommand      ropesAttachedTo ropeSegments ropeUnwind ropeUnwound
syn keyword     sqfCommand      rotorsForcesRTD rotorsRpmRTD round runInitScript

syn keyword     sqfCommand      safeZoneH safeZoneW safeZoneWAbs safeZoneX safeZoneXAbs
syn keyword     sqfCommand      safeZoneY save3DENInventory saveGame saveIdentity
syn keyword     sqfCommand      saveJoysticks saveMissionProfileNamespace saveOverlay
syn keyword     sqfCommand      saveProfileNamespace saveStatus saveVar savingEnabled
syn keyword     sqfCommand      say say2D say3D scopeName score scoreSide screenshot
syn keyword     sqfCommand      screenToWorld scriptDone scriptName scriptNull
syn keyword     sqfCommand      scudState secondaryWeapon secondaryWeaponItems
syn keyword     sqfCommand      secondaryWeaponMagazine select selectBestPlaces
syn keyword     sqfCommand      selectDiarySubject selectedEditorObjects
syn keyword     sqfCommand      selectEditorObject selectionNames selectionPosition
syn keyword     sqfCommand      selectionVectorDirAndUp selectLeader selectMax
syn keyword     sqfCommand      selectMin selectNoPlayer selectPlayer selectRandom
syn keyword     sqfCommand      selectRandomWeighted selectWeapon selectWeaponTurret
syn keyword     sqfCommand      sendAUMessage sendSimpleCommand sendTask sendTaskResult
syn keyword     sqfCommand      sendUDPMessage sentencesEnabled serverCommand
syn keyword     sqfCommand      serverCommandAvailable serverCommandExecutable
syn keyword     sqfCommand      serverName serverNamespace serverTime set
syn keyword     sqfCommand      set3DENAttribute set3DENAttributes set3DENGrid
syn keyword     sqfCommand      set3DENIconsVisible set3DENLayer set3DENLinesVisible
syn keyword     sqfCommand      set3DENLogicType set3DENMissionAttribute
syn keyword     sqfCommand      set3DENMissionAttributes set3DENModelsVisible
syn keyword     sqfCommand      set3DENObjectType set3DENSelected setAccTime
syn keyword     sqfCommand      setActualCollectiveRTD setAirplaneThrottle
syn keyword     sqfCommand      setAirportSide setAmmo setAmmoCargo setAmmoOnPylon
syn keyword     sqfCommand      setAnimSpeedCoef setAperture setApertureNew
syn keyword     sqfCommand      setArmoryPoints setAttributes setAutonomous
syn keyword     sqfCommand      setBehaviour setBehaviourStrong setBleedingRemaining
syn keyword     sqfCommand      setBrakesRTD setCameraInterest setCamShakeDefParams
syn keyword     sqfCommand      setCamShakeParams setCamUseTi setCaptive
syn keyword     sqfCommand      setCenterOfMass setCollisionLight setCombatBehaviour
syn keyword     sqfCommand      setCombatMode setCompassOscillation setConvoySeparation
syn keyword     sqfCommand      setCruiseControl setCuratorCameraAreaCeiling
syn keyword     sqfCommand      setCuratorCoef setCuratorEditingAreaType
syn keyword     sqfCommand      setCuratorSelected setCuratorSelectionPreset
syn keyword     sqfCommand      setCuratorWaypointCost setCurrentChannel setCurrentTask
syn keyword     sqfCommand      setCurrentWaypoint setCustomAimCoef
syn keyword     sqfCommand      SetCustomMissionData setCustomSoundController
syn keyword     sqfCommand      setCustomWeightRTD setDamage setDammage setDate
syn keyword     sqfCommand      setDebriefingText setDefaultCamera setDestination
syn keyword     sqfCommand      setDetailMapBlendPars setDiaryRecordText
syn keyword     sqfCommand      setDiarySubjectPicture setDir setDirection setDrawIcon
syn keyword     sqfCommand      setDriveOnPath setDropInterval
syn keyword     sqfCommand      setDynamicSimulationDistance
syn keyword     sqfCommand      setDynamicSimulationDistanceCoef setEditorMode
syn keyword     sqfCommand      setEditorObjectScope setEffectCondition
syn keyword     sqfCommand      setEffectiveCommander setEngineRpmRTD setFace
syn keyword     sqfCommand      setFaceanimation setFatigue setFeatureType
syn keyword     sqfCommand      setFlagAnimationPhase setFlagOwner setFlagSide
syn keyword     sqfCommand      setFlagTexture setFog setForceGeneratorRTD setFormation
syn keyword     sqfCommand      setFormationTask setFormDir setFriend setFromEditor
syn keyword     sqfCommand      setFSMVariable setFuel setFuelCargo
syn keyword     sqfCommand      setFuelConsumptionCoef setGroupIcon setGroupIconParams
syn keyword     sqfCommand      setGroupIconsSelectable setGroupIconsVisible setGroupid
syn keyword     sqfCommand      setGroupIdGlobal setGroupOwner setGusts setHideBehind
syn keyword     sqfCommand      setHit setHitIndex setHitPointDamage
syn keyword     sqfCommand      setHorizonParallaxCoef setHUDMovementLevels setHumidity
syn keyword     sqfCommand      setIdentity setImportance setInfoPanel setLeader
syn keyword     sqfCommand      setLightAmbient setLightAttenuation setLightBrightness
syn keyword     sqfCommand      setLightColor setLightConePars setLightDayLight
syn keyword     sqfCommand      setLightFlareMaxDistance setLightFlareSize
syn keyword     sqfCommand      setLightIntensity setLightIR setLightnings
syn keyword     sqfCommand      setLightUseFlare setLightVolumeShape setLocalWindParams
syn keyword     sqfCommand      setMagazineTurretAmmo setMarkerAlpha
syn keyword     sqfCommand      setMarkerAlphaLocal setMarkerBrush setMarkerBrushLocal
syn keyword     sqfCommand      setMarkerColor setMarkerColorLocal setMarkerDir
syn keyword     sqfCommand      setMarkerDirLocal setMarkerDrawPriority
syn keyword     sqfCommand      setMarkerPolyline setMarkerPolylineLocal setMarkerPos
syn keyword     sqfCommand      setMarkerPosLocal setMarkerShadow setMarkerShadowLocal
syn keyword     sqfCommand      setMarkerShape setMarkerShapeLocal setMarkerSize
syn keyword     sqfCommand      setMarkerSizeLocal setMarkerText setMarkerTextLocal
syn keyword     sqfCommand      setMarkerType setMarkerTypeLocal setMass setMaxLoad
syn keyword     sqfCommand      setMimic setMissileTarget setMissileTargetPos
syn keyword     sqfCommand      setMousePosition setMusicEffect setMusicEventHandler
syn keyword     sqfCommand      setName setNameSound setObjectArguments
syn keyword     sqfCommand      setObjectMaterial setObjectMaterialGlobal
syn keyword     sqfCommand      setObjectProxy setObjectScale setObjectTexture
syn keyword     sqfCommand      setObjectTextureGlobal setObjectViewDistance
syn keyword     sqfCommand      setOpticsMode setOvercast setOwner setOxygenRemaining
syn keyword     sqfCommand      setParticleCircle setParticleClass setParticleFire
syn keyword     sqfCommand      setParticleParams setParticleRandom
syn keyword     sqfCommand      setPilotCameraDirection setPilotCameraOpticsMode
syn keyword     sqfCommand      setPilotCameraRotation setPilotCameraTarget
syn keyword     sqfCommand      setPilotLight setPiPEffect setPiPViewDistance setPitch
syn keyword     sqfCommand      setPlateNumber setPlayable setPlayerRespawnTime
syn keyword     sqfCommand      setPlayerVoNVolume setPos setPosASL setPosASL2
syn keyword     sqfCommand      setPosASLW setPosATL setPosition setPosWorld
syn keyword     sqfCommand      setPylonLoadout setPylonsPriority setRadioMsg setRain
syn keyword     sqfCommand      setRainbow setRandomLip setRank setRectangular
syn keyword     sqfCommand      setRepairCargo setRotorBrakeRTD setShadowDistance
syn keyword     sqfCommand      setShotParents setSide setSimpleTaskAlwaysVisible
syn keyword     sqfCommand      setSimpleTaskCustomData setSimpleTaskDescription
syn keyword     sqfCommand      setSimpleTaskDestination setSimpleTaskTarget
syn keyword     sqfCommand      setSimpleTaskType setSimulWeatherLayers setSize
syn keyword     sqfCommand      setSkill setSlingLoad setSoundEffect setSpeaker
syn keyword     sqfCommand      setSpeech setSpeedMode setStamina setStaminaScheme
syn keyword     sqfCommand      setStatValue setSuppression setSystemOfUnits
syn keyword     sqfCommand      setTargetAge setTaskMarkerOffset setTaskResult
syn keyword     sqfCommand      setTaskState setTerrainGrid setTerrainHeight setText
syn keyword     sqfCommand      setTimeMultiplier setTiParameter setTitleEffect
syn keyword     sqfCommand      setTowParent setTrafficDensity setTrafficDistance
syn keyword     sqfCommand      setTrafficGap setTrafficSpeed setTriggerActivation
syn keyword     sqfCommand      setTriggerArea setTriggerInterval setTriggerStatements
syn keyword     sqfCommand      setTriggerText setTriggerTimeout setTriggerType
syn keyword     sqfCommand      setTurretLimits setTurretOpticsMode setType
syn keyword     sqfCommand      setUnconscious setUnitAbility setUnitCombatMode
syn keyword     sqfCommand      setUnitFreefallHeight setUnitLoadout setUnitPos
syn keyword     sqfCommand      setUnitPosWeak setUnitRank setUnitRecoilCoefficient
syn keyword     sqfCommand      setUnitTrait setUnloadInCombat setUserActionText
syn keyword     sqfCommand      setUserMFDText setUserMFDValue setVariable setVectorDir
syn keyword     sqfCommand      setVectorDirAndUp setVectorUp setVehicleAmmo
syn keyword     sqfCommand      setVehicleAmmoDef setVehicleArmor setVehicleCargo
syn keyword     sqfCommand      setVehicleId setVehicleLock setVehiclePosition
syn keyword     sqfCommand      setVehicleRadar setVehicleReceiveRemoteTargets
syn keyword     sqfCommand      setVehicleReportOwnPosition
syn keyword     sqfCommand      setVehicleReportRemoteTargets setVehicleTiPars
syn keyword     sqfCommand      setVehicleVarName setVelocity setVelocityModelSpace
syn keyword     sqfCommand      setVelocityTransformation setViewDistance
syn keyword     sqfCommand      setVisibleIfTreeCollapsed setWantedRPMRTD
syn keyword     sqfCommand      setWaterFillPercentage setWaterLeakiness setWaves
syn keyword     sqfCommand      setWaypointBehaviour setWaypointCombatMode
syn keyword     sqfCommand      setWaypointCompletionRadius setWaypointDescription
syn keyword     sqfCommand      setWaypointForceBehaviour setWaypointFormation
syn keyword     sqfCommand      setWaypointHousePosition setWaypointLoiterAltitude
syn keyword     sqfCommand      setWaypointLoiterRadius setWaypointLoiterType
syn keyword     sqfCommand      setWaypointName setWaypointPosition setWaypointScript
syn keyword     sqfCommand      setWaypointSpeed setWaypointStatements
syn keyword     sqfCommand      setWaypointTimeout setWaypointType setWaypointVisible
syn keyword     sqfCommand      setWeaponReloadingTime setWeaponZeroing setWind
syn keyword     sqfCommand      setWindDir setWindForce setWindStr setWingForceScaleRTD
syn keyword     sqfCommand      setWPPos show3DIcons showChat showCinemaBorder
syn keyword     sqfCommand      showCommandingMenu showCompass showCuratorCompass
syn keyword     sqfCommand      showGps showHUD showLegend showMap
syn keyword     sqfCommand      shownArtilleryComputer shownChat shownCompass
syn keyword     sqfCommand      shownCuratorCompass showNewEditorObject shownGps
syn keyword     sqfCommand      shownHUD shownMap shownPad shownRadio shownScoretable
syn keyword     sqfCommand      shownSubtitles shownUAVFeed shownWarrant shownWatch
syn keyword     sqfCommand      showPad showRadio showScoretable showSubtitles
syn keyword     sqfCommand      showUAVFeed showWarrant showWatch showWaypoint
syn keyword     sqfCommand      showWaypoints side sideAmbientLife sideChat sideEmpty
syn keyword     sqfCommand      sideEnemy sideFriendly sideLogic sideRadio sideUnknown
syn keyword     sqfCommand      simpleTasks simulationEnabled simulCloudDensity
syn keyword     sqfCommand      simulCloudOcclusion simulInClouds simulWeatherSync sin
syn keyword     sqfCommand      size sizeOf skill skillFinal skipTime sleep
syn keyword     sqfCommand      sliderPosition sliderRange sliderSetPosition
syn keyword     sqfCommand      sliderSetRange sliderSetSpeed sliderSpeed
syn keyword     sqfCommand      slingLoadAssistantShown soldierMagazines someAmmo sort
syn keyword     sqfCommand      soundParams soundVolume spawn speaker speechVolume
syn keyword     sqfCommand      speed speedMode splitString sqrt squadParams stance
syn keyword     sqfCommand      startLoadingScreen step stop stopEngineRTD stopped
syn keyword     sqfCommand      stopSound str sunOrMoon supportInfo suppressFor
syn keyword     sqfCommand      surfaceIsWater surfaceNormal surfaceTexture surfaceType
syn keyword     sqfCommand      swimInDepth switch switchableUnits switchAction
syn keyword     sqfCommand      switchCamera switchGesture switchLight switchMove
syn keyword     sqfCommand      synchronizedObjects synchronizedTriggers
syn keyword     sqfCommand      synchronizedWaypoints synchronizeObjectsAdd
syn keyword     sqfCommand      synchronizeObjectsRemove synchronizeTrigger
syn keyword     sqfCommand      synchronizeWaypoint systemChat systemOfUnits systemTime
syn keyword     sqfCommand      systemTimeUTC

syn keyword     sqfCommand      tan targetKnowledge targets targetsAggregate
syn keyword     sqfCommand      targetsQuery taskAlwaysVisible taskChildren
syn keyword     sqfCommand      taskCompleted taskCustomData taskDescription
syn keyword     sqfCommand      taskDestination taskHint taskMarkerOffset taskName
syn keyword     sqfCommand      taskNull taskParent taskResult taskState taskType
syn keyword     sqfCommand      teamMember teamMemberNull teamName teams teamSwitch
syn keyword     sqfCommand      teamSwitchEnabled teamType terminate terrainIntersect
syn keyword     sqfCommand      terrainIntersectASL terrainIntersectAtASL text textLog
syn keyword     sqfCommand      textLogFormat tg then throw time timeMultiplier
syn keyword     sqfCommand      titleCut titleFadeOut titleObj titleRsc titleText to
syn keyword     sqfCommand      toArray toFixed toLower toLowerANSI toString toUpper
syn keyword     sqfCommand      toUpperANSI triggerActivated triggerActivation
syn keyword     sqfCommand      triggerAmmo triggerArea triggerAttachedVehicle
syn keyword     sqfCommand      triggerAttachObject triggerAttachVehicle
syn keyword     sqfCommand      triggerDynamicSimulation triggerInterval
syn keyword     sqfCommand      triggerStatements triggerText triggerTimeout
syn keyword     sqfCommand      triggerTimeoutCurrent triggerType trim try turretLocal
syn keyword     sqfCommand      turretOwner turretUnit tvAdd tvClear tvCollapse
syn keyword     sqfCommand      tvCollapseAll tvCount tvCurSel tvData tvDelete tvExpand
syn keyword     sqfCommand      tvExpandAll tvIsSelected tvPicture tvPictureRight
syn keyword     sqfCommand      tvSelection tvSetColor tvSetCurSel tvSetData
syn keyword     sqfCommand      tvSetPicture tvSetPictureColor
syn keyword     sqfCommand      tvSetPictureColorDisabled tvSetPictureColorSelected
syn keyword     sqfCommand      tvSetPictureRight tvSetPictureRightColor
syn keyword     sqfCommand      tvSetPictureRightColorDisabled
syn keyword     sqfCommand      tvSetPictureRightColorSelected tvSetSelectColor
syn keyword     sqfCommand      tvSetSelected tvSetText tvSetTooltip tvSetValue tvSort
syn keyword     sqfCommand      tvSortAll tvSortByValue tvSortByValueAll tvText
syn keyword     sqfCommand      tvTooltip tvValue type typeName typeOf

syn keyword     sqfCommand      UAVControl uiNamespace uiSleep unassignCurator
syn keyword     sqfCommand      unassignItem unassignTeam unassignVehicle underwater
syn keyword     sqfCommand      uniform uniformContainer uniformItems uniformMagazines
syn keyword     sqfCommand      uniqueUnitItems unitAddons unitAimPosition
syn keyword     sqfCommand      unitAimPositionVisual unitBackpack unitCombatMode
syn keyword     sqfCommand      unitIsUAV unitPos unitReady unitRecoilCoefficient units
syn keyword     sqfCommand      unitsBelowHeight unitTurret unlinkItem
syn keyword     sqfCommand      unlockAchievement unregisterTask updateDrawIcon
syn keyword     sqfCommand      updateMenuItem updateObjectTree
syn keyword     sqfCommand      useAIOperMapObstructionTest useAISteeringComponent
syn keyword     sqfCommand      useAudioTimeForMoves userInputDisabled

syn keyword     sqfCommand      values vectorAdd vectorCos vectorCrossProduct
syn keyword     sqfCommand      vectorDiff vectorDir vectorDirVisual vectorDistance
syn keyword     sqfCommand      vectorDistanceSqr vectorDotProduct vectorFromTo
syn keyword     sqfCommand      vectorLinearConversion vectorMagnitude
syn keyword     sqfCommand      vectorMagnitudeSqr vectorModelToWorld
syn keyword     sqfCommand      vectorModelToWorldVisual vectorMultiply
syn keyword     sqfCommand      vectorNormalized vectorSide vectorSideVisual vectorUp
syn keyword     sqfCommand      vectorUpVisual vectorWorldToModel
syn keyword     sqfCommand      vectorWorldToModelVisual vehicle vehicleCargoEnabled
syn keyword     sqfCommand      vehicleChat vehicleMoveInfo vehicleRadio
syn keyword     sqfCommand      vehicleReceiveRemoteTargets vehicleReportOwnPosition
syn keyword     sqfCommand      vehicleReportRemoteTargets vehicles vehicleVarName
syn keyword     sqfCommand      velocity velocityModelSpace verifySignature vest
syn keyword     sqfCommand      vestContainer vestItems vestMagazines viewDistance
syn keyword     sqfCommand      visibleCompass visibleGps visibleMap visiblePosition
syn keyword     sqfCommand      visiblePositionASL visibleScoretable visibleWatch

syn keyword     sqfCommand      waitUntil waterDamaged waves waypointAttachedObject
syn keyword     sqfCommand      waypointAttachedVehicle waypointAttachObject
syn keyword     sqfCommand      waypointAttachVehicle waypointBehaviour
syn keyword     sqfCommand      waypointCombatMode waypointCompletionRadius
syn keyword     sqfCommand      waypointDescription waypointForceBehaviour
syn keyword     sqfCommand      waypointFormation waypointHousePosition
syn keyword     sqfCommand      waypointLoiterAltitude waypointLoiterRadius
syn keyword     sqfCommand      waypointLoiterType waypointName waypointPosition
syn keyword     sqfCommand      waypoints waypointScript waypointsEnabledUAV
syn keyword     sqfCommand      waypointShow waypointSpeed waypointStatements
syn keyword     sqfCommand      waypointTimeout waypointTimeoutCurrent waypointType
syn keyword     sqfCommand      waypointVisible weaponAccessories
syn keyword     sqfCommand      weaponAccessoriesCargo weaponCargo weaponDirection
syn keyword     sqfCommand      weaponDisassemblyEnabled weaponInertia weaponLowered
syn keyword     sqfCommand      weaponReloadingTime weapons weaponsInfo weaponsItems
syn keyword     sqfCommand      weaponsItemsCargo weaponState weaponsTurret weightRTD
syn keyword     sqfCommand      west WFSideText while wind windDir windRTD windStr
syn keyword     sqfCommand      wingsForcesRTD with worldName worldSize worldToModel
syn keyword     sqfCommand      worldToModelVisual worldToScreen

syn keyword     sqfRepeat       do for forEach from to while

syn keyword     sqfKeyword      call callExtension execFSM execVM exitWith
syn keyword     sqfKeyword      scriptDone sleep spawn terminate waitUntil

syn keyword     sqfStatement    commandFSM compile compileFinal count doFSM
syn keyword     sqfStatement    preprocessFile preprocessFilelinenumbers

syn keyword     sqfConditional  case default else if switch then

syn keyword     sqfConstant     civilian controlNull displayNull east grpNull
syn keyword     sqfConstant     independent locationNull netObjNull nil
syn keyword     sqfConstant     objNull resistance scriptNull sideUnknown
syn keyword     sqfConstant     taskNull teamMemberNull west

syn keyword     sqfBoolean      false no true yes

syn keyword     sqfOperator     ! != % && * + - / : < <= == > >= >> \|| ^

syn keyword     sqfExceptional  catch throw try

syn keyword     sqfNamespace    with


" Other weird stuff

syn region      sqfString       start=+L\="+ end=+"+

syn region      sqfComment      start="/\*" end="\*/" extend
syn region      sqfCommentL     start="//" skip="\\$" end="$" keepend

syn region      sqfIncluded     display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match       sqfIncluded     display contained "<[^>]*>"
syn match       sqfInclude      display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=sqfIncluded
syn region      sqfPreProc      start="^\s*\(%:\|#\)\s*\(ifn\?def\|else\|endif\)" skip="\\$" end="$" keepend
syn region      sqfDefine       start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend
syn match       sqfNumber       display "\<\d\+\>"

syn region      sqfLocalVar     display start="\<_\w" end="\>"

syn match       sqfFunction     display "\<\w\+fnc\w\+\>"

let b:current_syntax = "sqf"

hi def link     sqfComment      Comment
hi def link     sqfCommentL     Comment
hi def link     sqfDefine       Macro
hi def link     sqfInclude      Include
hi def link     sqfIncluded     String
hi def link     sqfLocalVar     Special
hi def link     sqfNumber       Number
hi def link     sqfPreProc      PreProc
hi def link     sqfString       String
hi def link     sqfFunction     Function
hi def link     sqfCommand      Function
hi def link     sqfRepeat       Repeat
hi def link     sqfKeyword      Keyword
hi def link     sqfStatement    Statement
hi def link     sqfConditional  Conditional
hi def link     sqfConstant     Constant
hi def link     sqfBoolean      Boolean
hi def link     sqfOperator     Operator
hi def link     sqfExceptional  Exceptional
hi def link     sqfNamespace    Namespace
