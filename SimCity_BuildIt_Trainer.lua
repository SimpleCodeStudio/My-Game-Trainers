--#Locals
local UP_A = {}
local UP_C = {}
local mainText = {}
local bit32 = false
local melon = {}
if gg.getTargetInfo().x64 then
  mainText = "[BETA x64] ♡Free Edition♡"
  melon = gg.makeRequest("https://raw.githubusercontent.com/SimpleCodeStudio/My-Public-Values/refs/heads/main/scbi_x64_data.lua")
  else
  bit32 = true
  gg.alert("Currently 32 bit not supporting due to too many changes.")
  os.exit()
  mainText = "[BETA x32] ♡Free Edition♡"
  melon = gg.makeRequest("https://raw.githubusercontent.com/SimpleCodeStudio/GG-SimCity-BuildIt-Trainer/refs/heads/main/32bit-Pointers%26Ofsets.lua")
end
if not melon or not melon.content then print("Data Can't get!") return end
local httpData = {}
setmetatable(httpData, { __index = _G })
local getMelon, badMelon = load(melon.content, "RemoteScript", "t", httpData)
if not getMelon then print("Lua code can't loaded: ", badMelon) return end
local success, result = pcall(getMelon)
if not success then print("Code can't worked: ", result) return end
local zindex = 0
local freezeMenu_A = false
local warMenu = false
local warP = 1234567890
local warPt = false

--(GUIs)
local TR = "|☑️| "
local WRCNIQ = "|☑️| "
local WRCV = "|☑️| "
local WRC40 = "|☑️| "
local MAI = "|☑️| "
local XP = "|⛏️| "
local k48G = "|💰| "
local m30S = "|👑| "
local FRZ = "|♻️| "
local INF = "|📄| "
local EXT = "|❌️| "
local BLDZ = "|🏗| "
local trGui = "|☑️| "
local maGui = "|☑️| "
local nWCsR = "|☑️| "
local scriptV = "0.2.4_b"
local UpdatedGameVersion = httpData.UGV[1]
local FreezeMenus = {"XP (Premium)", "SIMOLEON", "SIMCASH", "GOLDEN KEY (Premium)", "PLATINUM KEY (Premium)", "NEO SIMOLEON (Premium)", "BACK"}
local strts = 0

--#Functions
function valueNotFound() gg.alert("Searched value not found. Please ask this from developer. (SimpleCodeStudio)") return end
function premiumFeature() a=gg.alert("This menu for premium script. If u want this contact with developer via Whatsapp or Discord (Link or phone number will copy)", "DISCORD", "WHATSAPP", "CANCEL") if a == 1 then gg.copyText("https://discord.gg/8SfqwUkE9g") gg.alert("Discord community link copied.") elseif a == 2 then gg.copyText("+90 552 818 60 82") gg.alert("Whatsapp number is copied.") end end
function usedWarn() gg.alert("Hey! You already used this function. If you want disable, restart the game.") end
function Subtext(x) gg.toast("\n"..x) end
function Offset(of) local o={}; gr=gg.getResults("1"); o[1]={}; o[1].address=gr[1].address+of; o[1].flags=gg.TYPE_DWORD; gg.addListItems(o) end
function OffsetL(of) local o={}; gr=gg.getResults("1"); o[1]={}; o[1].address=gr[1].address+of; o[1].flags=gg.TYPE_QWORD; gg.addListItems(o) end
function OffsetLd(of) local o={}; gr=gg.getResults("1"); o[1]={}; o[1].address=gr[1].address+of; o[1].flags=gg.TYPE_DWORD; gg.addListItems(o) end
function Refine(a) gg.refineNumber(a) end
function Search(d,r) gg.clearResults(); gg.searchNumber(d, r); if gg.getResultsCount() == 0 then valueNotFound() end end
function makEup_a() gg.clearResults(); gg.clearList(); if httpData.up_dataType[2] == "2" then gg.searchNumber(httpData.UP_A[1], gg.TYPE_QWORD); else gg.searchNumber(httpData.UP_A[1], gg.TYPE_BYTE); end local n = tonumber(httpData.up_ff[2]) local of = {"-0x"..n} local o={}; o[1]={}; o[1].address=gg.getResults("1")[1].address+ of[1]; o[1].flags=gg.TYPE_DWORD; gg.addListItems(o); gg.clearResults(); gg.loadResults(gg.getListItems("1")) end
function makEup_c() gg.clearResults(); gg.clearList(); if httpData.up_dataType[1] == "2" then gg.searchNumber(httpData.UP_C[1], gg.TYPE_QWORD); else gg.searchNumber(httpData.UP_C[1], gg.TYPE_BYTE); end local n = tonumber(httpData.up_ff[1]) local o={}; o[1]={}; o[1].address=gg.getResults("1")[1].address+ n; o[1].flags=gg.TYPE_DWORD; gg.addListItems(o); gg.clearResults(); gg.loadResults(gg.getListItems("1")) end
function FindPointer_v1(r) x=gg.getResults("1")[1].address; gg.clearResults(); gg.searchNumber(x, r) if gg.getResultsCount() == 0 then valueNotFound() end return end
function FindPointer_v14(r) x=gg.getResults("14")[14].address; gg.clearResults(); gg.searchNumber(x, r) if gg.getResultsCount() == 0 then valueNotFound() end return end
function FindPointer_v15(r) x=gg.getResults("15")[15].address; gg.clearResults(); gg.searchNumber(x, r) if gg.getResultsCount() == 0 then valueNotFound() end return end
function FindPointer_v17(r) x=gg.getResults("17")[17].address; gg.clearResults(); gg.searchNumber(x, r) if gg.getResultsCount() == 0 then valueNotFound() end return end
function FindPointer_v18(r) x=gg.getResults("18")[18].address; gg.clearResults(); gg.searchNumber(x, r) if gg.getResultsCount() == 0 then valueNotFound() end return end
local function mainMenuSelect() end
local function mainRealServer() end



