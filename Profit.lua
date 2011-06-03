local f = CreateFrame("Frame")
f:RegisterEvent("QUEST_COMPLETE")
f:SetScript("OnEvent", function ()
  local maxPrice, choice = 0, 0
  
  for i = 1, GetNumQuestChoices() do
    local item = GetQuestItemLink("choice", i)
    
    if item then
      local _, _, _, _, _, _, _, _, _, _, vendorPrice = GetItemInfo(item)
      
      if vendorPrice > maxPrice then
        maxPrice, choice = vendorPrice, i
      end
    end
  end
  
  local button = _G["QuestInfoItem"..choice]
  if button then button:Click() end
end)
