/*  
    EQ2Emulator:  Everquest II Server Emulator
    Copyright (C) 2007  EQ2EMulator Development Team (http://www.eq2emulator.net)

    This file is part of EQ2Emulator.

    EQ2Emulator is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    EQ2Emulator is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with EQ2Emulator.  If not, see <http://www.gnu.org/licenses/>.
*/
N(OP_LoginReplyMsg),
N(OP_LoginByNumRequestMsg),
N(OP_WSLoginRequestMsg),
N(OP_ESInitMsg),
N(OP_ESReadyForClientsMsg),
N(OP_CreateZoneInstanceMsg),
N(OP_ZoneInstanceCreateReplyMsg),
N(OP_ZoneInstanceDestroyedMsg),
N(OP_ExpectClientAsCharacterRequest),
N(OP_ExpectClientAsCharacterReplyMs),
N(OP_ZoneInfoMsg),
N(OP_CreateCharacterRequestMsg),
N(OP_DoneLoadingZoneResourcesMsg),
N(OP_DoneSendingInitialEntitiesMsg),
N(OP_DoneLoadingEntityResourcesMsg),
N(OP_PredictionUpdateMsg),
N(OP_RemoteCmdMsg),
N(OP_SetRemoteCmdsMsg),
N(OP_GameWorldTimeMsg),
N(OP_MOTDMsg),
N(OP_ZoneMOTDMsg),
N(OP_GuildRecruitingMemberInfo),
N(OP_GuildRecruiting),
N(OP_GuildRecruitingDetails),
N(OP_GuildRecruitingImage),
N(OP_AvatarCreatedMsg),
N(OP_AvatarDestroyedMsg),
N(OP_RequestCampMsg),
N(OP_MapRequest),
N(OP_CampStartedMsg),
N(OP_CampAbortedMsg),
N(OP_WhoQueryRequestMsg),
N(OP_WhoQueryReplyMsg),
N(OP_MonitorReplyMsg),
N(OP_MonitorCharacterListMsg),
N(OP_MonitorCharacterListRequestMsg),
N(OP_ClientCmdMsg),
N(OP_Lottery),
N(OP_DispatchClientCmdMsg),
N(OP_DispatchESMsg),
N(OP_UpdateTargetMsg),
N(OP_UpdateOpportunityMsg),
N(OP_UpdateTargetLocMsg),
N(OP_UpdateCharacterSheetMsg),
N(OP_UpdateSpellBookMsg),
N(OP_UpdateInventoryMsg),
N(OP_UpdateRecipeBookMsg),
N(OP_RequestRecipeDetailsMsg),
N(OP_RecipeDetailsMsg),
N(OP_UpdateSkillBookMsg),
N(OP_UpdateSkillsMsg),
N(OP_ChangeZoneMsg),
N(OP_ClientTeleportRequestMsg),
N(OP_TeleportWithinZoneMsg),
N(OP_TeleportWithinZoneNoReloadMsg),
N(OP_MigrateClientToZoneRequestMsg),
N(OP_MigrateClientToZoneReplyMsg),
N(OP_ReadyToZoneMsg),
//N(OP_AddClientToGroupMsg),
//N(OP_AddGroupToGroupMsg),
N(OP_RemoveClientFromGroupMsg),
N(OP_RemoveGroupFromGroupMsg),
N(OP_MakeGroupLeaderMsg),
N(OP_GroupCreatedMsg),
N(OP_GroupDestroyedMsg),
N(OP_GroupMemberAddedMsg),
N(OP_GroupMemberRemovedMsg),
N(OP_GroupRemovedFromGroupMsg),
N(OP_GroupLeaderChangedMsg),
N(OP_GroupSettingsChangedMsg),
N(OP_SendLatestRequestMsg),
N(OP_ClearDataMsg),
N(OP_SetSocialMsg),
N(OP_ESStatusMsg),
N(OP_ESZoneInstanceStatusMsg),
N(OP_ZonesStatusRequestMsg),
N(OP_ZonesStatusMsg),
N(OP_ESWeatherRequestMsg),
N(OP_ESWeatherRequestEndMsg),
//N(OP_WSWeatherUpdateMsg),
N(OP_DialogSelectMsg),
N(OP_DialogCloseMsg),
N(OP_RemoveSpellEffectMsg),
N(OP_RemoveConcentrationMsg),
N(OP_QuestJournalOpenMsg),
N(OP_QuestJournalInspectMsg),
//N(OP_SkillSlotMapping),
N(OP_QuestJournalSetVisibleMsg),
N(OP_QuestJournalWaypointMsg),
N(OP_CreateGuildRequestMsg),
N(OP_CreateGuildReplyMsg),
N(OP_GuildsayMsg),
//N(OP_GuildKickMsg),
N(OP_GuildUpdateMsg),
N(OP_FellowshipExpMsg),
N(OP_ConsignmentCloseStoreMsg),
N(OP_ConsignItemRequestMsg),
N(OP_ConsignItemResponseMsg),
//N(OP_PurchaseConsignmentRequestMsg),
N(OP_PurchaseConsignmentLoreCheckRe),
N(OP_QuestReward),
//N(OP_PurchaseConsignmentResponseMsg),
//N(OP_ProcessScriptMsg),
//N(OP_ProcessWorkspaceMsg),
N(OP_HouseDeletedRemotelyMsg),
N(OP_UpdateHouseDataMsg),
N(OP_UpdateHouseAccessDataMsg),
N(OP_PlayerHouseBaseScreenMsg),
N(OP_PlayerHousePurchaseScreenMsg),
N(OP_PlayerHouseAccessUpdateMsg),
N(OP_PlayerHouseDisplayStatusMsg),
N(OP_PlayerHouseCloseUIMsg),
N(OP_BuyPlayerHouseMsg),
N(OP_BuyPlayerHouseTintMsg),
N(OP_CollectAllHouseItemsMsg),
N(OP_RelinquishHouseMsg),
N(OP_EnterHouseMsg),
N(OP_ExitHouseMsg),
N(OP_ExamineConsignmentRequestMsg),
N(OP_MoveableObjectPlacementCriteri),
N(OP_EnterMoveObjectModeMsg),
N(OP_PositionMoveableObject),
N(OP_CancelMoveObjectModeMsg),
N(OP_ShaderCustomizationMsg),
N(OP_ReplaceableSubMeshesMsg),
N(OP_ExamineConsignmentResponseMsg),
N(OP_HouseDefaultAccessSetMsg),
N(OP_HouseAccessSetMsg),
N(OP_HouseAccessRemoveMsg),
N(OP_PayHouseUpkeepMsg),
N(OP_TintWidgetsMsg),
N(OP_UISettingsResponseMsg),
N(OP_UIResetMsg),
N(OP_KeymapLoadMsg),
N(OP_KeymapNoneMsg),
N(OP_KeymapDataMsg),
N(OP_KeymapSaveMsg),
N(OP_DispatchSpellCmdMsg),
N(OP_HouseCustomizationScreenMsg),
N(OP_CustomizationPurchaseRequestMs),
N(OP_CustomizationSetRequestMsg),
N(OP_CustomizationReplyMsg),
N(OP_EntityVerbsRequestMsg),
N(OP_EntityVerbsReplyMsg),
N(OP_EntityVerbsVerbMsg),
N(OP_ChatRelationshipUpdateMsg),
N(OP_ChatCreateChannelMsg),
N(OP_ChatJoinChannelMsg),
N(OP_ChatWhoChannelMsg),
N(OP_ChatLeaveChannelMsg),
N(OP_ChatTellChannelMsg),
N(OP_ChatTellUserMsg),
N(OP_ChatToggleFriendMsg),
N(OP_ChatToggleIgnoreMsg),
N(OP_ChatSendFriendsMsg),
N(OP_ChatSendIgnoresMsg),
N(OP_ChatFiltersMsg),
N(OP_LootItemsRequestMsg),
N(OP_StoppedLootingMsg),
N(OP_SitMsg),
N(OP_StandMsg),
N(OP_SatMsg),
N(OP_StoodMsg),
//N(OP_QuickbarAddMsg),
N(OP_DefaultGroupOptionsRequestMsg),
N(OP_DefaultGroupOptionsMsg),
N(OP_GroupOptionsMsg),
N(OP_DisplayGroupOptionsScreenMsg),
N(OP_DisplayInnVisitScreenMsg),
N(OP_DumpSchedulerMsg),
//N(OP_LSRequestPlayerDescMsg),
N(OP_LSCheckAcctLockMsg),
N(OP_WSAcctLockStatusMsg),
N(OP_RequestHelpRepathMsg),
N(OP_UpdateMotdMsg),
N(OP_RequestTargetLocMsg),
N(OP_PerformPlayerKnockbackMsg),
N(OP_PerformCameraShakeMsg),
N(OP_PopulateSkillMapsMsg),
N(OP_CancelledFeignMsg),
//N(OP_SignalMsg),
N(OP_SkillInfoRequest),
N(OP_SkillInfoResponse),
N(OP_ShowCreateFromRecipeUIMsg),
N(OP_CancelCreateFromRecipeMsg),
N(OP_BeginItemCreationMsg),
N(OP_StopItemCreationMsg),
N(OP_ShowItemCreationProcessUIMsg),
N(OP_UpdateItemCreationProcessUIMsg),
N(OP_DisplayTSEventReactionMsg),
N(OP_ShowRecipeBookMsg),
N(OP_KnowledgebaseRequestMsg),
N(OP_KnowledgebaseResponseMsg),
N(OP_CSTicketHeaderRequestMsg),
N(OP_CSTicketInfoMsg),
N(OP_CSTicketCommentRequestMsg),
N(OP_CSTicketCommentResponseMsg),
N(OP_CSTicketCreateMsg),
N(OP_CSTicketAddCommentMsg),
N(OP_CSTicketDeleteMsg),
N(OP_CSTicketChangeNotificationMsg),
N(OP_WorldDataUpdateMsg),
N(OP_WorldDataChangeMsg),
N(OP_KnownLanguagesMsg),
N(OP_LsRequestClientCrashLogMsg),
N(OP_LsClientBaselogReplyMsg),
N(OP_LsClientCrashlogReplyMsg),
N(OP_LsClientAlertlogReplyMsg),
N(OP_LsClientVerifylogReplyMsg),
N(OP_ClientTeleportToLocationMsg),
N(OP_UpdateClientPredFlagsMsg),
N(OP_ChangeServerControlFlagMsg),
N(OP_CSToolsRequestMsg),
N(OP_CSToolsResponseMsg),
N(OP_CreateBoatTransportsMsg),
N(OP_PositionBoatTransportMsg),
N(OP_MigrateBoatTransportMsg),
N(OP_MigrateBoatTransportReplyMsg),
N(OP_DisplayDebugNLLPointsMsg),
N(OP_ExamineInfoRequestMsg),
N(OP_QuickbarInitMsg),
N(OP_QuickbarUpdateMsg),
N(OP_MacroInitMsg),
N(OP_MacroUpdateMsg),
N(OP_QuestionnaireMsg),
N(OP_LevelChangedMsg),
N(OP_SpellGainedMsg),
N(OP_EncounterBrokenMsg),
N(OP_OnscreenMsgMsg),
N(OP_DisplayWarningMsg),
N(OP_ModifyGuildMsg),
N(OP_GuildEventMsg),
N(OP_GuildEventAddMsg),
N(OP_GuildEventActionMsg),
N(OP_GuildEventListMsg),
N(OP_RequestGuildEventDetailsMsg),
N(OP_GuildEventDetailsMsg),
N(OP_RequestGuildBankEventDetailsMs),
N(OP_GuildBankUpdateMsg),
N(OP_RewardPackMsg),
N(OP_RenameGuildMsg),
N(OP_ZoneToFriendRequestMsg),
N(OP_ZoneToFriendReplyMsg),
N(OP_WaypointRequestMsg),
N(OP_WaypointReplyMsg),
N(OP_WaypointSelectMsg),
N(OP_WaypointUpdateMsg),
N(OP_CharNameChangedMsg),
N(OP_ShowZoneTeleporterDestinations),
N(OP_SelectZoneTeleporterDestinatio),
N(OP_ReloadLocalizedTxtMsg),
N(OP_RequestGuildMembershipMsg),
N(OP_GuildMembershipResponseMsg),
N(OP_LeaveGuildNotifyMsg),
N(OP_JoinGuildNotifyMsg),
N(OP_RequestGuildInfoMsg),
N(OP_GuildBankEventListMsg),
N(OP_AvatarUpdateMsg),
N(OP_BioUpdateMsg),
N(OP_InspectPlayerMsg),
N(OP_WSServerLockMsg),
N(OP_WSServerHideMsg),
N(OP_LSServerLockMsg),
N(OP_CsCategoryRequestMsg),
N(OP_CsCategoryResponseMsg),
N(OP_KnowledgeWindowSlotMappingMsg),
N(OP_LFGUpdateMsg),
N(OP_AFKUpdateMsg),
N(OP_AnonUpdateMsg),
N(OP_UpdateActivePublicZonesMsg),
N(OP_UnknownNpcMsg),
N(OP_PromoFlagsDetailsMsg),
N(OP_ConsignViewCreateMsg),
N(OP_ConsignViewGetPageMsg),
N(OP_ConsignViewReleaseMsg),
N(OP_UpdateDebugRadiiMsg),
N(OP_ConsignRemoveItemsMsg),
//N(OP_SnoopMsg),
N(OP_ReportMsg),
N(OP_UpdateRaidMsg),
N(OP_ConsignViewSortMsg),
N(OP_TitleUpdateMsg),
N(OP_FlightPathsMsg),
N(OP_ClientFellMsg),
N(OP_ClientInDeathRegionMsg),
N(OP_CampClientMsg),
N(OP_GetAvatarAccessRequestForCSToo),
N(OP_CSToolAccessResponseMsg),
N(OP_DeleteGuildMsg),
N(OP_TrackingUpdateMsg),
N(OP_BeginTrackingMsg),
N(OP_StopTrackingMsg),
N(OP_AdvancementRequestMsg),
N(OP_MapFogDataInitMsg),
N(OP_MapFogDataUpdateMsg),
//N(OP_UpdateAvgFrameTimeMsg),
N(OP_CloseGroupInviteWindowMsg),
N(OP_UpdateGroupMemberDataMsg),
N(OP_WorldPingMsg),
N(OP_MoveLogUpdateMsg),
N(OP_OfferQuestMsg),
//N(OP_MailGetHeadersMsg),
N(OP_MailGetMessageMsg),
N(OP_MailSendMessageMsg),
N(OP_MailDeleteMessageMsg),
N(OP_MailGetHeadersReplyMsg),
N(OP_MailGetMessageReplyMsg),
N(OP_MailSendMessageReplyMsg),
N(OP_MailCommitSendMessageMsg),
N(OP_MailSendSystemMessageMsg),
N(OP_MailRemoveAttachFromMailMsg),
N(OP_WorldShutdownUpdateMsg),
N(OP_ClientIdleBeginMsg),
N(OP_ClientIdleEndMsg),
N(OP_DisplayMailScreenMsg),
N(OP_NotifyApprenticeStoppedMentori),
N(OP_CorruptedClientMsg),
N(OP_MailEventNotificationMsg),
N(OP_RestartZoneMsg),
N(OP_CharTransferStartRequestMsg),
N(OP_CharTransferStartReplyMsg),
N(OP_CharTransferRequestMsg),
N(OP_CharTransferReplyMsg),
N(OP_CharTransferRollbackRequestMsg),
N(OP_CharTransferCommitRequestMsg),
N(OP_CharTransferRollbackReplyMsg),
N(OP_CharTransferCommitReplyMsg),
N(OP_GetCharacterSerializedRequestM),
N(OP_GetCharacterSerializedReplyMsg),
N(OP_CreateCharFromCBBRequestMsg),
N(OP_CreateCharFromCBBReplyMsg),
N(OP_HousingDataChangedMsg),
N(OP_HousingRestoreMsg),
N(OP_AuctionItem),
N(OP_AuctionItemReply),
N(OP_AuctionCoin),
N(OP_AuctionCoinReply),
N(OP_AuctionCharacter),
N(OP_AuctionCharacterReply),
N(OP_AuctionCommitMsg),
N(OP_AuctionAbortMsg),
N(OP_CharTransferValidateRequestMsg),
N(OP_CharTransferValidateReplyMsg),
N(OP_CharacterLinkdeadMsg),
N(OP_RaceRestrictionMsg),
N(OP_SetInstanceDisplayNameMsg),
N(OP_EqHearChatCmd),
N(OP_EqDisplayTextCmd),
N(OP_EqCreateGhostCmd),
N(OP_EqCreateWidgetCmd),
N(OP_EqCreateSignWidgetCmd),
N(OP_EqDestroyGhostCmd),
N(OP_EqUpdateGhostCmd),
N(OP_EqSetControlGhostCmd),
N(OP_EqSetPOVGhostCmd),
N(OP_EqHearCombatCmd),
N(OP_EqHearSpellCastCmd),
N(OP_EqHearSpellInterruptCmd),
N(OP_EqHearSpellFizzleCmd),
N(OP_EqHearConsiderCmd),
N(OP_EqUpdateSubClassesCmd),
N(OP_EqCreateListBoxCmd),
N(OP_EqSetDebugPathPointsCmd),
N(OP_EqCannedEmoteCmd),
N(OP_EqStateCmd),
N(OP_EqPlaySoundCmd),
N(OP_EqPlaySound3DCmd),
N(OP_EqPlayVoiceCmd),
N(OP_EqHearDrowningCmd),
N(OP_EqHearDeathCmd),
N(OP_EqGroupMemberRemovedCmd),
N(OP_EqHearChainEffectCmd),
N(OP_EqReceiveOfferCmd),
N(OP_EqInspectPCResultsCmd),
N(OP_EqDrawablePathGraphCmd),
N(OP_EqDialogOpenCmd),
N(OP_EqDialogCloseCmd),
N(OP_EqCollectionUpdateCmd),
N(OP_EqCollectionFilterCmd),
N(OP_EqCollectionItemCmd),
N(OP_EqQuestJournalUpdateCmd),
N(OP_EqQuestJournalReplyCmd),
N(OP_EqQuestGroupCmd),
N(OP_EqUpdateMerchantCmd),
N(OP_EqUpdateStoreCmd),
N(OP_EqUpdatePlayerTradeCmd),
N(OP_EqHelpPathCmd),
N(OP_EqHelpPathClearCmd),
N(OP_EqUpdateBankCmd),
N(OP_EqExamineInfoCmd),
N(OP_EqCloseWindowCmd),
N(OP_EqUpdateLootCmd),
N(OP_EqJunctionListCmd),
N(OP_EqShowDeathWindowCmd),
N(OP_EqDisplaySpellFailCmd),
N(OP_EqSpellCastStartCmd),
N(OP_EqSpellCastEndCmd),
N(OP_EqResurrectedCmd),
N(OP_EqChoiceWinCmd),
N(OP_EqSetDefaultVerbCmd),
N(OP_EqInstructionWindowCmd),
N(OP_EqInstructionWindowCloseCmd),
N(OP_EqInstructionWindowGoalCmd),
N(OP_EqInstructionWindowTaskCmd),
N(OP_EqEnableGameEventCmd),
N(OP_EqShowWindowCmd),
N(OP_EqEnableWindowCmd),
N(OP_EqFlashWindowCmd),
N(OP_EqHearPlayFlavorCmd),
N(OP_EqUpdateSignWidgetCmd),
N(OP_EqDebugPVDCmd),
N(OP_EqShowBookCmd),
N(OP_EqQuestionnaireCmd),
N(OP_EqGetProbsCmd),
N(OP_EqHearHealCmd),
N(OP_EqChatChannelUpdateCmd),
N(OP_EqWhoChannelQueryReplyCmd),
N(OP_EqAvailWorldChannelsCmd),
N(OP_ArenaGameTypesMsg),
N(OP_EqUpdateTargetCmd),
N(OP_EqConsignmentItemsCmd),
N(OP_EqStartBrokerCmd),
N(OP_EqMapExplorationCmd),
N(OP_EqStoreLogCmd),
N(OP_EqSpellMoveToRangeAndRetryCmd),
N(OP_EqUpdatePlayerMailCmd),
N(OP_EqFactionUpdateCmd),
N(OP_UpdateTitleCmd),
N(OP_UpdatePositionMsg),
N(OP_AttackNotAllowed),
N(OP_AttackAllowed),
N(OP_CancelSpellCast),
N(OP_BadLanguageFilter),
N(OP_DressingRoom),
N(OP_TraitsList),
N(OP_PointOfInterest),
N(OP_AdventureList),
N(OP_CharacterAchievements),
N(OP_RecipeList),
N(OP_BagOptions),
N(OP_AchievementUpdateMsg),
N(OP_PetOptions),
N(OP_BrokerAddBag),
N(OP_CharacterPet),
N(OP_ClearForTakeOffMsg),
N(OP_CharacterCurrency),
N(OP_TradeskillList),
N(OP_RecipeBook),
N(OP_CharacterMerc),
N(OP_AfterInvSpellUpdate),
N(OP_CharacterCreatedDungeons),
N(OP_CharacterHousingList),
N(OP_HouseItemsList),
N(OP_CharacterMounts),
N(OP_LoadCalendarEvents),
N(OP_LoadWelcomeWindow),
N(OP_DungeonMakerItemRequest),
N(OP_SysClient),
N(OP_LFGGroupSearch),
N(OP_MarketPlacePrices),
N(OP_MarketFundsUpdate),
N(OP_MarketAddFundsRequest),
N(OP_ZoneBgInstanceList),
N(OP_UIEvent),
N(OP_Launchpad),
N(OP_EQHearThreatCmd),
N(OP_EqHearSpellNoLandCmd),
N(OP_Weakness),
N(OP_SavageBarInitMsg),
N(OP_PetOptionsResponse),
N(OP_CurrentPet),
N(OP_JournalQuestStoryline),
N(OP_DailyObjectives),
N(OP_RecipeListUnknown),
N(OP_EQHearDispellCmd),
N(OP_ClearForLandingMsg),
N(OP_LikeOption),
N(OP_HeritageMsg),
N(OP_OpenCharCust),
N(OP_PaperdollImage),
N(OP_ReadyForTakeOffMsg),
N(OP_EarlyLandingRequestMsg),
N(OP_SubmitCharCust),
N(OP_DietyAbilityWindow),
N(OP_EqTargetItemCmd),