function warMenus()
  wm = gg.choice({"No War Item Require", "Free Upgrade", "Only Upgrade with 40 value. (Premium)", "BACK"})
  if wm == nil then
    else
    if wm == 1 then
      if WRCNIQ == "|☑️| " then
        WRCNIQ = "|✅️| "
        used1 = true
        Subtext("Please Wait...")
        gg.clearList()
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
        if warPt == true then
          Search(warP,gg.TYPE_DWORD)
          else
          Search("53;4;19;49;38::76",gg.TYPE_DWORD)
          gg.refineNumber("53")
          Offset(httpData.wrcOfsets[1])
          gg.sleep("100")
          warP = gg.getListItems("1")[1].value
          warPt = true
          Search(warP,gg.TYPE_DWORD)
        end
        gg.sleep("100")
        gg.clearList()
        g9 = gg.getResults("30")
        for i, v in ipairs(g9) do
          v.address = v.address + httpData.wrcOfsets[2]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g9)
        gg.sleep("100")
        g10 = gg.getResults("30")
        for i, v in ipairs(g10) do
          v.address = v.address + httpData.wrcOfsets[3]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g10)
        gg.sleep("100")
        g11 = gg.getResults("30")
        for i, v in ipairs(g11) do
          v.address = v.address + httpData.wrcOfsets[4]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.sleep("100")
        gg.addListItems(g11)
        l2 = gg.getListItems("280")
        gg.loadResults(l2)
        gg.getResults("280")
        if bit32 == true then gg.editAll("0",gg.TYPE_DWORD) else gg.editAll("0",gg.TYPE_QWORD) end
        gg.clearResults()
        gg.clearList()
        Subtext("Successfuly")
        else
        usedWarn()
      end
    end
    if wm == 2 then
      local used2 = false
      if WRCV == "|☑️| " then
        WRCV = "|✅️| "
        used2 = true
        Subtext("Please Wait...")
        gg.clearList()
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
        if warPt == true then
          Search(warP,gg.TYPE_DWORD)
          else
          Search("53;4;19;49;38::76",gg.TYPE_DWORD)
          gg.refineNumber("53")
          Offset(httpData.wrcOfsets[1])
          gg.sleep("100")
          warP = gg.getListItems("1")[1].value
          warPt = true
          Search(warP,gg.TYPE_DWORD)
        end
        gg.sleep("100")
        gg.clearList()
        g12 = gg.getResults("30")
        for i, v in ipairs(g12) do
          v.address = v.address + httpData.wrcOfsets[8]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g12)
        gg.sleep("100")
        g13 = gg.getResults("30")
        for i, v in ipairs(g13) do
          v.address = v.address + httpData.wrcOfsets[9]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g13)
        gg.sleep("100")
        g14 = gg.getResults("30")
        for i, v in ipairs(g14) do
          v.address = v.address + httpData.wrcOfsets[10]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g14)
        gg.sleep("100")
        g15 = gg.getResults("30")
        for i, v in ipairs(g15) do
          v.address = v.address + httpData.wrcOfsets[11]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g15)
        gg.sleep("100")
        g16 = gg.getResults("30")
        for i, v in ipairs(g16) do
          v.address = v.address + httpData.wrcOfsets[12]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g16)
        gg.sleep("100")
        g17 = gg.getResults("30")
        for i, v in ipairs(g17) do
          v.address = v.address + httpData.wrcOfsets[13]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g17)
        l2 = gg.getListItems("280")
        gg.loadResults(l2)
        gg.getResults("280")
        if bit32 == true then gg.editAll("0",gg.TYPE_DWORD) else gg.editAll("0",gg.TYPE_QWORD) end
        gg.clearResults()
        gg.clearList()
        Subtext("Successfuly")
        else
        usedWarn()
      end
    end
    if wm == 3 then
      premiumFeature() return
    end
    if wm == 4 then
      warMenu = false
      mainRealServer()
    end
  end
end

function freezeMenu()
  -- This part very old and so mixed. For this reason i didnt care here. This working right? Lol
  fm = gg.multiChoice(FreezeMenus)
  
  if fm == nil then
    else
    local fvls = {}
    local fplc = {}
    g11 = gg.getResults("8")
    function freezeRss()
      local o5 = {}
      o5[1] = {}
      o5[1].address = g11[fplc].address + 0x0
      o5[1].flags = gg.TYPE_DWORD
      o5[1].value = fvls
      o5[1].freeze = true
      o5[1].name = "Hey! Why you looking here??? 🧐🍉"
      gg.addListItems(o5)
      gg.setValues(o5)
    end
    function unFreezeRss()
      local o5 = {}
      o5[1] = {}
      o5[1].address = g11[fplc].address + 0x0
      o5[1].flags = gg.TYPE_DWORD
      o5[1].name = "Hey! Why you looking here??? 🧐🍉"
      gg.addListItems(o5)
    end
    if fm[1] == true then
      premiumFeature()
    end
    if fm[2] == true then
      if FreezeMenus[2] == "SIMOLEON |✅️|" then
        FreezeMenus[2] = "SIMOLEON"
          fplc = 1
          gg.sleep("100")
          unFreezeRss()
          fplc = 2
          gg.sleep("100")
          unFreezeRss()
          fplc = 3
          gg.sleep("100")
          unFreezeRss()
          fplc = 4
          gg.sleep("100")
          unFreezeRss()
          gg.toast("\nSimoleon Unfreezed.")
        else
        FreezeMenus[2] = "SIMOLEON |✅️|"
        fplc = 1
        fvls = g11[1].value
        gg.sleep("100")
        freezeRss()
        fplc = 2
        fvls = g11[2].value
        gg.sleep("100")
        freezeRss()
        fplc = 3
        fvls = g11[3].value
        gg.sleep("100")
        freezeRss()
        fplc = 4
        fvls = g11[4].value
        gg.sleep("100")
        freezeRss()
        gg.toast("\nSimoleon Freezed")
      end
    end
    if fm[3] == true then
      if FreezeMenus[3] == "SIMCASH |✅️|" then
        FreezeMenus[3] = "SIMCASH"
          fplc = 5
          gg.sleep("100")
          unFreezeRss()
          fplc = 6
          gg.sleep("100")
          unFreezeRss()
          fplc = 7
          gg.sleep("100")
          unFreezeRss()
          fplc = 8
          gg.sleep("100")
          unFreezeRss()
          gg.toast("\nSimcash Unfreezed.")
        else
        FreezeMenus[3] = "SIMCASH |✅️|"
        fplc = 5
        fvls = g11[5].value
        gg.sleep("100")
        freezeRss()
        fplc = 6
        fvls = g11[6].value
        gg.sleep("100")
        freezeRss()
        fplc = 7
        fvls = g11[7].value
        gg.sleep("100")
        freezeRss()
        fplc = 8
        fvls = g11[8].value
        gg.sleep("100")
        freezeRss()
        gg.toast("\nSimcash Freezed")
      end
    end
    if fm[4] == true then
      premiumFeature()
    end
    if fm[5] == true then
      premiumFeature()
    end
    if fm[6] == true then
      premiumFeature()
    end
    if fm[7] == true then
      gg.clearList()
      gg.clearResults()
      freezeMenu_A = false
      FreezeMenus[2] = "SIMOLEON"
      FreezeMenus[3] = "SIMCASH"
      Subtext("Freeze mode disabled.")
      return
    end
  end
end

--#Real Server Main Function
function RealServer()
  mrs = gg.choice({"Timer Reseter + No Building Item Require", XP.."XP For All Building Items (Premium)", k48G.."48K Simcash Generator (Not working)", BLDZ.."Buldoze + Store for all buildings. (Premium)", FRZ.."Freeze Currencys", "WAR CARDS MENU", "BACK", EXT.."EXIT"},nil,mainText)
  if mrs == 1 then
    if TR == "|☑️| " then
      TR = "|✅️| "
      WRCNIQ = "|☑️| "
      WRCV = "|☑️| "
      Subtext("Please Wait...")
      gg.clearList()
      gg.setRanges(gg.REGION_C_ALLOC)
      makEup_a()
      if bit32 == true then FindPointer_v1(gg.TYPE_DWORD) else FindPointer_v1(gg.TYPE_QWORD) end
      gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
      if bit32 == true then if gg.getResultsCount() == 58 then FindPointer_v18(gg.TYPE_DWORD) else FindPointer_v17(gg.TYPE_DWORD) end else FindPointer_v18(gg.TYPE_QWORD) end
      gg.sleep("200")
      g3 = gg.getResults("125")
      for i, v in ipairs(g3) do
        v.address = v.address + httpData.timeReseterOfsets[1]
        v.flags = gg.TYPE_DWORD
      end
      gg.addListItems(g3)
      gg.sleep("200")
      g4 = gg.getResults("125")
      for i, v in ipairs(g4) do
        v.address = v.address + httpData.timeReseterOfsets[2]
        if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
      end
      gg.addListItems(g4)
      gg.sleep("200")
      g5 = gg.getResults("125")
      for i, v in ipairs(g5) do
        v.address = v.address + httpData.timeReseterOfsets[3]
        if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
      end
      gg.addListItems(g5)
      gg.sleep("200")
      g6 = gg.getResults("125")
      for i, v in ipairs(g6) do
        v.address = v.address + httpData.timeReseterOfsets[4]
        v.flags = gg.TYPE_QWORD
      end
      gg.addListItems(g6)
      gg.clearResults()
      l1 = gg.getListItems("700")
      gg.loadResults(l1)
      gg.getResults("700")
      if bit32 == false then gg.editAll("0",gg.TYPE_QWORD) end
      gg.editAll("0",gg.TYPE_DWORD)
      gg.clearResults()
      gg.clearList()
      gg.toast("\nSuccessfuly")
      else
      usedWarn()
      return
    end
  end
  if mrs == 2 then
    premiumFeature()
  end
  if mrs == 3 then
    gg.alert("This feature disabled due to not working anymore")
  end
  if mrs == 4 then
    premiumFeature()
  end
  if mrs == 5 then
    Subtext("Freeze mode loading...")
    gg.clearList()
    gg.setRanges(gg.REGION_C_ALLOC)
    makEup_c()
    if bit32 == true then FindPointer_v1(gg.TYPE_DWORD) else FindPointer_v1(gg.TYPE_QWORD) end
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
    if bit32 == true then FindPointer_v1(gg.TYPE_DWORD) else FindPointer_v1(gg.TYPE_QWORD) end
    gg.clearList()
    local lofs = {}
    g25 = gg.getResults("1")
    function loadRss()
      gg.setVisible(false)
      local o4 = {}
      o4[1] = {}
      o4[1].address = g25[1].address + lofs
      o4[1].flags = gg.TYPE_DWORD
      o4[1].name = "Hey! Why you looking here??? 🧐🍉"
      gg.addListItems(o4)
    end
    --xp
    lofs = httpData.freezeOfsets[1]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[2]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[3]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[4]
    gg.sleep("100")
    loadRss()
    --simoleon
    lofs = httpData.freezeOfsets[5]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[6]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[7]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[8]
    gg.sleep("100")
    loadRss()
    --simcash
    lofs = httpData.freezeOfsets[9]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[10]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[11]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[12]
    gg.sleep("100")
    loadRss()
    --golden key
    lofs = httpData.freezeOfsets[13]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[14]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[15]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[16]
    gg.sleep("100")
    loadRss()
    --platinum key
    lofs = httpData.freezeOfsets[17]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[18]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[19]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[20]
    gg.sleep("100")
    loadRss()
    --neo simoleon
    lofs = httpData.freezeOfsets[21]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[22]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[23]
    gg.sleep("100")
    loadRss()
    lofs = httpData.freezeOfsets[24]
    gg.sleep("100")
    loadRss()
    gg.clearResults()
    gg.sleep("100")
    g10 = gg.getListItems("24")
    gg.loadResults(g10)
    gg.toast("Freeze menu loaded.")
    freezeMenu_A = true
    gg.toast("\nFreeze mode loaded.")
  end
  if mrs == 6 then
    warMenu = true
    warMenus()
  end
  if mrs == 7 then
    zindex = 0
    return mainMenuSelect()
  end
  if mrs == 8 then
    gg.setVisible(true)
    print("EXIT SUCCESSFUL👍")
    os.exit()
  end
end

--#Cheat Server Main Functions
function CheatServer()
  c_mm = gg.choice({k48G.."Inf Currencys", nWCsR.."No War Cards Upgrade Require", EXT.."Exit", "BACK"},nil,mainText)
  if c_mm == nil then
    else
    if c_mm == 1 then
      gg.toast("\nPlease Wait...")
      gg.clearResults()
      gg.clearList()
      gg.setRanges(gg.REGION_C_ALLOC)
      gg.searchNumber(UP_C,gg.TYPE_BYTE) --unstablePointer
      gg.sleep("100")
      if gg.getResultsCount() == 0 then
      valueNotFound()
      return
      end
      g23 = gg.getResults("1")
      gg.addListItems(g23)
      g7_1 = gg.getListItems("1")
      gg.clearResults()
      gg.searchNumber(g7_1[1].address,gg.TYPE_QWORD)
      gg.clearList()
      g7_2 = gg.getResults("1")
      gg.addListItems(g7_2)
      gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
      gg.clearResults()
      g24 = gg.getListItems("1")
      gg.searchNumber(g24[1].address,gg.TYPE_QWORD)
      gg.clearList()
      local lofs = {}
      g25 = gg.getResults("1")
      function loadRss()
        gg.setVisible(false)
        local o7 = {}
        o7[1] = {}
        o7[1].address = g25[1].address + lofs
        o7[1].flags = gg.TYPE_DWORD
        o7[1].value = 123456789
        o7[1].name = customName
        gg.addListItems(o7)
        gg.setValues(o7)
      end
      customName = "NOTE: If you do not like the value, enter a random value again."
      gg.sleep("100")
      local o99 = {}
      o99[1] = {}
      o99[1].address = g25[1].address + -0x8
      o99[1].flags = gg.TYPE_DWORD
      o99[1].name = customName
      gg.addListItems(o99)
      --simoleon
      customName = "Simoleon"
      lofs = httpData.freezeOfsets[7]
      gg.sleep("100")
      loadRss()
      --simcash
      customName = "Simcash"
      lofs = httpData.freezeOfsets[11]
      gg.sleep("100")
      loadRss()
      --golden key
      customName = "Golden Key"
      lofs = httpData.freezeOfsets[15]
      gg.sleep("100")
      loadRss()
      --platinum key
      customName = "Platinum Key"
      lofs = httpData.freezeOfsets[19]
      gg.sleep("100")
      loadRss()
      --neo simoleon
      customName = "Neo Simoleon"
      lofs = httpData.freezeOfsets[23]
      gg.sleep("100")
      loadRss()
      gg.clearResults()
      gg.toast("Okay")
    end
    if c_mm == 2 then
      if nWCsR == "|☑️| " then
      nWCsR = "|✅️| "
        gg.clearResults()
        gg.clearList()
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
        gg.searchNumber("53;4;19;49;38::76",gg.TYPE_DWORD)
        if gg.getResultsCount() == 0 then
          valueNotFound()
          return
        end
        gg.refineNumber("53")
        g71 = gg.getResults("1")
        for i, v in ipairs(g71) do
          v.address = v.address + httpData.wrcOfsets[1]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g71)
        gg.clearResults()
        g81 = gg.getListItems("1")
        if bit32 == true then gg.searchNumber(g81[1].value,gg.TYPE_DWORD) else gg.searchNumber(g81[1].value,gg.TYPE_QWORD)  end
        gg.clearList()
        g91 = gg.getResults("30")
        for i, v in ipairs(g91) do
          v.address = v.address + httpData.wrcOfsets[5]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g91)
        gg.sleep("100")
        g101 = gg.getResults("30")
        for i, v in ipairs(g101) do
          v.address = v.address + httpData.wrcOfsets[6]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g101)
        gg.sleep("100")
        g111 = gg.getResults("30")
        for i, v in ipairs(g111) do
          v.address = v.address + httpData.wrcOfsets[7]
          if bit32 == true then v.flags = gg.TYPE_DWORD else v.flags = gg.TYPE_QWORD end
        end
        gg.addListItems(g111)
        g120 = gg.getListItems("80")
        gg.clearResults()
        gg.loadResults(g120)
        gg.getResults("80")
        if bit32 == true then gg.editAll("0",gg.TYPE_DWORD) else gg.editAll("0",gg.TYPE_QWORD) end
        gg.clearResults()
        gg.clearList()
        gg.toast("\nSuccessfuly")
        else
        usedWarn()
        return
      end
    end
    if c_mm == 3 then
      gg.setVisible(true)
      print("EXIT SUCCESSFUL👍")
      os.exit()
    end
    if c_mm == 4 then
      zindex = 0
      return mainMenuSelect()
    end
  end
end

--#Menu Select
function MenuSelect()
  ms = gg.choice({"Real Server", "Cheat Server", "EXIT", "|❗️| INFO"})
  if ms == 1 then
    zindex = 1
    return RealServer()
  end 
  if ms == 2 then
    zindex = 2
    return CheatServer()
  end
  if ms == 3 then
    gg.setVisible(true)
    print("EXIT SUCCESSFUL👍")
    os.exit()
  end
  if ms == 4 then
    local lineI = "\n------------------------------\n"
    gg.alert("Script Info"..lineI.."Developer: ForSimpleHack (SimpleCodeStudio)"..lineI.."Script Version: "..scriptV..""..lineI.."SimCity Version: "..UpdatedGameVersion..""..lineI.."Thanks for using my script!")
  end
end
mainMenuSelect = MenuSelect
mainRealServer = RealServer


--#Main
if gg.getTargetInfo().versionName == UpdatedGameVersion then
  gg.alert("Global Announcement:\n\n"..httpData.onlineAnnouncement[1])
  else
  gg.alert("Script Updated for SimCity BuildIt v"..UpdatedGameVersion.."!")
  os.exit()
end

gg.setVisible(true)
gg.showUiButton()
while true do
  if gg.isVisible(true) then
    if XP == "X" then
      gg.getResults("120")
      gg.editAll("0",gg.TYPE_DWORD)
      gg.clearResults()
      gg.clearList()
      XP = "|⛏️| "
      Subtext("XP Amount disabled.")
    end
    if freezeMenu_A == true then
      gg.setVisible(false)
      freezeMenu()
    end
  end
  if gg.isClickedUiButton() then
    gg.setVisible(false)
    if zindex >= 1 then
        if zindex == 1 then
          if warMenu == true then
            warMenus()
            else RealServer()
          end
        end
        if zindex == 2 then
          CheatServer()
        end
      else
        mainMenuSelect()
    end
  end
end
